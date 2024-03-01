// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyCCbnNh4-zED2n-hGt8FM54C3cA2VfDLUI',
    appId: '1:442198232244:web:c5c51ac0005e954df69be1',
    messagingSenderId: '442198232244',
    projectId: 'batch-3-app',
    authDomain: 'batch-3-app.firebaseapp.com',
    storageBucket: 'batch-3-app.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCJSwJXoy5VTPNDjMaHmF5wxkXzeiEYMQc',
    appId: '1:442198232244:android:6355b6d152314c17f69be1',
    messagingSenderId: '442198232244',
    projectId: 'batch-3-app',
    storageBucket: 'batch-3-app.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDc30RQu4YPGh3THoFp4I2O4itFgIq27us',
    appId: '1:442198232244:ios:996c679c5f3309a0f69be1',
    messagingSenderId: '442198232244',
    projectId: 'batch-3-app',
    storageBucket: 'batch-3-app.appspot.com',
    iosBundleId: 'com.example.batch3App',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDc30RQu4YPGh3THoFp4I2O4itFgIq27us',
    appId: '1:442198232244:ios:583d98f691aa8fc7f69be1',
    messagingSenderId: '442198232244',
    projectId: 'batch-3-app',
    storageBucket: 'batch-3-app.appspot.com',
    iosBundleId: 'com.example.batch3App.RunnerTests',
  );
}
