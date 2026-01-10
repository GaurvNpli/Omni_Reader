// News article entity.

import '../../../core/constants/app_constants.dart';
import 'content.dart';

class NewsArticle extends Content {
  final String source;
  final String? author;
  final String? description;
  final String url;
  final String? contentUrl;

  const NewsArticle({
    required super.id,
    required super.title,
    super.thumbnailUrl,
    super.date,
    required this.source,
    this.author,
    this.description,
    required this.url,
    this.contentUrl,
  }) : super(contentType: ContentType.news);

  NewsArticle copyWith({
    String? id,
    String? title,
    String? thumbnailUrl,
    DateTime? date,
    String? source,
    String? author,
    String? description,
    String? url,
    String? contentUrl,
  }) {
    return NewsArticle(
      id: id ?? this.id,
      title: title ?? this.title,
      thumbnailUrl: thumbnailUrl ?? this.thumbnailUrl,
      date: date ?? this.date,
      source: source ?? this.source,
      author: author ?? this.author,
      description: description ?? this.description,
      url: url ?? this.url,
      contentUrl: contentUrl ?? this.contentUrl,
    );
  }

  @override
  String toString() {
    return 'NewsArticle(id: $id, title: $title, source: $source)';
  }
}
