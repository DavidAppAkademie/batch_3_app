import 'package:batch_3_app/features/overview/model/feedback.dart';

abstract class DatabaseAddFeedbackRepository {
  Future<void> addFeedback(Feedback feedback);
}
