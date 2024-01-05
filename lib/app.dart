import 'package:batch_3_app/config/theme.dart';
import 'package:batch_3_app/features/sign_up/presentation/sign_up_page.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: getLightTheme(),
      darkTheme: getDarkTheme(),
      themeMode: ThemeMode.light,
      home: const SignUpPage(),
    );
  }
}
