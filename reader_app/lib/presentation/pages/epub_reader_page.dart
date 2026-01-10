// EPUB reader page.

import 'dart:io';

import 'package:epub_view/epub_view.dart';
import 'package:flutter/material.dart';

import '../../core/constants/app_constants.dart';
import '../../core/theme/app_theme.dart';
import '../../domain/entities/book.dart';

class EpubReaderPage extends StatefulWidget {
  final Book book;

  const EpubReaderPage({super.key, required this.book});

  @override
  State<EpubReaderPage> createState() => _EpubReaderPageState();
}

class _EpubReaderPageState extends State<EpubReaderPage> {
  EpubController? _epubController;
  bool _isLoading = true;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    _initEpub();
  }

  Future<void> _initEpub() async {
    if (widget.book.localPath == null) {
      setState(() {
        _isLoading = false;
        _errorMessage = 'EPUB file not found';
      });
      return;
    }

    try {
      final file = File(widget.book.localPath!);
      if (!await file.exists()) {
        setState(() {
          _isLoading = false;
          _errorMessage = 'EPUB file not found at ${widget.book.localPath}';
        });
        return;
      }

      final bytes = await file.readAsBytes();
      _epubController = EpubController(document: EpubDocument.openData(bytes));

      setState(() {
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
        _errorMessage = 'Failed to open EPUB: ${e.toString()}';
      });
    }
  }

  @override
  void dispose() {
    _epubController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.book.title, overflow: TextOverflow.ellipsis),
        actions: [
          if (_epubController != null)
            IconButton(
              icon: const Icon(Icons.list),
              onPressed: _showTableOfContents,
              tooltip: 'Table of Contents',
            ),
        ],
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    if (_isLoading) {
      return const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(),
            SizedBox(height: 16),
            Text('Loading EPUB...'),
          ],
        ),
      );
    }

    if (_errorMessage != null) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(AppConstants.paddingLG),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.error_outline, size: 64, color: AppColors.error),
              const SizedBox(height: 16),
              Text('Error', style: Theme.of(context).textTheme.headlineSmall),
              const SizedBox(height: 8),
              Text(
                _errorMessage!,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Go Back'),
              ),
            ],
          ),
        ),
      );
    }

    if (_epubController == null) {
      return const Center(child: Text('Unable to load EPUB'));
    }

    return EpubView(
      controller: _epubController!,
      builders: EpubViewBuilders<DefaultBuilderOptions>(
        options: const DefaultBuilderOptions(),
        chapterDividerBuilder: (_) => const Divider(),
      ),
    );
  }

  void _showTableOfContents() {
    if (_epubController == null) return;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(AppConstants.radiusLG),
        ),
      ),
      builder: (context) => DraggableScrollableSheet(
        expand: false,
        initialChildSize: 0.5,
        maxChildSize: 0.9,
        minChildSize: 0.3,
        builder: (context, scrollController) => Column(
          children: [
            Container(
              padding: const EdgeInsets.all(AppConstants.paddingMD),
              child: Row(
                children: [
                  Text(
                    'Table of Contents',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const Spacer(),
                  IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              ),
            ),
            const Divider(height: 1),
            Expanded(
              child: EpubViewTableOfContents(controller: _epubController!),
            ),
          ],
        ),
      ),
    );
  }
}
