// News repository with caching.

import '../../core/constants/app_constants.dart';
import '../../core/error/result.dart';
import '../../domain/entities/news_article.dart';
import '../../domain/repositories/news_repository.dart';
import '../datasources/news_remote_datasource.dart';
import '../models/news_dto.dart';

class NewsRepositoryImpl implements NewsRepository {
  final NewsRemoteDataSource _remoteDataSource;

  List<NewsArticle>? _cachedArticles;
  DateTime? _lastCacheTime;
  String? _cacheKey;

  NewsRepositoryImpl({NewsRemoteDataSource? remoteDataSource})
    : _remoteDataSource = remoteDataSource ?? NewsRemoteDataSource();

  @override
  Future<Result<List<NewsArticle>>> getTopHeadlines({
    String country = 'us',
    String? category,
    bool forceRefresh = false,
  }) async {
    final currentCacheKey = '$country-$category';

    if (!forceRefresh &&
        _cachedArticles != null &&
        _cacheKey == currentCacheKey &&
        _isCacheValid()) {
      return Success(_cachedArticles!);
    }

    final result = await _remoteDataSource.getTopHeadlines(
      country: country,
      category: category,
    );

    return result.fold(
      onSuccess: (dtos) {
        final articles = _convertAndCache(dtos, currentCacheKey);
        return Success(articles);
      },
      onError: (failure) {
        if (_cachedArticles != null) {
          return Success(_cachedArticles!);
        }
        return Error(failure);
      },
    );
  }

  @override
  Future<Result<List<NewsArticle>>> searchNews({
    required String query,
    int page = 1,
    int pageSize = 20,
  }) async {
    final result = await _remoteDataSource.searchNews(
      query: query,
      page: page,
      pageSize: pageSize,
    );

    return result.map((dtos) => dtos.map((dto) => dto.toEntity()).toList());
  }

  @override
  Future<void> clearCache() async {
    _cachedArticles = null;
    _lastCacheTime = null;
    _cacheKey = null;
  }

  @override
  DateTime? getLastCacheTime() => _lastCacheTime;

  bool _isCacheValid() {
    if (_lastCacheTime == null) return false;
    final now = DateTime.now();
    final difference = now.difference(_lastCacheTime!);
    return difference.inMinutes < AppConstants.newsCacheDurationMinutes;
  }

  List<NewsArticle> _convertAndCache(List<ArticleDto> dtos, String cacheKey) {
    final articles = dtos.map((dto) => dto.toEntity()).toList();
    _cachedArticles = articles;
    _lastCacheTime = DateTime.now();
    _cacheKey = cacheKey;
    return articles;
  }
}
