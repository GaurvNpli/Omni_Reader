// Book data transfer object.

import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/book.dart';

part 'book_dto.freezed.dart';
part 'book_dto.g.dart';

@freezed
abstract class BookDto with _$BookDto {
  const BookDto._();

  const factory BookDto({
    required String id,
    required String title,
    String? thumbnailUrl,
    String? author,
    String? description,
    required String downloadUrl,
    required String fileType,
    int? fileSizeBytes,
    String? publishedDate,
  }) = _BookDto;

  factory BookDto.fromJson(Map<String, dynamic> json) =>
      _$BookDtoFromJson(json);

  Book toEntity() {
    DateTime? parsedDate;
    if (publishedDate != null) {
      try {
        parsedDate = DateTime.parse(publishedDate!);
      } catch (_) {}
    }

    return Book(
      id: id,
      title: title,
      thumbnailUrl: thumbnailUrl,
      date: parsedDate,
      fileType: fileType.toLowerCase() == 'epub'
          ? BookFileType.epub
          : BookFileType.pdf,
      downloadUrl: downloadUrl,
      fileSizeBytes: fileSizeBytes,
      author: author,
      description: description,
    );
  }
}

@freezed
abstract class FeaturedBooksResponse with _$FeaturedBooksResponse {
  const factory FeaturedBooksResponse({required List<BookDto> books}) =
      _FeaturedBooksResponse;

  factory FeaturedBooksResponse.fromJson(Map<String, dynamic> json) =>
      _$FeaturedBooksResponseFromJson(json);
}
