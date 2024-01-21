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
    apiKey: 'AIzaSyAUu117z10wMbcTkhXVzjYdbqcIsu70O5U',
    appId: '1:784381353742:web:0d953e7698c7608ec5415f',
    messagingSenderId: '784381353742',
    projectId: 'vysion-app',
    authDomain: 'vysion-app.firebaseapp.com',
    databaseURL: 'https://vysion-app-default-rtdb.firebaseio.com',
    storageBucket: 'vysion-app.appspot.com',
    measurementId: 'G-JR8WY8JBCJ',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDgzKZyt1UpAA7nSknmGGszSHnurILITkQ',
    appId: '1:784381353742:android:900c5ea628156073c5415f',
    messagingSenderId: '784381353742',
    projectId: 'vysion-app',
    databaseURL: 'https://vysion-app-default-rtdb.firebaseio.com',
    storageBucket: 'vysion-app.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCZ1LpElRizYLkqvQf5U-UD8MvfHFokK28',
    appId: '1:784381353742:ios:17b0c1a015d402cec5415f',
    messagingSenderId: '784381353742',
    projectId: 'vysion-app',
    databaseURL: 'https://vysion-app-default-rtdb.firebaseio.com',
    storageBucket: 'vysion-app.appspot.com',
    iosBundleId: 'com.example.vysionApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCZ1LpElRizYLkqvQf5U-UD8MvfHFokK28',
    appId: '1:784381353742:ios:082659a1ae48ad90c5415f',
    messagingSenderId: '784381353742',
    projectId: 'vysion-app',
    databaseURL: 'https://vysion-app-default-rtdb.firebaseio.com',
    storageBucket: 'vysion-app.appspot.com',
    iosBundleId: 'com.example.vysionApp.RunnerTests',
  );
}
