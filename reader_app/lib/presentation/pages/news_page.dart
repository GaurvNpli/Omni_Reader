// News page with headlines.

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../core/constants/app_constants.dart';
import '../../core/theme/app_theme.dart';
import '../blocs/news/news_cubit.dart';
import '../blocs/news/news_state.dart';
import '../widgets/content_card.dart';
import '../widgets/empty_state.dart';
import '../widgets/shimmer_widgets.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({super.key});

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  static const _categories = [
    ('All', null),
    ('Technology', 'technology'),
    ('Business', 'business'),
    ('Sports', 'sports'),
    ('Entertainment', 'entertainment'),
    ('Health', 'health'),
    ('Science', 'science'),
  ];

  int _selectedCategory = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<NewsCubit>().loadHeadlines();
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          expandedHeight: 120,
          floating: true,
          pinned: true,
          flexibleSpace: FlexibleSpaceBar(
            title: Text(
              'Headlines',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            titlePadding: const EdgeInsets.only(left: 16, bottom: 16),
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: _showSearchDialog,
            ),
            IconButton(
              icon: const Icon(Icons.refresh),
              onPressed: () => context.read<NewsCubit>().refresh(),
            ),
          ],
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 50,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              itemCount: _categories.length,
              itemBuilder: (context, index) {
                final category = _categories[index];
                final label = category.$1;
                final isSelected = _selectedCategory == index;
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: ChoiceChip(
                    label: Text(label),
                    selected: isSelected,
                    onSelected: (selected) => _onCategorySelected(index),
                    selectedColor: AppColors.primary.withValues(alpha: 0.2),
                    labelStyle: TextStyle(
                      color: isSelected ? AppColors.primary : null,
                      fontWeight: isSelected ? FontWeight.w600 : null,
                    ),
                  ),
                );
              },
            ),
          ),
        ),
        BlocBuilder<NewsCubit, NewsState>(
          builder: (context, state) {
            return switch (state) {
              NewsInitial() => const SliverFillRemaining(
                child: NewsListShimmer(),
              ),
              NewsLoading(:final previousArticles) =>
                previousArticles.isEmpty
                    ? const SliverFillRemaining(child: NewsListShimmer())
                    : SliverList(
                        delegate: SliverChildBuilderDelegate(
                          (context, index) => NewsCard(
                            article: previousArticles[index],
                            onTap: () =>
                                _openArticle(previousArticles[index].url),
                          ),
                          childCount: previousArticles.length,
                        ),
                      ),
              NewsLoaded(:final articles, :final isRefreshing) =>
                articles.isEmpty
                    ? SliverFillRemaining(
                        child: EmptyStates.noNews(
                          onRetry: () => context.read<NewsCubit>().refresh(),
                        ),
                      )
                    : SliverList(
                        delegate: SliverChildBuilderDelegate(
                          (context, index) {
                            if (index == 0 && isRefreshing) {
                              return const LinearProgressIndicator();
                            }
                            final articleIndex = isRefreshing
                                ? index - 1
                                : index;
                            if (articleIndex < 0 ||
                                articleIndex >= articles.length) {
                              return const SizedBox.shrink();
                            }
                            return NewsCard(
                              article: articles[articleIndex],
                              onTap: () =>
                                  _openArticle(articles[articleIndex].url),
                            );
                          },
                          childCount: articles.length + (isRefreshing ? 1 : 0),
                        ),
                      ),
              NewsError(:final message, :final previousArticles) =>
                previousArticles.isEmpty
                    ? SliverFillRemaining(
                        child: EmptyStates.networkError(
                          onRetry: () => context.read<NewsCubit>().refresh(),
                        ),
                      )
                    : SliverList(
                        delegate: SliverChildBuilderDelegate((context, index) {
                          if (index == 0) {
                            return _buildErrorBanner(message);
                          }
                          return NewsCard(
                            article: previousArticles[index - 1],
                            onTap: () =>
                                _openArticle(previousArticles[index - 1].url),
                          );
                        }, childCount: previousArticles.length + 1),
                      ),
            };
          },
        ),
        const SliverToBoxAdapter(
          child: SizedBox(height: AppConstants.paddingXL),
        ),
      ],
    );
  }

  void _onCategorySelected(int index) {
    setState(() => _selectedCategory = index);
    final category = _categories[index];
    context.read<NewsCubit>().changeCategory(category.$2);
  }

  Future<void> _openArticle(String url) async {
    final uri = Uri.tryParse(url);
    if (uri != null && await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  void _showSearchDialog() {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('Search coming soon!')));
  }

  Widget _buildErrorBanner(String message) {
    return Container(
      margin: const EdgeInsets.all(AppConstants.paddingMD),
      padding: const EdgeInsets.all(AppConstants.paddingSM),
      decoration: BoxDecoration(
        color: AppColors.error.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(AppConstants.radiusSM),
      ),
      child: Row(
        children: [
          const Icon(Icons.warning, color: AppColors.error),
          const SizedBox(width: 8),
          Expanded(
            child: Text(message, style: TextStyle(color: AppColors.error)),
          ),
          TextButton(
            onPressed: () => context.read<NewsCubit>().refresh(),
            child: const Text('Retry'),
          ),
        ],
      ),
    );
  }
}
