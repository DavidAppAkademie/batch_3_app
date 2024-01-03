import 'package:flutter/material.dart';

class Content {
  String title;
  String description;
  String sampleCode;
  String authorFullName;
  Widget? widget;

  Content(this.title, this.description, this.sampleCode, this.authorFullName,
      [this.widget]);
}
