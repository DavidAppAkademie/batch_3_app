import 'package:batch_3_app/app.dart';
import 'package:batch_3_app/features/overview/data/mock/mock_database_overview_repository.dart';
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
MockDatabaseOverviewRepository databaseRepository =
    MockDatabaseOverviewRepository();
void main() {
  runApp(const App());
}
