// Content card widgets.

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../core/constants/app_constants.dart';
import '../../core/theme/app_theme.dart';
import '../../domain/entities/book.dart';
import '../../domain/entities/news_article.dart';

class NewsCard extends StatelessWidget {
  final NewsArticle article;
  final VoidCallback onTap;

  const NewsCard({super.key, required this.article, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Card(
      margin: const EdgeInsets.symmetric(
        horizontal: AppConstants.paddingMD,
        vertical: AppConstants.paddingSM,
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(AppConstants.radiusLG),
        child: Padding(
          padding: const EdgeInsets.all(AppConstants.paddingSM),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(AppConstants.radiusMD),
                child: _buildThumbnail(),
              ),
              const SizedBox(width: AppConstants.paddingMD),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.primary.withValues(alpha: 0.1),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Text(
                            article.source,
                            style: theme.textTheme.labelSmall?.copyWith(
                              color: AppColors.primary,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        const Spacer(),
                        if (article.date != null)
                          Text(
                            _formatDate(article.date!),
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: isDark
                                  ? AppColors.textSecondaryDark
                                  : AppColors.textSecondaryLight,
                            ),
                          ),
                      ],
                    ),
                    const SizedBox(height: AppConstants.paddingSM),
                    Text(
                      article.title,
                      style: theme.textTheme.titleSmall,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    if (article.description != null) ...[
                      const SizedBox(height: 4),
                      Text(
                        article.description!,
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: isDark
                              ? AppColors.textSecondaryDark
                              : AppColors.textSecondaryLight,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildThumbnail() {
    if (article.thumbnailUrl != null && article.thumbnailUrl!.isNotEmpty) {
      return CachedNetworkImage(
        imageUrl: article.thumbnailUrl!,
        width: 100,
        height: 100,
        fit: BoxFit.cover,
        placeholder: (context, url) => Container(
          width: 100,
          height: 100,
          color: AppColors.backgroundLight,
          child: const Icon(Icons.image, color: AppColors.textSecondaryLight),
        ),
        errorWidget: (context, url, error) => Container(
          width: 100,
          height: 100,
          color: AppColors.backgroundLight,
          child: const Icon(Icons.article, color: AppColors.primary),
        ),
      );
    }
    return Container(
      width: 100,
      height: 100,
      color: AppColors.backgroundLight,
      child: const Icon(Icons.article, color: AppColors.primary, size: 40),
    );
  }

  String _formatDate(DateTime date) {
    final now = DateTime.now();
    final diff = now.difference(date);

    if (diff.inMinutes < 60) {
      return '${diff.inMinutes}m ago';
    } else if (diff.inHours < 24) {
      return '${diff.inHours}h ago';
    } else if (diff.inDays < 7) {
      return '${diff.inDays}d ago';
    } else {
      return DateFormat.MMMd().format(date);
    }
  }
}

class BookCard extends StatelessWidget {
  final Book book;
  final VoidCallback onTap;
  final VoidCallback? onDownload;
  final bool isDownloading;
  final double downloadProgress;

  const BookCard({
    super.key,
    required this.book,
    required this.onTap,
    this.onDownload,
    this.isDownloading = false,
    this.downloadProgress = 0.0,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Card(
      child: InkWell(
        onTap: book.isDownloaded ? onTap : null,
        borderRadius: BorderRadius.circular(AppConstants.radiusLG),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 3,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(AppConstants.radiusLG),
                    ),
                    child: _buildThumbnail(),
                  ),
                  Positioned(
                    top: 8,
                    right: 8,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: book.fileType == BookFileType.pdf
                            ? Colors.red
                            : AppColors.accent,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(
                        book.fileType == BookFileType.pdf ? 'PDF' : 'EPUB',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  if (isDownloading)
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.black54,
                        borderRadius: const BorderRadius.vertical(
                          top: Radius.circular(AppConstants.radiusLG),
                        ),
                      ),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircularProgressIndicator(
                              value: downloadProgress,
                              color: Colors.white,
                              strokeWidth: 3,
                            ),
                            const SizedBox(height: 8),
                            Text(
                              '${(downloadProgress * 100).toInt()}%',
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(AppConstants.paddingSM),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      book.title,
                      style: theme.textTheme.titleSmall,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    if (book.author != null) ...[
                      const SizedBox(height: 2),
                      Text(
                        book.author!,
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: isDark
                              ? AppColors.textSecondaryDark
                              : AppColors.textSecondaryLight,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                    const Spacer(),
                    if (book.isDownloaded)
                      Row(
                        children: [
                          Icon(
                            Icons.check_circle,
                            size: 16,
                            color: AppColors.success,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            'Downloaded',
                            style: theme.textTheme.labelSmall?.copyWith(
                              color: AppColors.success,
                            ),
                          ),
                        ],
                      )
                    else if (!isDownloading && onDownload != null)
                      GestureDetector(
                        onTap: onDownload,
                        child: Row(
                          children: [
                            Icon(
                              Icons.download,
                              size: 16,
                              color: AppColors.primary,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              book.fileSizeFormatted,
                              style: theme.textTheme.labelSmall?.copyWith(
                                color: AppColors.primary,
                              ),
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildThumbnail() {
    if (book.thumbnailUrl != null && book.thumbnailUrl!.isNotEmpty) {
      return CachedNetworkImage(
        imageUrl: book.thumbnailUrl!,
        fit: BoxFit.cover,
        placeholder: (context, url) => Container(
          color: AppColors.backgroundLight,
          child: const Icon(Icons.book, color: AppColors.textSecondaryLight),
        ),
        errorWidget: (context, url, error) => Container(
          color: AppColors.backgroundLight,
          child: const Icon(Icons.book, color: AppColors.primary),
        ),
      );
    }
    return Container(
      color: AppColors.backgroundLight,
      child: const Icon(Icons.book, color: AppColors.primary, size: 48),
    );
  }
}
