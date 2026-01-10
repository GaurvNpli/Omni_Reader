// PDF reader page.

import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';

import '../../core/constants/app_constants.dart';
import '../../core/theme/app_theme.dart';
import '../../domain/entities/book.dart';

class PdfReaderPage extends StatefulWidget {
  final Book book;

  const PdfReaderPage({super.key, required this.book});

  @override
  State<PdfReaderPage> createState() => _PdfReaderPageState();
}

class _PdfReaderPageState extends State<PdfReaderPage> {
  int _currentPage = 0;
  int _totalPages = 0;
  bool _isReady = false;
  PDFViewController? _pdfController;

  @override
  Widget build(BuildContext context) {
    if (widget.book.localPath == null) {
      return Scaffold(
        appBar: AppBar(title: Text(widget.book.title)),
        body: const Center(child: Text('PDF file not found')),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.book.title, overflow: TextOverflow.ellipsis),
        actions: [
          if (_isReady)
            Center(
              child: Padding(
                padding: const EdgeInsets.only(right: 16),
                child: Text(
                  '${_currentPage + 1} / $_totalPages',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
            ),
        ],
      ),
      body: Stack(
        children: [
          PDFView(
            filePath: widget.book.localPath!,
            enableSwipe: true,
            swipeHorizontal: false,
            autoSpacing: true,
            pageFling: true,
            pageSnap: true,
            fitPolicy: FitPolicy.BOTH,
            preventLinkNavigation: false,
            onRender: (pages) {
              setState(() {
                _totalPages = pages ?? 0;
                _isReady = true;
              });
            },
            onViewCreated: (controller) {
              _pdfController = controller;
            },
            onPageChanged: (page, total) {
              setState(() {
                _currentPage = page ?? 0;
                _totalPages = total ?? 0;
              });
            },
            onError: (error) {
              debugPrint('PDFView error: $error');
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Error loading PDF: $error')),
              );
            },
          ),
          if (!_isReady)
            Container(
              color: Theme.of(context).scaffoldBackgroundColor,
              child: const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(),
                    SizedBox(height: 16),
                    Text('Loading PDF...'),
                  ],
                ),
              ),
            ),
        ],
      ),
      bottomNavigationBar: _isReady ? _buildBottomBar() : null,
    );
  }

  Widget _buildBottomBar() {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppConstants.paddingMD,
        vertical: AppConstants.paddingSM,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 4,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              icon: const Icon(Icons.first_page),
              onPressed: _currentPage > 0
                  ? () => _pdfController?.setPage(0)
                  : null,
              tooltip: 'First page',
            ),
            IconButton(
              icon: const Icon(Icons.chevron_left),
              onPressed: _currentPage > 0
                  ? () => _pdfController?.setPage(_currentPage - 1)
                  : null,
              tooltip: 'Previous page',
            ),
            Expanded(
              child: Slider(
                value: _currentPage.toDouble(),
                min: 0,
                max: (_totalPages - 1).toDouble().clamp(0, double.infinity),
                onChanged: (value) {
                  _pdfController?.setPage(value.toInt());
                },
                activeColor: AppColors.primary,
              ),
            ),
            IconButton(
              icon: const Icon(Icons.chevron_right),
              onPressed: _currentPage < _totalPages - 1
                  ? () => _pdfController?.setPage(_currentPage + 1)
                  : null,
              tooltip: 'Next page',
            ),
            IconButton(
              icon: const Icon(Icons.last_page),
              onPressed: _currentPage < _totalPages - 1
                  ? () => _pdfController?.setPage(_totalPages - 1)
                  : null,
              tooltip: 'Last page',
            ),
          ],
        ),
      ),
    );
  }
}
