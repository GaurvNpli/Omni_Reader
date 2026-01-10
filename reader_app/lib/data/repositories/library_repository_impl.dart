// Library repository implementation.

import '../../core/error/result.dart';
import '../../domain/entities/book.dart';
import '../../domain/entities/downloaded_file.dart';
import '../../domain/repositories/library_repository.dart';
import '../datasources/featured_books_datasource.dart';
import '../datasources/library_local_datasource.dart';

class LibraryRepositoryImpl implements LibraryRepository {
  final FeaturedBooksDataSource _featuredBooksDataSource;
  final LibraryLocalDataSource _localDataSource;

  LibraryRepositoryImpl({
    FeaturedBooksDataSource? featuredBooksDataSource,
    LibraryLocalDataSource? localDataSource,
  }) : _featuredBooksDataSource =
           featuredBooksDataSource ?? FeaturedBooksDataSource(),
       _localDataSource = localDataSource ?? LibraryLocalDataSource();

  Future<void> init() async {
    await _localDataSource.init();
  }

  @override
  Future<Result<List<Book>>> getFeaturedBooks() async {
    try {
      final dtos = _featuredBooksDataSource.getFeaturedBooks();
      final books = <Book>[];

      for (final dto in dtos) {
        final isDownloaded = await _localDataSource.isDownloaded(dto.id);
        final downloaded = isDownloaded
            ? await _localDataSource.getDownloadedFile(dto.id)
            : null;

        books.add(
          dto.toEntity().copyWith(
            isDownloaded: isDownloaded,
            localPath: downloaded?.localPath,
          ),
        );
      }

      return Success(books);
    } catch (e) {
      return Success(
        _featuredBooksDataSource
            .getFeaturedBooks()
            .map((dto) => dto.toEntity())
            .toList(),
      );
    }
  }

  @override
  Future<Result<DownloadedFile>> downloadBook(
    Book book, {
    void Function(double progress)? onProgress,
  }) async {
    return _localDataSource.downloadBook(book, onProgress: onProgress);
  }

  @override
  Future<void> cancelDownload(String bookId) async {
    await _localDataSource.cancelDownload(bookId);
  }

  @override
  Future<Result<List<DownloadedFile>>> getDownloadedFiles() async {
    return _localDataSource.getDownloadedFiles();
  }

  @override
  Future<DownloadedFile?> getDownloadedFile(String id) async {
    return _localDataSource.getDownloadedFile(id);
  }

  @override
  Future<bool> isBookDownloaded(String bookId) async {
    return _localDataSource.isDownloaded(bookId);
  }

  @override
  Future<Result<void>> deleteDownloadedFile(String id) async {
    return _localDataSource.deleteFile(id);
  }

  @override
  Future<void> updateLastReadPosition(String id, int position) async {
    await _localDataSource.updateLastReadPosition(id, position);
  }

  @override
  Future<void> markAsOpened(String id) async {
    await _localDataSource.markAsOpened(id);
  }
}
