# Reader

A content aggregator app built with Flutter. Pulls in news headlines and lets you read PDF/EPUB books offline.

## What it does

- **News Feed** - fetches top headlines from NewsAPI with category filters
- **Book Library** - browse and download public domain books (Project Gutenberg)
- **Offline Reading** - downloaded books are stored locally, works without internet
- **PDF & EPUB support** - built-in readers for both formats

## Getting Started

1. Clone the repo
2. Create a `.env` file in the project root:
   ```
   NEWS_API_KEY=your_api_key_here
   ```
   Get a free key from [newsapi.org](https://newsapi.org/)

3. Install dependencies and run code generation:
   ```bash
   flutter pub get
   dart run build_runner build --delete-conflicting-outputs
   ```

4. Run the app:
   ```bash
   flutter run
   ```

## Tech Stack

- **State Management**: BLoC (flutter_bloc)
- **DI**: get_it
- **Local Storage**: Hive
- **Networking**: Dio
- **Code Gen**: Freezed + json_serializable

The project follows clean architecture - data, domain, and presentation layers are separated. Makes it easier to test and maintain as it grows.

## Project Structure

```
lib/
├── core/          # theme, constants, error handling, network client
├── data/          # repositories impl, data sources, DTOs
├── domain/        # entities, repository interfaces
├── presentation/  # BLoCs, pages, widgets
└── main.dart
```

## Notes

- The featured books are hardcoded for demo purposes (all public domain from Gutenberg)
- News caches for 10 minutes to avoid hitting API limits
- Theme uses Nunito Sans font with a teal color scheme

## Requirements

- Flutter 3.10.4 or higher
- Dart 3.0+
- A NewsAPI key (free tier works fine)

---

Feel free to open issues if something breaks or you have suggestions.
