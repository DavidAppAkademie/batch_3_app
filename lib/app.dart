import 'package:batch_3_app/config/theme.dart';
import 'package:batch_3_app/features/add_content_suggestion/presentation/content_suggestions_screen.dart';
import 'package:batch_3_app/features/feedback/presentation/view_feedback_screen.dart';
import 'package:batch_3_app/features/overview/presentation/overview_page.dart';
import 'package:batch_3_app/features/sign_up/presentation/register_page.dart';
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
          return const Material(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else {
          // Future fertig -> isDarkMode info vorhanden!
          final isDarkMode = snapshot.data!;

          return MaterialApp(
            onGenerateRoute: (settings) {
              return MaterialPageRoute(builder: (context) {
                return StreamBuilder(
                  stream: context
                      .read<RepositoryContainer>()
                      .firebaseAuthRepository
                      .onAuthStateChanged,
                  builder: (context, snapshot) {
                    final user = snapshot.data;
                    if (user == null) {
                      // User ist nicht eingeloggt
                      if (settings.name == SignUpPage.routeName) {
                        return const SignUpPage();
                      } else {
                        return const RegisterPage();
                      }
                    } else {
                      // User ist eingeloggt
                      switch (settings.name) {
                        case ViewFeedbackScreen.routeName:
                          return const ViewFeedbackScreen();
                        case ContentSuggestionsScreen.routeName:
                          return const ContentSuggestionsScreen();
                        case OverviewPage.routeName:
                        default:
                          return const OverviewPage();
                      }
                    }
                  },
                );
              });
            },
            theme: getLightTheme(),
            darkTheme: getDarkTheme(),
            themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light,
          );
        }
      },
    );
  }
}
