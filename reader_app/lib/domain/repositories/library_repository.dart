// Library repository interface.

import '../../../core/error/result.dart';
import '../entities/book.dart';
import '../entities/downloaded_file.dart';

abstract class LibraryRepository {
  Future<Result<List<Book>>> getFeaturedBooks();

  Future<Result<DownloadedFile>> downloadBook(
    Book book, {
    void Function(double progress)? onProgress,
  });

  Future<void> cancelDownload(String bookId);

  Future<Result<List<DownloadedFile>>> getDownloadedFiles();

  Future<DownloadedFile?> getDownloadedFile(String id);

  Future<bool> isBookDownloaded(String bookId);

  Future<Result<void>> deleteDownloadedFile(String id);

  Future<void> updateLastReadPosition(String id, int position);

  Future<void> markAsOpened(String id);
}
