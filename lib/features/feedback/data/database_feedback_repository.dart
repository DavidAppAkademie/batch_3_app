import 'package:batch_3_app/features/overview/model/feedback.dart';

abstract class DatabaseFeedbackRepository {
  Future<List<Feedback>> getFeedback();
  Future<void> addFeedback(Feedback feedback);
}
