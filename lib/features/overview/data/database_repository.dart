import 'package:batch_3_app/features/overview/model/batch_3_member.dart';
import 'package:batch_3_app/features/overview/model/content.dart';
import 'package:batch_3_app/features/overview/model/design_tutor.dart';
import 'package:batch_3_app/features/overview/model/feedback.dart';
import 'package:batch_3_app/features/overview/model/normal_user.dart';
import 'package:batch_3_app/features/overview/model/tutor.dart';
import 'package:batch_3_app/features/overview/model/user.dart';
import 'package:flutter/material.dart' hide Feedback;

class DatabaseRepository {
  // private attributes
  final List<User> _users = [
    DesignTutor("JPUser123", "JP", "Mueller", "jp@web.de"),
    Tutor("Dave", "David", "Sent", "sent@gmail.com"),
    Batch3Member("denizzz", "Deniz", "Tümer", "deniz@web.de"),
    NormalUser("Hans", "Meyer", "randomUser123", "randomuser@yahoo.com"),
  ];
  final List<Content> _contentList = [
    Content(
        "Funktionen",
        "Das ist eine Beispielbeschreibung zu Funktionen",
        """List<User> getUsers() {
    return _users;
  }""",
        "David Sent"),
    Content("Klassen", "Das ist eine Beispielbeschreibung zu Klassen",
        "class bla ....", "David Sent"),
    Content("Abstrakte Klassen", "Das ist eine Beispielbeschreibung zu Klassen",
        "class bla ....", "David Sent"),
    Content(
        "ElevatedButton",
        "Das ist eine Beispielbeschreibung fuer den Button",
        """ElevatedButton(
            style: style,
            onPressed: () {},
            child: const Text('Enabled'),
          ),""",
        "David Sent",
        ElevatedButton(onPressed: () {}, child: const Text("Sample Button"))),
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
  Future<List<Content>> getContent() async {
    // simulating slow connection (waiting 2 secs)
    await Future.delayed(const Duration(seconds: 2));
    // return database contents
    return _contentList;
  }

  Future<void> addContent(Content content) async {
    // simulating slow connection (waiting 5 secs)
    await Future.delayed(const Duration(seconds: 5));
    // add new content to database
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
