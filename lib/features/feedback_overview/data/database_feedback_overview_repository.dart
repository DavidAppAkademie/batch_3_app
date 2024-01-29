import 'package:batch_3_app/features/overview/model/feedback.dart';

abstract class DatabaseFeedbackOverviewRepository {
  Future<List<Feedback>> getFeedback();
}
