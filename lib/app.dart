import 'package:batch_3_app/features/overview/presentation/overview_page.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: OverviewPage(),
    );
  }
}
