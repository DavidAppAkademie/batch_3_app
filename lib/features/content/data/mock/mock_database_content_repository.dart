import 'package:batch_3_app/features/content/data/database_content_repository.dart';
import 'package:batch_3_app/features/overview/model/content.dart';
import 'package:batch_3_app/mock_database/mock_database_service.dart';

class MockDatabaseContentRepository implements DatabaseContentRepository {
  final MockDatabaseService _mockDatabaseService;

  MockDatabaseContentRepository(this._mockDatabaseService);

  @override
  Future<void> addContent(Content content) async {
    await Future.delayed(const Duration(seconds: 1));
    return _mockDatabaseService.contentList.add(content);
  }

  @override
  Future<List<Content>> getContent() async {
    await Future.delayed(const Duration(seconds: 1));
    return _mockDatabaseService.contentList;
  }
}
