// News repository interface.

import '../../../core/error/result.dart';
import '../entities/news_article.dart';

abstract class NewsRepository {
  Future<Result<List<NewsArticle>>> getTopHeadlines({
    String country = 'us',
    String? category,
    bool forceRefresh = false,
  });

  Future<Result<List<NewsArticle>>> searchNews({
    required String query,
    int page = 1,
    int pageSize = 20,
  });

  Future<void> clearCache();

  DateTime? getLastCacheTime();
}
