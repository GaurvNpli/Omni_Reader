// Downloaded file entity.

import 'book.dart';

class DownloadedFile {
  final String id;
  final Book book;
  final String localPath;
  final DateTime downloadedAt;
  final int fileSizeBytes;
  final int? lastReadPosition;
  final DateTime? lastOpenedAt;

  const DownloadedFile({
    required this.id,
    required this.book,
    required this.localPath,
    required this.downloadedAt,
    required this.fileSizeBytes,
    this.lastReadPosition,
    this.lastOpenedAt,
  });

  DownloadedFile copyWith({
    String? id,
    Book? book,
    String? localPath,
    DateTime? downloadedAt,
    int? fileSizeBytes,
    int? lastReadPosition,
    DateTime? lastOpenedAt,
  }) {
    return DownloadedFile(
      id: id ?? this.id,
      book: book ?? this.book,
      localPath: localPath ?? this.localPath,
      downloadedAt: downloadedAt ?? this.downloadedAt,
      fileSizeBytes: fileSizeBytes ?? this.fileSizeBytes,
      lastReadPosition: lastReadPosition ?? this.lastReadPosition,
      lastOpenedAt: lastOpenedAt ?? this.lastOpenedAt,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DownloadedFile &&
          runtimeType == other.runtimeType &&
          id == other.id;

  @override
  int get hashCode => id.hashCode;

  @override
  String toString() {
    return 'DownloadedFile(id: $id, localPath: $localPath, downloadedAt: $downloadedAt)';
  }
}
