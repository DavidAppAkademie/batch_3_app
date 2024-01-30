import 'package:batch_3_app/features/overview/data/database_overview_repository.dart';
import 'package:batch_3_app/features/overview/model/content.dart';
import 'package:batch_3_app/mock_database/mock_database_service.dart';

class MockDatabaseOverviewRepository implements DatabaseOverviewRepository {
  final MockDatabaseService _mockDatabaseService;

  // constructor
  MockDatabaseOverviewRepository(this._mockDatabaseService);

  // Content functions
  @override
  Future<List<Content>> getContent() async {
    // simulating slow connection (waiting 2 secs)
    await Future.delayed(const Duration(seconds: 2));
    // return database contents
    return _mockDatabaseService.contentList;
  }
}
