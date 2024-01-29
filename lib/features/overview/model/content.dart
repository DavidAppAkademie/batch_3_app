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
}
