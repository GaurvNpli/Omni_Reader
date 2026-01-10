// Local storage for downloaded books using Hive.

import 'dart:io';

import 'package:dio/dio.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

import '../../core/constants/app_constants.dart';
import '../../core/error/failure.dart';
import '../../core/error/result.dart';
import '../../core/network/dio_client.dart';
import '../../domain/entities/book.dart';
import '../../domain/entities/downloaded_file.dart';
import '../models/downloaded_file_hive.dart';

class LibraryLocalDataSource {
  final DioClient _client;
  late Box<DownloadedFileHive> _box;
  final Map<String, CancelToken> _activeDownloads = {};

  LibraryLocalDataSource({DioClient? client}) : _client = client ?? DioClient();

  Future<void> init() async {
    _box = await Hive.openBox<DownloadedFileHive>(
      AppConstants.downloadedFilesBox,
    );
  }

  Future<String> get _downloadsDir async {
    final appDir = await getApplicationDocumentsDirectory();
    final downloadsDir = Directory('${appDir.path}/downloads');
    if (!await downloadsDir.exists()) {
      await downloadsDir.create(recursive: true);
    }
    return downloadsDir.path;
  }

  Future<Result<DownloadedFile>> downloadBook(
    Book book, {
    void Function(double progress)? onProgress,
  }) async {
    try {
      final downloadsPath = await _downloadsDir;
      final fileName = '${book.id}${book.fileExtension}';
      final filePath = '$downloadsPath/$fileName';

      final file = File(filePath);
      if (await file.exists()) {
        final existing = _box.get(book.id);
        if (existing != null) {
          return Success(_hiveToEntity(existing));
        }
      }

      final cancelToken = CancelToken();
      _activeDownloads[book.id] = cancelToken;

      final result = await _client.downloadFile(
        book.downloadUrl,
        filePath,
        cancelToken: cancelToken,
        onProgress: (received, total) {
          if (total > 0 && onProgress != null) {
            onProgress(received / total);
          }
        },
      );

      _activeDownloads.remove(book.id);

      return result.fold(
        onSuccess: (path) async {
          final savedFile = File(path);
          final actualSize = await savedFile.length();

          final hiveModel = DownloadedFileHive(
            id: book.id,
            title: book.title,
            localPath: path,
            downloadedAt: DateTime.now(),
            fileSizeBytes: actualSize,
            thumbnailUrl: book.thumbnailUrl,
            author: book.author,
            fileType: book.fileType == BookFileType.pdf ? 'pdf' : 'epub',
            downloadUrl: book.downloadUrl,
            description: book.description,
          );

          await _box.put(book.id, hiveModel);
          return Success(_hiveToEntity(hiveModel));
        },
        onError: (failure) => Error(failure),
      );
    } catch (e) {
      _activeDownloads.remove(book.id);
      return Error(
        DownloadFailure(
          message: 'Failed to download: ${e.toString()}',
          url: book.downloadUrl,
        ),
      );
    }
  }

  Future<void> cancelDownload(String bookId) async {
    final cancelToken = _activeDownloads[bookId];
    if (cancelToken != null && !cancelToken.isCancelled) {
      cancelToken.cancel('Download cancelled by user');
    }
    _activeDownloads.remove(bookId);
  }

  Future<Result<List<DownloadedFile>>> getDownloadedFiles() async {
    try {
      final files = _box.values.map(_hiveToEntity).toList();
      files.sort((a, b) => b.downloadedAt.compareTo(a.downloadedAt));
      return Success(files);
    } catch (e) {
      return const Error(CacheFailure());
    }
  }

  Future<DownloadedFile?> getDownloadedFile(String id) async {
    final hive = _box.get(id);
    return hive != null ? _hiveToEntity(hive) : null;
  }

  Future<bool> isDownloaded(String bookId) async {
    if (!_box.containsKey(bookId)) return false;

    final hive = _box.get(bookId);
    if (hive == null) return false;

    final file = File(hive.localPath);
    return file.existsSync();
  }

  Future<Result<void>> deleteFile(String id) async {
    try {
      final hive = _box.get(id);
      if (hive != null) {
        final file = File(hive.localPath);
        if (await file.exists()) {
          await file.delete();
        }
        await _box.delete(id);
      }
      return const Success(null);
    } catch (e) {
      return Error(
        FileFailure(message: 'Failed to delete file: ${e.toString()}'),
      );
    }
  }

  Future<void> updateLastReadPosition(String id, int position) async {
    final hive = _box.get(id);
    if (hive != null) {
      hive.lastReadPosition = position;
      await hive.save();
    }
  }

  Future<void> markAsOpened(String id) async {
    final hive = _box.get(id);
    if (hive != null) {
      hive.lastOpenedAt = DateTime.now();
      await hive.save();
    }
  }

  DownloadedFile _hiveToEntity(DownloadedFileHive hive) {
    return DownloadedFile(
      id: hive.id,
      book: Book(
        id: hive.id,
        title: hive.title,
        thumbnailUrl: hive.thumbnailUrl,
        author: hive.author,
        description: hive.description,
        fileType: hive.fileType == 'pdf' ? BookFileType.pdf : BookFileType.epub,
        downloadUrl: hive.downloadUrl,
        fileSizeBytes: hive.fileSizeBytes,
        isDownloaded: true,
        localPath: hive.localPath,
      ),
      localPath: hive.localPath,
      downloadedAt: hive.downloadedAt,
      fileSizeBytes: hive.fileSizeBytes,
      lastReadPosition: hive.lastReadPosition,
      lastOpenedAt: hive.lastOpenedAt,
    );
  }
}
