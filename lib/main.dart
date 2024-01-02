import 'package:batch_3_app/app.dart';
import 'package:batch_3_app/features/overview/data/database_repository.dart';
import 'package:flutter/material.dart';

/*
Pages:

Registrierung
Login
Feedback abgeben
Feedback Uebersicht
Uebersichtsseite
Detailansicht (Code vs. Grafische Darstellung)
Einstellung
Content Formular
Content Verwaltung

  */
DatabaseRepository databaseRepository = DatabaseRepository();
void main() {
  runApp(const App());
}
