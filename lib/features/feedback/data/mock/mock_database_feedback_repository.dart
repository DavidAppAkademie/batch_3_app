import 'package:batch_3_app/features/feedback/data/database_feedback_repository.dart';
import 'package:batch_3_app/features/overview/model/feedback.dart';
import 'package:batch_3_app/mock_database/mock_database_service.dart';

class MockDatabaseFeedbackRepository implements DatabaseFeedbackRepository {
  final MockDatabaseService _mockDatabaseService;

  MockDatabaseFeedbackRepository(this._mockDatabaseService);

  @override
  Future<void> addFeedback(Feedback feedback) async {
    await Future.delayed(const Duration(seconds: 1));
    _mockDatabaseService.feedbackList.add(feedback);
    return;
  }

  @override
  Future<List<Feedback>> getFeedback() async {
    await Future.delayed(const Duration(seconds: 1));
    return _mockDatabaseService.feedbackList;
  }
}
