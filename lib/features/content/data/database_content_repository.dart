import 'package:batch_3_app/features/overview/model/content.dart';

abstract class DatabaseContentRepository {
  Future<void> addContentSuggestion(Content content);
  Future<List<Content>> getContentSuggestions();
}
