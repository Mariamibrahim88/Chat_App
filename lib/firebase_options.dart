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
    apiKey: 'AIzaSyCEXeg369vMma62qNUjBZPNm0qa4Yfjl74',
    appId: '1:204527007335:web:b5b494e2de1c435ae706c2',
    messagingSenderId: '204527007335',
    projectId: 'chat--app-76857',
    authDomain: 'chat--app-76857.firebaseapp.com',
    storageBucket: 'chat--app-76857.appspot.com',
    measurementId: 'G-7C63LQKCDR',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA2IPrKObO7ppyjyv9jialOl5WCnaMD6zQ',
    appId: '1:204527007335:android:3b8c46ed693ace84e706c2',
    messagingSenderId: '204527007335',
    projectId: 'chat--app-76857',
    storageBucket: 'chat--app-76857.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC72ss3qck7IfegF_6a3tbbmJBIzK9N8Sk',
    appId: '1:204527007335:ios:476d841cb53ac4f1e706c2',
    messagingSenderId: '204527007335',
    projectId: 'chat--app-76857',
    storageBucket: 'chat--app-76857.appspot.com',
    iosBundleId: 'com.example.scholarChatApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyC72ss3qck7IfegF_6a3tbbmJBIzK9N8Sk',
    appId: '1:204527007335:ios:3698026dfc741bb8e706c2',
    messagingSenderId: '204527007335',
    projectId: 'chat--app-76857',
    storageBucket: 'chat--app-76857.appspot.com',
    iosBundleId: 'com.example.scholarChatApp.RunnerTests',
  );
}
