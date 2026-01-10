// Book entity for PDF and EPUB files.

import '../../../core/constants/app_constants.dart';
import 'content.dart';

enum BookFileType { pdf, epub }

class Book extends Content {
  final BookFileType fileType;
  final String downloadUrl;
  final int? fileSizeBytes;
  final String? author;
  final String? description;
  final bool isDownloaded;
  final String? localPath;
  final double downloadProgress;

  const Book({
    required super.id,
    required super.title,
    super.thumbnailUrl,
    super.date,
    required this.fileType,
    required this.downloadUrl,
    this.fileSizeBytes,
    this.author,
    this.description,
    this.isDownloaded = false,
    this.localPath,
    this.downloadProgress = 0.0,
  }) : super(
         contentType: fileType == BookFileType.pdf
             ? ContentType.pdf
             : ContentType.epub,
       );

  String get fileExtension => fileType == BookFileType.pdf ? '.pdf' : '.epub';

  String get fileSizeFormatted {
    if (fileSizeBytes == null) return 'Unknown size';
    final kb = fileSizeBytes! / 1024;
    if (kb < 1024) return '${kb.toStringAsFixed(1)} KB';
    final mb = kb / 1024;
    return '${mb.toStringAsFixed(1)} MB';
  }

  Book copyWith({
    String? id,
    String? title,
    String? thumbnailUrl,
    DateTime? date,
    BookFileType? fileType,
    String? downloadUrl,
    int? fileSizeBytes,
    String? author,
    String? description,
    bool? isDownloaded,
    String? localPath,
    double? downloadProgress,
  }) {
    return Book(
      id: id ?? this.id,
      title: title ?? this.title,
      thumbnailUrl: thumbnailUrl ?? this.thumbnailUrl,
      date: date ?? this.date,
      fileType: fileType ?? this.fileType,
      downloadUrl: downloadUrl ?? this.downloadUrl,
      fileSizeBytes: fileSizeBytes ?? this.fileSizeBytes,
      author: author ?? this.author,
      description: description ?? this.description,
      isDownloaded: isDownloaded ?? this.isDownloaded,
      localPath: localPath ?? this.localPath,
      downloadProgress: downloadProgress ?? this.downloadProgress,
    );
  }

  @override
  String toString() {
    return 'Book(id: $id, title: $title, fileType: $fileType, isDownloaded: $isDownloaded)';
  }
}
