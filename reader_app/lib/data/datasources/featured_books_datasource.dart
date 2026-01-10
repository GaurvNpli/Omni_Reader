// Featured books data source with sample public domain books.

import '../models/book_dto.dart';

class FeaturedBooksDataSource {
  List<BookDto> getFeaturedBooks() {
    return [
      const BookDto(
        id: 'book_1',
        title: 'The Art of War',
        author: 'Sun Tzu',
        description:
            'Ancient Chinese military treatise dating from the 5th century BC. '
            'The Art of War remains the most influential strategy text in East Asian warfare.',
        thumbnailUrl:
            'https://m.media-amazon.com/images/I/71FtqJi-eqL._AC_UF1000,1000_QL80_.jpg',
        downloadUrl: 'https://www.gutenberg.org/files/132/old/132-pdf.pdf',
        fileType: 'pdf',
        fileSizeBytes: 1500000,
        publishedDate: '1910-01-01',
      ),
      const BookDto(
        id: 'book_2',
        title: 'Pride and Prejudice',
        author: 'Jane Austen',
        description:
            'A romantic novel following the emotional development of Elizabeth Bennet, '
            'who learns the error of making hasty judgments.',
        thumbnailUrl:
            'https://m.media-amazon.com/images/I/71Q1tPupKjL._AC_UF1000,1000_QL80_.jpg',
        downloadUrl: 'https://www.gutenberg.org/ebooks/1342.epub.images',
        fileType: 'epub',
        fileSizeBytes: 800000,
        publishedDate: '1813-01-28',
      ),
      const BookDto(
        id: 'book_3',
        title: 'Sherlock Holmes: A Study in Scarlet',
        author: 'Arthur Conan Doyle',
        description:
            'The first appearance of Holmes and Watson, featuring a mysterious murder '
            'in Victorian London.',
        thumbnailUrl:
            'https://m.media-amazon.com/images/I/81HdptG5yEL._AC_UF1000,1000_QL80_.jpg',
        downloadUrl: 'https://www.gutenberg.org/ebooks/244.epub.images',
        fileType: 'epub',
        fileSizeBytes: 600000,
        publishedDate: '1887-01-01',
      ),
      const BookDto(
        id: 'book_4',
        title: 'The Adventures of Tom Sawyer',
        author: 'Mark Twain',
        description:
            'A novel about a young boy growing up along the Mississippi River. '
            'It is set in Missouri in the mid-1800s.',
        thumbnailUrl:
            'https://m.media-amazon.com/images/I/71yf1nRLH9L._AC_UF1000,1000_QL80_.jpg',
        downloadUrl: 'https://www.gutenberg.org/files/74/74-pdf.pdf',
        fileType: 'pdf',
        fileSizeBytes: 1200000,
        publishedDate: '1876-01-01',
      ),
      const BookDto(
        id: 'book_5',
        title: 'Alice\'s Adventures in Wonderland',
        author: 'Lewis Carroll',
        description:
            'A young girl named Alice falls through a rabbit hole into a fantasy world '
            'of anthropomorphic creatures.',
        thumbnailUrl:
            'https://m.media-amazon.com/images/I/71uxSaFQ3+L._AC_UF1000,1000_QL80_.jpg',
        downloadUrl: 'https://www.gutenberg.org/ebooks/11.epub.images',
        fileType: 'epub',
        fileSizeBytes: 500000,
        publishedDate: '1865-11-26',
      ),
      const BookDto(
        id: 'book_6',
        title: 'Frankenstein',
        author: 'Mary Shelley',
        description:
            'The story of Victor Frankenstein, a young scientist who creates a sapient '
            'creature in an unorthodox scientific experiment.',
        thumbnailUrl:
            'https://m.media-amazon.com/images/I/81z7E0uWdtL._AC_UF1000,1000_QL80_.jpg',
        downloadUrl: 'https://www.gutenberg.org/ebooks/84.epub.images',
        fileType: 'epub',
        fileSizeBytes: 700000,
        publishedDate: '1818-01-01',
      ),
      const BookDto(
        id: 'book_7',
        title: 'The Republic',
        author: 'Plato',
        description:
            'Socratic dialogue concerning justice, the order and character of '
            'the just city-state, and the just man.',
        thumbnailUrl:
            'https://m.media-amazon.com/images/I/71TJfD6IWuL._AC_UF1000,1000_QL80_.jpg',
        downloadUrl: 'https://www.gutenberg.org/files/1497/1497-pdf.pdf',
        fileType: 'pdf',
        fileSizeBytes: 2000000,
        publishedDate: '-375-01-01',
      ),
      const BookDto(
        id: 'book_8',
        title: 'Moby Dick',
        author: 'Herman Melville',
        description:
            'The sailor Ishmael\'s narrative of the obsessive quest of Ahab, '
            'captain of the whaling ship Pequod, for revenge against Moby Dick.',
        thumbnailUrl:
            'https://m.media-amazon.com/images/I/41h-ofoROnL._AC_UF1000,1000_QL80_.jpg',
        downloadUrl: 'https://www.gutenberg.org/ebooks/2701.epub.images',
        fileType: 'epub',
        fileSizeBytes: 1100000,
        publishedDate: '1851-10-18',
      ),
    ];
  }
}
