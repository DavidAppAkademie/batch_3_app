import 'package:batch_3_app/features/add_content/data/database_add_content_repository.dart';
import 'package:batch_3_app/features/overview/model/content.dart';
import 'package:batch_3_app/mock_database/mock_database_service.dart';

class MockDatabaseAddContentRepository implements DatabaseAddContentRepository {
  final MockDatabaseService _mockDatabaseService;

  MockDatabaseAddContentRepository(this._mockDatabaseService);

  @override
  Future<void> addContent(Content content) async {
    _mockDatabaseService.contentList.add(content);
    return;
  }
}
