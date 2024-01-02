import 'package:batch_3_app/features/overview/model/user.dart';
import 'package:flutter/material.dart';

class Batch3Member extends User {
  Batch3Member(super.username, super.firstName, super.lastName, super.email);

  @override
  void printRole() {
    debugPrint("Ich bin Batch 3 Member!");
  }
}
