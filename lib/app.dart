import 'package:batch_3_app/config/theme.dart';
import 'package:batch_3_app/features/add_content/data/database_add_content_repository.dart';
import 'package:batch_3_app/features/add_content/data/mock/mock_database_add_content_repository.dart';
import 'package:batch_3_app/features/add_feedback/data/database_add_feedback_repository.dart';
import 'package:batch_3_app/features/add_feedback/data/mock/mock_database_add_feedback_repository.dart';
import 'package:batch_3_app/features/overview/data/database_overview_repository.dart';
import 'package:batch_3_app/features/overview/data/mock/mock_database_overview_repository.dart';
import 'package:batch_3_app/features/settings/data/local_storage_repository.dart';
import 'package:batch_3_app/features/settings/data/shared_prefs/shared_prefs_repository.dart';
import 'package:batch_3_app/features/settings/data/shared_prefs/shared_prefs_service.dart';
import 'package:batch_3_app/features/sign_up/presentation/sign_up_page.dart';
import 'package:batch_3_app/mock_database/mock_database_service.dart';
import 'package:flutter/material.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  // Passing this simulated database to all repositories
  late final DatabaseOverviewRepository databaseOverviewRepository;
  late final DatabaseAddFeedbackRepository databaseAddFeedbackRepository;
  late final DatabaseAddContentRepository databaseAddContentRepository;
  late final LocalStorageRepository localStorageRepository;
  late Future<bool> isDarkModeFuture;
  @override
  void initState() {
    super.initState();
    // Create our simulated database (Service)
    // create service object that accesses local storage using shared prefs package
    late final sharedPrefsService = SharedPrefsService();
    final mockDatabaseService = MockDatabaseService();
    databaseOverviewRepository =
        MockDatabaseOverviewRepository(mockDatabaseService);
    databaseAddFeedbackRepository =
        MockDatabaseAddFeedbackRepository(mockDatabaseService);
    databaseAddContentRepository =
        MockDatabaseAddContentRepository(mockDatabaseService);

    localStorageRepository =
        SharedPrefsRepository(sharedPrefsService, (newDarkMode) {
      setState(() {
        isDarkModeFuture = Future.value(newDarkMode);
      });
    });
    isDarkModeFuture = localStorageRepository.getIsDarkMode();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: isDarkModeFuture,
      builder: (context, snapshot) {
        if ((snapshot.connectionState == ConnectionState.waiting &&
                !snapshot.hasData) ||
            snapshot.hasError) {
          // Future laedt noch.... zeige Splash Screen
          // (oder es gab nen Fehler)
          return const MaterialApp(
            home: Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            ),
          );
        } else {
          // Future fertig -> isDarkMode info vorhanden!
          final isDarkMode = snapshot.data!;
          return MaterialApp(
            theme: getLightTheme(),
            darkTheme: getDarkTheme(),
            themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light,
            home: SignUpPage(
              databaseOverviewRepository: databaseOverviewRepository,
              databaseAddFeedbackRepository: databaseAddFeedbackRepository,
              databaseAddContentRepository: databaseAddContentRepository,
              localStorageRepository: localStorageRepository,
            ),
          );
        }
      },
    );
  }
}
