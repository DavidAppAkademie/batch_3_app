import 'package:batch_3_app/features/add_feedback/data/database_add_feedback_repository.dart';
import 'package:batch_3_app/features/overview/model/feedback.dart';
import 'package:batch_3_app/mock_database/mock_database_service.dart';

class MockDatabaseAddFeedbackRepository
    implements DatabaseAddFeedbackRepository {
  final MockDatabaseService _mockDatabaseService;

  MockDatabaseAddFeedbackRepository(this._mockDatabaseService);

  @override
  Future<void> addFeedback(Feedback feedback) async {
    _mockDatabaseService.feedbackList.add(feedback);
    return;
  }
}
