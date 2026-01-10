// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BookDtoImpl _$$BookDtoImplFromJson(Map<String, dynamic> json) =>
    _$BookDtoImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      thumbnailUrl: json['thumbnailUrl'] as String?,
      author: json['author'] as String?,
      description: json['description'] as String?,
      downloadUrl: json['downloadUrl'] as String,
      fileType: json['fileType'] as String,
      fileSizeBytes: (json['fileSizeBytes'] as num?)?.toInt(),
      publishedDate: json['publishedDate'] as String?,
    );

Map<String, dynamic> _$$BookDtoImplToJson(_$BookDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'thumbnailUrl': instance.thumbnailUrl,
      'author': instance.author,
      'description': instance.description,
      'downloadUrl': instance.downloadUrl,
      'fileType': instance.fileType,
      'fileSizeBytes': instance.fileSizeBytes,
      'publishedDate': instance.publishedDate,
    };

_$FeaturedBooksResponseImpl _$$FeaturedBooksResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$FeaturedBooksResponseImpl(
      books: (json['books'] as List<dynamic>)
          .map((e) => BookDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$FeaturedBooksResponseImplToJson(
        _$FeaturedBooksResponseImpl instance) =>
    <String, dynamic>{
      'books': instance.books,
    };
