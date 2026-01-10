// Library state definitions.

import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../domain/entities/book.dart';
import '../../../domain/entities/downloaded_file.dart';

part 'library_state.freezed.dart';

@freezed
sealed class LibraryState with _$LibraryState {
  const factory LibraryState.initial() = LibraryInitial;

  const factory LibraryState.loading() = LibraryLoading;

  const factory LibraryState.loaded({
    required List<Book> featuredBooks,
    required List<DownloadedFile> downloadedFiles,
    @Default({}) Map<String, double> downloadProgress,
    @Default({}) Set<String> activeDownloads,
  }) = LibraryLoaded;

  const factory LibraryState.error({required String message}) = LibraryError;
}
