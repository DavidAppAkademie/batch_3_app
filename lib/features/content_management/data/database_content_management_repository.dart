import 'package:batch_3_app/features/overview/model/content.dart';

abstract class DatabaseContentManagementRepository {
  Future<void> acceptContent(String contentId);
  Future<void> declineContent(String contentId);
  Future<void> editContent(Content content);
}
