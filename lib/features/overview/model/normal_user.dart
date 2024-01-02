import 'package:batch_3_app/features/overview/model/user.dart';
import 'package:flutter/material.dart';

class NormalUser extends User {
  // Konstruktor
  NormalUser(
    super.username,
    super.firstName,
    super.lastName,
    super.email,
  );

  @override
  void printRole() {
    debugPrint("Ich bin ein normaler User");
  }
}
