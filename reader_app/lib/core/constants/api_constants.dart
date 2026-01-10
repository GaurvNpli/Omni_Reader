// API configuration values.

import 'package:flutter_dotenv/flutter_dotenv.dart';

abstract final class ApiConstants {
  static const String newsApiBaseUrl = 'https://newsapi.org/v2';
  static const String topHeadlinesEndpoint = '/top-headlines';
  static const String everythingEndpoint = '/everything';

  static String get newsApiKey {
    final key = dotenv.env['NEWS_API_KEY'];
    assert(
      key != null && key.isNotEmpty,
      'NEWS_API_KEY not configured in .env',
    );
    return key!;
  }

  static const String defaultCountry = 'us';
  static const int defaultPageSize = 20;
  static const int connectionTimeout = 30000;
  static const int receiveTimeout = 30000;
}
