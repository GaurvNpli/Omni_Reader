// NewsAPI remote data source.

import '../../core/constants/api_constants.dart';
import '../../core/error/failure.dart';
import '../../core/error/result.dart';
import '../../core/network/dio_client.dart';
import '../models/news_dto.dart';

class NewsRemoteDataSource {
  final DioClient _client;

  NewsRemoteDataSource({DioClient? client}) : _client = client ?? DioClient();

  Future<Result<List<ArticleDto>>> getTopHeadlines({
    String country = 'us',
    String? category,
    int pageSize = ApiConstants.defaultPageSize,
  }) async {
    final queryParams = <String, dynamic>{
      'country': country,
      'pageSize': pageSize,
      'apiKey': ApiConstants.newsApiKey,
    };

    if (category != null && category.isNotEmpty) {
      queryParams['category'] = category;
    }

    final result = await _client.get<NewsApiResponse>(
      '${ApiConstants.newsApiBaseUrl}${ApiConstants.topHeadlinesEndpoint}',
      queryParameters: queryParams,
      fromJson: (data) =>
          NewsApiResponse.fromJson(data as Map<String, dynamic>),
    );

    return result.map((response) {
      if (response.status != 'ok') {
        throw Exception('NewsAPI returned error status');
      }
      return response.articles;
    });
  }

  Future<Result<List<ArticleDto>>> searchNews({
    required String query,
    int page = 1,
    int pageSize = ApiConstants.defaultPageSize,
  }) async {
    final sanitizedQuery = query.trim();
    if (sanitizedQuery.isEmpty) {
      return const Error(
        ValidationFailure(message: 'Search query cannot be empty'),
      );
    }

    final queryParams = <String, dynamic>{
      'q': sanitizedQuery,
      'page': page,
      'pageSize': pageSize,
      'apiKey': ApiConstants.newsApiKey,
      'sortBy': 'publishedAt',
    };

    final result = await _client.get<NewsApiResponse>(
      '${ApiConstants.newsApiBaseUrl}${ApiConstants.everythingEndpoint}',
      queryParameters: queryParams,
      fromJson: (data) =>
          NewsApiResponse.fromJson(data as Map<String, dynamic>),
    );

    return result.map((response) {
      if (response.status != 'ok') {
        throw Exception('NewsAPI returned error status');
      }
      return response.articles;
    });
  }
}
