// News API data transfer objects.

import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/news_article.dart';

part 'news_dto.freezed.dart';
part 'news_dto.g.dart';

@freezed
abstract class NewsApiResponse with _$NewsApiResponse {
  const factory NewsApiResponse({
    required String status,
    required int totalResults,
    required List<ArticleDto> articles,
  }) = _NewsApiResponse;

  factory NewsApiResponse.fromJson(Map<String, dynamic> json) =>
      _$NewsApiResponseFromJson(json);
}

@freezed
abstract class SourceDto with _$SourceDto {
  const factory SourceDto({String? id, required String name}) = _SourceDto;

  factory SourceDto.fromJson(Map<String, dynamic> json) =>
      _$SourceDtoFromJson(json);
}

@freezed
abstract class ArticleDto with _$ArticleDto {
  const ArticleDto._();

  const factory ArticleDto({
    required SourceDto source,
    String? author,
    required String title,
    String? description,
    required String url,
    String? urlToImage,
    String? publishedAt,
    String? content,
  }) = _ArticleDto;

  factory ArticleDto.fromJson(Map<String, dynamic> json) =>
      _$ArticleDtoFromJson(json);

  NewsArticle toEntity() {
    final id = url.hashCode.toString();

    DateTime? parsedDate;
    if (publishedAt != null) {
      try {
        parsedDate = DateTime.parse(publishedAt!);
      } catch (_) {}
    }

    return NewsArticle(
      id: id,
      title: title,
      thumbnailUrl: urlToImage,
      date: parsedDate,
      source: source.name,
      author: author,
      description: description,
      url: url,
      contentUrl: content,
    );
  }
}
