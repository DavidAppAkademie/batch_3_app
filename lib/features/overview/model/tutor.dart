import 'package:batch_3_app/features/overview/model/user.dart';
import 'package:flutter/material.dart';

class Tutor extends User {
  // Konstruktor
  Tutor(
    super.username,
    super.firstName,
    super.lastName,
    super.email,
  );

  String getTutorRole() {
    return "Normaler Tutor";
  }

  @override
  void printEmail() {
    debugPrint("Tutoren Email: $email");
  }

  @override
  void printRole() {
    debugPrint("Ich bin ein Tutor");
  }
}
