import 'package:batch_3_app/features/content/data/database_content_repository.dart';
import 'package:batch_3_app/features/overview/model/content.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreContentRepository implements DatabaseContentRepository {
  final FirebaseFirestore _firestore;

  const FirestoreContentRepository(this._firestore);

  @override
  Future<void> addContentSuggestion(Content content) {
    return _firestore.collection('contentSuggestions').add(content.toMap());
  }

  @override
  Future<List<Content>> getContentSuggestions() async {
    final snaps = await _firestore.collection('contentSuggestions').get();
    return snaps.docs.map((e) => Content.fromMap(e.data())).toList();
  }
}
