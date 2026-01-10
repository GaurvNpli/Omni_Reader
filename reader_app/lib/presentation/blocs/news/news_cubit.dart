// News state management.

import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/entities/news_article.dart';
import '../../../domain/repositories/news_repository.dart';
import 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  final NewsRepository _repository;
  String _currentCountry = 'us';
  String? _currentCategory;

  NewsCubit({required NewsRepository repository})
    : _repository = repository,
      super(const NewsState.initial());

  Future<void> loadHeadlines({
    String? country,
    String? category,
    bool forceRefresh = false,
  }) async {
    if (country != null) _currentCountry = country;
    _currentCategory = category;

    final previousArticles = _getCurrentArticles();
    emit(NewsState.loading(previousArticles: previousArticles));

    final result = await _repository.getTopHeadlines(
      country: _currentCountry,
      category: _currentCategory,
      forceRefresh: forceRefresh,
    );

    result.fold(
      onSuccess: (articles) {
        emit(
          NewsState.loaded(
            articles: articles,
            lastUpdated: _repository.getLastCacheTime() ?? DateTime.now(),
          ),
        );
      },
      onError: (failure) {
        emit(
          NewsState.error(
            message: failure.message,
            previousArticles: previousArticles,
          ),
        );
      },
    );
  }

  Future<void> refresh() async {
    final currentState = state;
    if (currentState is NewsLoaded) {
      emit(currentState.copyWith(isRefreshing: true));
    }
    await loadHeadlines(forceRefresh: true);
  }

  Future<void> changeCategory(String? category) async {
    await loadHeadlines(category: category, forceRefresh: true);
  }

  Future<void> changeCountry(String country) async {
    await loadHeadlines(country: country, forceRefresh: true);
  }

  List<NewsArticle> _getCurrentArticles() {
    return switch (state) {
      NewsLoaded(:final articles) => articles,
      NewsLoading(:final previousArticles) => previousArticles,
      NewsError(:final previousArticles) => previousArticles,
      NewsInitial() => [],
    };
  }
}
