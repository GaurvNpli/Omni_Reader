// Library state management.

import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/entities/book.dart';
import '../../../domain/repositories/library_repository.dart';
import 'library_state.dart';

class LibraryCubit extends Cubit<LibraryState> {
  final LibraryRepository _repository;

  LibraryCubit({required LibraryRepository repository})
    : _repository = repository,
      super(const LibraryState.initial());

  Future<void> loadLibrary() async {
    emit(const LibraryState.loading());

    final featuredResult = await _repository.getFeaturedBooks();
    final downloadedResult = await _repository.getDownloadedFiles();

    featuredResult.fold(
      onSuccess: (books) {
        downloadedResult.fold(
          onSuccess: (downloads) {
            emit(
              LibraryState.loaded(
                featuredBooks: books,
                downloadedFiles: downloads,
              ),
            );
          },
          onError: (failure) {
            emit(
              LibraryState.loaded(featuredBooks: books, downloadedFiles: []),
            );
          },
        );
      },
      onError: (failure) {
        emit(LibraryState.error(message: failure.message));
      },
    );
  }

  Future<void> downloadBook(Book book) async {
    final currentState = state;
    if (currentState is! LibraryLoaded) return;

    final newActiveDownloads = Set<String>.from(currentState.activeDownloads)
      ..add(book.id);

    emit(
      currentState.copyWith(
        activeDownloads: newActiveDownloads,
        downloadProgress: {...currentState.downloadProgress, book.id: 0.0},
      ),
    );

    final result = await _repository.downloadBook(
      book,
      onProgress: (progress) {
        final state = this.state;
        if (state is LibraryLoaded) {
          emit(
            state.copyWith(
              downloadProgress: {...state.downloadProgress, book.id: progress},
            ),
          );
        }
      },
    );

    result.fold(
      onSuccess: (downloadedFile) async {
        await loadLibrary();
      },
      onError: (failure) {
        final newActive = Set<String>.from(currentState.activeDownloads)
          ..remove(book.id);
        final newProgress = Map<String, double>.from(
          currentState.downloadProgress,
        )..remove(book.id);

        emit(
          currentState.copyWith(
            activeDownloads: newActive,
            downloadProgress: newProgress,
          ),
        );
      },
    );
  }

  Future<void> cancelDownload(String bookId) async {
    await _repository.cancelDownload(bookId);

    final currentState = state;
    if (currentState is LibraryLoaded) {
      final newActive = Set<String>.from(currentState.activeDownloads)
        ..remove(bookId);
      final newProgress = Map<String, double>.from(
        currentState.downloadProgress,
      )..remove(bookId);

      emit(
        currentState.copyWith(
          activeDownloads: newActive,
          downloadProgress: newProgress,
        ),
      );
    }
  }

  Future<void> deleteDownload(String id) async {
    final result = await _repository.deleteDownloadedFile(id);

    result.fold(
      onSuccess: (_) async {
        await loadLibrary();
      },
      onError: (_) {},
    );
  }

  bool isDownloading(String bookId) {
    final currentState = state;
    if (currentState is LibraryLoaded) {
      return currentState.activeDownloads.contains(bookId);
    }
    return false;
  }

  double getDownloadProgress(String bookId) {
    final currentState = state;
    if (currentState is LibraryLoaded) {
      return currentState.downloadProgress[bookId] ?? 0.0;
    }
    return 0.0;
  }
}
