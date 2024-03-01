import 'package:batch_3_app/app.dart';
import 'package:batch_3_app/firebase_options.dart';
import 'package:batch_3_app/repository_container.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    ChangeNotifierProvider(
      create: (BuildContext context) => RepositoryContainer(),
      builder: (context, child) {
        return const App();
      },
    ),
  );
}
