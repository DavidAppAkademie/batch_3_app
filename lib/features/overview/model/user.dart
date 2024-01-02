import 'package:flutter/material.dart';

abstract class User {
  String firstName;
  String lastName;
  String username;
  String email;

  User(this.firstName, this.lastName, this.username, this.email);

  void printRole();

  void printEmail() {
    debugPrint("Email: $email");
  }

  String getFullname() {
    return "$lastName $firstName";
  }
}
