import 'package:batch_3_app/features/overview/model/batch_3_member.dart';
import 'package:batch_3_app/features/overview/model/content.dart';
import 'package:batch_3_app/features/overview/model/design_tutor.dart';
import 'package:batch_3_app/features/overview/model/feedback.dart';
import 'package:batch_3_app/features/overview/model/normal_user.dart';
import 'package:batch_3_app/features/overview/model/tutor.dart';
import 'package:batch_3_app/features/overview/model/user.dart';

class DatabaseRepository {
  // private attributes
  final List<User> _users = [
    DesignTutor("JPUser123", "JP", "Mueller", "jp@web.de"),
    Tutor("Dave", "David", "Sent", "sent@gmail.com"),
    Batch3Member("denizzz", "Deniz", "Tümer", "deniz@web.de"),
    NormalUser("Hans", "Meyer", "randomUser123", "randomuser@yahoo.com"),
  ];
  final List<Content> _contentList = [
    Content("Funktionen", "Das ist eine Beispielbeschreibung zu Funktionen",
        "void main....", "David Sent"),
    Content("Klassen", "Das ist eine Beispielbeschreibung zu Klassen",
        "class bla ....", "David Sent"),
    Content("Abstrakte Klassen", "Das ist eine Beispielbeschreibung zu Klassen",
        "class bla ....", "David Sent"),
  ];
  final List<Feedback> _feedbackList = [
    Feedback(5, "Tolle App :)"),
    Feedback(2, "geht besser -.-"),
  ];

  // constructor
  DatabaseRepository();

  // access methods / functions
  // User functions
  List<User> getUsers() {
    return _users;
  }

  void addUser(User user) {
    _users.add(user);
  }

  void deleteUser(User user) {
    _users.remove(user);
  }

  // Content functions
  List<Content> getContent() {
    return _contentList;
  }

  void addContent(Content content) {
    _contentList.add(content);
  }

  // Feedback functions
  List<Feedback> getFeedback() {
    return _feedbackList;
  }

  void addFeedback(Feedback feedback) {
    _feedbackList.add(feedback);
  }
}
