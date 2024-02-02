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

class App extends StatelessWidget {
  const App({super.key});
  @override
  Widget build(BuildContext context) {
    // Create our simulated database (Service)
    final mockDatabaseService = MockDatabaseService();

    // Passing this simulated database to all repositories
    //
    final DatabaseOverviewRepository databaseOverviewRepository =
        MockDatabaseOverviewRepository(mockDatabaseService);

    final DatabaseAddFeedbackRepository databaseAddFeedbackRepository =
        MockDatabaseAddFeedbackRepository(mockDatabaseService);

    final DatabaseAddContentRepository databaseAddContentRepository =
        MockDatabaseAddContentRepository(mockDatabaseService);

    // create service object that accesses local storage using shared prefs package
    final sharedPrefsService = SharedPrefsService();

    // Passing this service object to the local storage repository
    //
    final LocalStorageRepository localStorageRepository =
        SharedPrefsRepository(sharedPrefsService);

    return MaterialApp(
      theme: getLightTheme(),
      darkTheme: getDarkTheme(),
      themeMode: ThemeMode.light,
      home: SignUpPage(
        databaseOverviewRepository: databaseOverviewRepository,
        databaseAddFeedbackRepository: databaseAddFeedbackRepository,
        databaseAddContentRepository: databaseAddContentRepository,
        localStorageRepository: localStorageRepository,
      ),
    );
  }
}
