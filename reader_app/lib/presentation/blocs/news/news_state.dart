// News state definitions.

import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../domain/entities/news_article.dart';

part 'news_state.freezed.dart';

@freezed
sealed class NewsState with _$NewsState {
  const factory NewsState.initial() = NewsInitial;

  const factory NewsState.loading({
    @Default([]) List<NewsArticle> previousArticles,
  }) = NewsLoading;

  const factory NewsState.loaded({
    required List<NewsArticle> articles,
    required DateTime lastUpdated,
    @Default(false) bool isRefreshing,
  }) = NewsLoaded;

  const factory NewsState.error({
    required String message,
    @Default([]) List<NewsArticle> previousArticles,
  }) = NewsError;
}
