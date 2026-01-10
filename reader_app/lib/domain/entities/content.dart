// Base content entity for all content types.

import '../../../core/constants/app_constants.dart';

abstract class Content {
  final String id;
  final String title;
  final String? thumbnailUrl;
  final DateTime? date;
  final ContentType contentType;

  const Content({
    required this.id,
    required this.title,
    this.thumbnailUrl,
    this.date,
    required this.contentType,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Content &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          contentType == other.contentType;

  @override
  int get hashCode => id.hashCode ^ contentType.hashCode;
}
