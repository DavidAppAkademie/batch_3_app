import 'package:batch_3_app/config/theme.dart';
import 'package:batch_3_app/features/sign_up/presentation/sign_up_page.dart';
import 'package:batch_3_app/repository_container.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkModeFuture = context
        .watch<RepositoryContainer>()
        .localStorageRepository
        .getIsDarkMode();
    return FutureBuilder(
      future: isDarkModeFuture,
      builder: (context, snapshot) {
        if ((snapshot.connectionState == ConnectionState.waiting &&
                !snapshot.hasData) ||
            snapshot.hasError) {
          // Future laedt noch.... zeige Splash Screen
          // (oder es gab nen Fehler)
          return const MaterialApp(
            home: Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            ),
          );
        } else {
          // Future fertig -> isDarkMode info vorhanden!
          final isDarkMode = snapshot.data!;
          return MaterialApp(
            theme: getLightTheme(),
            darkTheme: getDarkTheme(),
            themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light,
            home: const SignUpPage(

                /// repos
                ),
          );
        }
      },
    );
  }
}
