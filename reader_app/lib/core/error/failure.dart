// Failure types for error handling.

sealed class Failure {
  final String message;
  final String? code;

  const Failure({required this.message, this.code});

  @override
  String toString() => 'Failure(message: $message, code: $code)';
}

final class ServerFailure extends Failure {
  final int? statusCode;

  const ServerFailure({required super.message, super.code, this.statusCode});

  @override
  String toString() =>
      'ServerFailure(message: $message, statusCode: $statusCode)';
}

final class NetworkFailure extends Failure {
  const NetworkFailure({
    super.message = 'No internet connection. Please check your network.',
    super.code = 'NETWORK_ERROR',
  });
}

final class CacheFailure extends Failure {
  const CacheFailure({
    super.message = 'Failed to retrieve cached data.',
    super.code = 'CACHE_ERROR',
  });
}

final class FileFailure extends Failure {
  final String? filePath;

  const FileFailure({required super.message, super.code, this.filePath});

  @override
  String toString() => 'FileFailure(message: $message, filePath: $filePath)';
}

final class ValidationFailure extends Failure {
  final String? field;

  const ValidationFailure({
    required super.message,
    super.code = 'VALIDATION_ERROR',
    this.field,
  });
}

final class PermissionFailure extends Failure {
  const PermissionFailure({
    super.message = 'Storage permission is required to download files.',
    super.code = 'PERMISSION_DENIED',
  });
}

final class DownloadFailure extends Failure {
  final String? url;

  const DownloadFailure({
    required super.message,
    super.code = 'DOWNLOAD_ERROR',
    this.url,
  });
}
