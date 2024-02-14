import 'package:batch_3_app/app.dart';
import 'package:batch_3_app/repository_container.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (BuildContext context) => RepositoryContainer(),
      builder: (context, child) {
        return const App();
      },
    ),
  );
}
