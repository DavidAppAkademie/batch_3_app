import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Content {
  String id;
  String title;
  String description;
  String sampleCode;
  String authorFullName;
  Widget? widget;

  Content(this.id, this.title, this.description, this.sampleCode,
      this.authorFullName,
      [this.widget]);

  factory Content.fromDocumentSnapshot(DocumentSnapshot snapshot) {
    return Content.fromMap(snapshot.data() as Map<String, dynamic>);
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'sampleCode': sampleCode,
      'authorFullName': authorFullName,
    };
  }

  factory Content.fromMap(Map<String, dynamic> map) {
    return Content(
      map['id'],
      map['title'],
      map['description'],
      map['sampleCode'],
      map['authorFullName'],
    );
  }
}
