import 'package:batch_3_app/features/content/data/database_content_repository.dart';
import 'package:batch_3_app/features/content/data/mock/mock_database_content_repository.dart';
import 'package:batch_3_app/features/feedback/data/database_feedback_repository.dart';
import 'package:batch_3_app/features/feedback/data/mock/mock_database_feedback_repository.dart';
import 'package:batch_3_app/features/settings/data/local_storage_repository.dart';
import 'package:batch_3_app/features/settings/data/shared_prefs/shared_prefs_repository.dart';
import 'package:batch_3_app/features/settings/data/shared_prefs/shared_prefs_service.dart';
import 'package:batch_3_app/mock_database/mock_database_service.dart';
import 'package:flutter/material.dart';

class RepositoryContainer extends ChangeNotifier {
  late final DatabaseFeedbackRepository databaseFeedbackRepository;
  late final DatabaseContentRepository databaseContentRepository;
  late final LocalStorageRepository localStorageRepository;
  RepositoryContainer() {
    // Create our simulated database (Service)
    // create service object that accesses local storage using shared prefs package
    late final sharedPrefsService = SharedPrefsService();
    final mockDatabaseService = MockDatabaseService();
    databaseFeedbackRepository =
        MockDatabaseFeedbackRepository(mockDatabaseService);
    databaseContentRepository =
        MockDatabaseContentRepository(mockDatabaseService);

    localStorageRepository = SharedPrefsRepository(sharedPrefsService);
  }

  void notifyThemeModeHasChanged() {
    notifyListeners();
  }
}
