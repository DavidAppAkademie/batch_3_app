import 'package:batch_3_app/features/overview/data/database_overview_repository.dart';
import 'package:batch_3_app/features/overview/model/content.dart';
import 'package:flutter/material.dart' hide Feedback;

class MockDatabaseOverviewRepository implements DatabaseOverviewRepository {
  // private attributes
  final List<Content> _contentList = [
    Content(
        "1",
        "Funktionen",
        "Das ist eine Beispielbeschreibung zu Funktionen",
        """List<User> getUsers() {
    return _users;
  }""",
        "David Sent"),
    Content("2", "Klassen", "Das ist eine Beispielbeschreibung zu Klassen",
        "class bla ....", "David Sent"),
    Content(
        "3",
        "Abstrakte Klassen",
        "Das ist eine Beispielbeschreibung zu Klassen",
        "class bla ....",
        "David Sent"),
    Content(
        "4",
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

  // constructor
  MockDatabaseOverviewRepository();

  // Content functions
  @override
  Future<List<Content>> getContent() async {
    // simulating slow connection (waiting 2 secs)
    await Future.delayed(const Duration(seconds: 2));
    // return database contents
    return _contentList;
  }
}
