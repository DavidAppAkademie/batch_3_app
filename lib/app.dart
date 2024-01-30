import 'package:batch_3_app/config/theme.dart';
import 'package:batch_3_app/features/add_feedback/data/database_add_feedback_repository.dart';
import 'package:batch_3_app/features/add_feedback/data/mock/mock_database_add_feedback_repository.dart';
import 'package:batch_3_app/features/overview/data/database_overview_repository.dart';
import 'package:batch_3_app/features/overview/data/mock/mock_database_overview_repository.dart';
import 'package:batch_3_app/features/sign_up/presentation/sign_up_page.dart';
import 'package:batch_3_app/mock_database/mock_database_service.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});
  @override
  Widget build(BuildContext context) {
    // Erstelle unseren Mock Datenbank Service (simulierte Datenbank)
    final mockDatabaseService = MockDatabaseService();

    final DatabaseOverviewRepository databaseOverviewRepository =
        MockDatabaseOverviewRepository(mockDatabaseService);

    final DatabaseAddFeedbackRepository databaseAddFeedbackRepository =
        MockDatabaseAddFeedbackRepository(mockDatabaseService);

    return MaterialApp(
      theme: getLightTheme(),
      darkTheme: getDarkTheme(),
      themeMode: ThemeMode.light,
      home: SignUpPage(
        databaseOverviewRepository: databaseOverviewRepository,
        databaseAddFeedbackRepository: databaseAddFeedbackRepository,
      ),
    );
  }
}
