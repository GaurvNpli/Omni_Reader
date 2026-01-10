// App-wide constants.

abstract final class AppConstants {
  static const String appName = 'Reader';
  static const String appVersion = '1.0.0';

  // Cache settings
  static const int newsCacheDurationMinutes = 10;
  static const int maxCachedArticles = 100;
  static const int downloadChunkSize = 1024 * 1024; // 1MB

  static const List<String> supportedBookExtensions = ['.epub', '.pdf'];

  // Hive box names
  static const String downloadedFilesBox = 'downloaded_files';
  static const String newsCacheBox = 'news_cache';
  static const String settingsBox = 'settings';

  // Animation durations
  static const Duration shortAnimation = Duration(milliseconds: 200);
  static const Duration mediumAnimation = Duration(milliseconds: 350);
  static const Duration longAnimation = Duration(milliseconds: 500);

  // Spacing
  static const double paddingXS = 4.0;
  static const double paddingSM = 8.0;
  static const double paddingMD = 16.0;
  static const double paddingLG = 24.0;
  static const double paddingXL = 32.0;

  // Corners
  static const double radiusSM = 8.0;
  static const double radiusMD = 12.0;
  static const double radiusLG = 16.0;
  static const double radiusXL = 24.0;
}

enum ContentType { news, pdf, epub }
