// Empty state widgets.

import 'package:flutter/material.dart';
import '../../core/constants/app_constants.dart';
import '../../core/theme/app_theme.dart';

class EmptyState extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;
  final String? actionLabel;
  final VoidCallback? onAction;

  const EmptyState({
    super.key,
    required this.icon,
    required this.title,
    required this.description,
    this.actionLabel,
    this.onAction,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppConstants.paddingXL),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    AppColors.primary.withValues(alpha: 0.1),
                    AppColors.accent.withValues(alpha: 0.1),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, size: 48, color: AppColors.primary),
            ),
            const SizedBox(height: AppConstants.paddingLG),
            Text(
              title,
              style: theme.textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: AppConstants.paddingSM),
            Text(
              description,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: isDark
                    ? AppColors.textSecondaryDark
                    : AppColors.textSecondaryLight,
              ),
              textAlign: TextAlign.center,
            ),
            if (actionLabel != null && onAction != null) ...[
              const SizedBox(height: AppConstants.paddingLG),
              ElevatedButton.icon(
                onPressed: onAction,
                icon: const Icon(Icons.refresh),
                label: Text(actionLabel!),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class EmptyStates {
  EmptyStates._();

  static EmptyState noDownloads({VoidCallback? onBrowse}) {
    return EmptyState(
      icon: Icons.download_outlined,
      title: 'No Downloads Yet',
      description: 'Books you download will appear here for offline reading.',
      actionLabel: onBrowse != null ? 'Browse Books' : null,
      onAction: onBrowse,
    );
  }

  static EmptyState noNews({VoidCallback? onRetry}) {
    return EmptyState(
      icon: Icons.article_outlined,
      title: 'No News Available',
      description: 'Unable to fetch news at the moment. Please try again.',
      actionLabel: onRetry != null ? 'Retry' : null,
      onAction: onRetry,
    );
  }

  static EmptyState noSearchResults() {
    return const EmptyState(
      icon: Icons.search_off,
      title: 'No Results Found',
      description: 'Try adjusting your search terms.',
    );
  }

  static EmptyState networkError({VoidCallback? onRetry}) {
    return EmptyState(
      icon: Icons.wifi_off,
      title: 'No Connection',
      description: 'Please check your internet connection and try again.',
      actionLabel: onRetry != null ? 'Retry' : null,
      onAction: onRetry,
    );
  }
}
