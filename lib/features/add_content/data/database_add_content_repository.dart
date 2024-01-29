import 'package:batch_3_app/features/overview/model/content.dart';

abstract class DatabaseAddContentRepository {
  Future<void> addContent(Content content);
}
