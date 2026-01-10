// Library page with books and downloads.

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/constants/app_constants.dart';
import '../../core/theme/app_theme.dart';
import '../../domain/entities/book.dart';
import '../blocs/library/library_cubit.dart';
import '../blocs/library/library_state.dart';
import '../widgets/content_card.dart';
import '../widgets/empty_state.dart';
import '../widgets/shimmer_widgets.dart';
import 'pdf_reader_page.dart';
import 'epub_reader_page.dart';

class LibraryPage extends StatefulWidget {
  const LibraryPage({super.key});

  @override
  State<LibraryPage> createState() => _LibraryPageState();
}

class _LibraryPageState extends State<LibraryPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<LibraryCubit>().loadLibrary();
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Library'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'Featured'),
            Tab(text: 'Downloaded'),
          ],
          indicatorColor: AppColors.primary,
          labelColor: AppColors.primary,
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () => context.read<LibraryCubit>().loadLibrary(),
          ),
        ],
      ),
      body: BlocBuilder<LibraryCubit, LibraryState>(
        builder: (context, state) {
          return TabBarView(
            controller: _tabController,
            children: [_buildFeaturedTab(state), _buildDownloadedTab(state)],
          );
        },
      ),
    );
  }

  Widget _buildFeaturedTab(LibraryState state) {
    return switch (state) {
      LibraryInitial() || LibraryLoading() => const BookGridShimmer(),
      LibraryLoaded(
        :final featuredBooks,
        :final downloadProgress,
        :final activeDownloads,
      ) =>
        featuredBooks.isEmpty
            ? const EmptyState(
                icon: Icons.library_books_outlined,
                title: 'No Books Available',
                description: 'Featured books will appear here.',
              )
            : GridView.builder(
                padding: const EdgeInsets.all(AppConstants.paddingMD),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.55,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                ),
                itemCount: featuredBooks.length,
                itemBuilder: (context, index) {
                  final book = featuredBooks[index];
                  return BookCard(
                    book: book,
                    onTap: () => _openBook(book),
                    onDownload: () =>
                        context.read<LibraryCubit>().downloadBook(book),
                    isDownloading: activeDownloads.contains(book.id),
                    downloadProgress: downloadProgress[book.id] ?? 0.0,
                  );
                },
              ),
      LibraryError(:final message) => EmptyState(
        icon: Icons.error_outline,
        title: 'Error Loading Library',
        description: message,
        actionLabel: 'Retry',
        onAction: () => context.read<LibraryCubit>().loadLibrary(),
      ),
    };
  }

  Widget _buildDownloadedTab(LibraryState state) {
    return switch (state) {
      LibraryInitial() || LibraryLoading() => const BookGridShimmer(),
      LibraryLoaded(:final downloadedFiles) =>
        downloadedFiles.isEmpty
            ? EmptyStates.noDownloads(
                onBrowse: () => _tabController.animateTo(0),
              )
            : ListView.builder(
                padding: const EdgeInsets.all(AppConstants.paddingMD),
                itemCount: downloadedFiles.length,
                itemBuilder: (context, index) {
                  final download = downloadedFiles[index];
                  return _buildDownloadedItem(download);
                },
              ),
      LibraryError(:final message) => EmptyState(
        icon: Icons.error_outline,
        title: 'Error Loading Downloads',
        description: message,
        actionLabel: 'Retry',
        onAction: () => context.read<LibraryCubit>().loadLibrary(),
      ),
    };
  }

  Widget _buildDownloadedItem(dynamic downloadedFile) {
    final book = downloadedFile.book as Book;
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Card(
      margin: const EdgeInsets.only(bottom: AppConstants.paddingSM),
      child: ListTile(
        contentPadding: const EdgeInsets.all(AppConstants.paddingSM),
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: book.thumbnailUrl != null
              ? Image.network(
                  book.thumbnailUrl!,
                  width: 50,
                  height: 70,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) =>
                      _buildPlaceholder(),
                )
              : _buildPlaceholder(),
        ),
        title: Text(book.title, maxLines: 2, overflow: TextOverflow.ellipsis),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (book.author != null)
              Text(
                book.author!,
                style: theme.textTheme.bodySmall?.copyWith(
                  color: isDark
                      ? AppColors.textSecondaryDark
                      : AppColors.textSecondaryLight,
                ),
              ),
            const SizedBox(height: 4),
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 6,
                    vertical: 2,
                  ),
                  decoration: BoxDecoration(
                    color: book.fileType == BookFileType.pdf
                        ? Colors.red
                        : AppColors.accent,
                    borderRadius: BorderRadius.circular(4),
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
                const SizedBox(width: 8),
                Text(book.fileSizeFormatted, style: theme.textTheme.bodySmall),
              ],
            ),
          ],
        ),
        trailing: PopupMenuButton<String>(
          onSelected: (value) {
            if (value == 'delete') {
              _confirmDelete(downloadedFile.id);
            }
          },
          itemBuilder: (context) => [
            const PopupMenuItem(
              value: 'delete',
              child: Row(
                children: [
                  Icon(Icons.delete, color: AppColors.error),
                  SizedBox(width: 8),
                  Text('Delete'),
                ],
              ),
            ),
          ],
        ),
        onTap: () => _openBook(book),
      ),
    );
  }

  Widget _buildPlaceholder() {
    return Container(
      width: 50,
      height: 70,
      color: AppColors.backgroundLight,
      child: const Icon(Icons.book, color: AppColors.primary),
    );
  }

  void _openBook(Book book) {
    if (!book.isDownloaded || book.localPath == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please download the book first')),
      );
      return;
    }

    if (book.fileType == BookFileType.pdf) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => PdfReaderPage(book: book)),
      );
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => EpubReaderPage(book: book)),
      );
    }
  }

  void _confirmDelete(String id) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Download'),
        content: const Text(
          'Are you sure you want to delete this downloaded book?',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              this.context.read<LibraryCubit>().deleteDownload(id);
            },
            style: TextButton.styleFrom(foregroundColor: AppColors.error),
            child: const Text('Delete'),
          ),
        ],
      ),
    );
  }
}
