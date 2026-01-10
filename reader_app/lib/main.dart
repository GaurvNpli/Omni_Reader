// Main app entry point.

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'core/theme/app_theme.dart';
import 'data/datasources/library_local_datasource.dart';
import 'data/models/downloaded_file_hive.dart';
import 'data/repositories/library_repository_impl.dart';
import 'data/repositories/news_repository_impl.dart';
import 'domain/repositories/library_repository.dart';
import 'domain/repositories/news_repository.dart';
import 'presentation/blocs/library/library_cubit.dart';
import 'presentation/blocs/news/news_cubit.dart';
import 'presentation/pages/home_page.dart';

final getIt = GetIt.instance;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: '.env');
  await Hive.initFlutter();
  Hive.registerAdapter(DownloadedFileHiveAdapter());
  await _setupDependencies();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ),
  );

  runApp(const ReaderApp());
}

Future<void> _setupDependencies() async {
  final libraryLocalDataSource = LibraryLocalDataSource();
  await libraryLocalDataSource.init();
  getIt.registerSingleton<LibraryLocalDataSource>(libraryLocalDataSource);

  getIt.registerLazySingleton<NewsRepository>(() => NewsRepositoryImpl());

  final libraryRepository = LibraryRepositoryImpl(
    localDataSource: libraryLocalDataSource,
  );
  await libraryRepository.init();
  getIt.registerSingleton<LibraryRepository>(libraryRepository);
}

class ReaderApp extends StatelessWidget {
  const ReaderApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => NewsCubit(repository: getIt<NewsRepository>()),
        ),
        BlocProvider(
          create: (_) => LibraryCubit(repository: getIt<LibraryRepository>()),
        ),
      ],
      child: MaterialApp(
        title: 'Reader',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: ThemeMode.system,
        home: const HomePage(),
      ),
    );
  }
}
