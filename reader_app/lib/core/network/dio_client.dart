// HTTP client wrapper using Dio.

import 'package:dio/dio.dart';
import '../constants/api_constants.dart';
import '../error/failure.dart';
import '../error/result.dart';

class DioClient {
  late final Dio _dio;

  static final DioClient _instance = DioClient._internal();

  factory DioClient() => _instance;

  DioClient._internal() {
    _dio = Dio(_baseOptions);
    _addInterceptors();
  }

  BaseOptions get _baseOptions => BaseOptions(
    connectTimeout: Duration(milliseconds: ApiConstants.connectionTimeout),
    receiveTimeout: Duration(milliseconds: ApiConstants.receiveTimeout),
    headers: {'Content-Type': 'application/json', 'Accept': 'application/json'},
  );

  void _addInterceptors() {
    _dio.interceptors.addAll([
      LogInterceptor(
        requestBody: true,
        responseBody: true,
        error: true,
        logPrint: (log) {
          assert(() {
            // ignore: avoid_print
            print(log);
            return true;
          }());
        },
      ),
    ]);
  }

  Dio get dio => _dio;

  Future<Result<T>> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    required T Function(dynamic data) fromJson,
  }) async {
    try {
      final response = await _dio.get(
        path,
        queryParameters: queryParameters,
        options: options,
      );
      return Success(fromJson(response.data));
    } on DioException catch (e) {
      return Error(_handleDioError(e));
    } catch (e) {
      return Error(ServerFailure(message: 'Unexpected error: ${e.toString()}'));
    }
  }

  Future<Result<T>> post<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    required T Function(dynamic data) fromJson,
  }) async {
    try {
      final response = await _dio.post(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
      );
      return Success(fromJson(response.data));
    } on DioException catch (e) {
      return Error(_handleDioError(e));
    } catch (e) {
      return Error(ServerFailure(message: 'Unexpected error: ${e.toString()}'));
    }
  }

  Future<Result<String>> downloadFile(
    String url,
    String savePath, {
    void Function(int received, int total)? onProgress,
    CancelToken? cancelToken,
  }) async {
    try {
      await _dio.download(
        url,
        savePath,
        onReceiveProgress: onProgress,
        cancelToken: cancelToken,
      );
      return Success(savePath);
    } on DioException catch (e) {
      return Error(_handleDioError(e));
    } catch (e) {
      return Error(
        DownloadFailure(message: 'Download failed: ${e.toString()}', url: url),
      );
    }
  }

  Failure _handleDioError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return const NetworkFailure(
          message: 'Connection timed out. Please try again.',
        );

      case DioExceptionType.connectionError:
        return const NetworkFailure();

      case DioExceptionType.badResponse:
        final statusCode = error.response?.statusCode;
        final message = _extractErrorMessage(error.response);
        return ServerFailure(message: message, statusCode: statusCode);

      case DioExceptionType.cancel:
        return const ServerFailure(message: 'Request was cancelled.');

      default:
        return ServerFailure(
          message: error.message ?? 'An unexpected error occurred.',
        );
    }
  }

  String _extractErrorMessage(Response? response) {
    if (response?.data case {'message': String message}) {
      return message;
    }
    if (response?.data case {'error': String error}) {
      return error;
    }
    return 'Server error occurred. Please try again.';
  }
}
