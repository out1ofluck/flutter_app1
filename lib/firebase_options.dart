// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        return windows;
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
    apiKey: 'AIzaSyCIQdJBNjSqiY5C6-wc9cFdIqc69MZr7NY',
    appId: '1:292840826178:web:3710de06d2c484811814db',
    messagingSenderId: '292840826178',
    projectId: 'flutter-app1-ef116',
    authDomain: 'flutter-app1-ef116.firebaseapp.com',
    storageBucket: 'flutter-app1-ef116.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAlx8HoqwRpUpweG-wZ7frr6sErKtdLgDE',
    appId: '1:292840826178:android:7243d51aee6606d81814db',
    messagingSenderId: '292840826178',
    projectId: 'flutter-app1-ef116',
    storageBucket: 'flutter-app1-ef116.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDjvfGBerHPB1xgJBfXRl9Xs4K4l7zt8b8',
    appId: '1:292840826178:ios:0e237c86911deb091814db',
    messagingSenderId: '292840826178',
    projectId: 'flutter-app1-ef116',
    storageBucket: 'flutter-app1-ef116.firebasestorage.app',
    iosBundleId: 'com.example.flutterApplication1',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDjvfGBerHPB1xgJBfXRl9Xs4K4l7zt8b8',
    appId: '1:292840826178:ios:0e237c86911deb091814db',
    messagingSenderId: '292840826178',
    projectId: 'flutter-app1-ef116',
    storageBucket: 'flutter-app1-ef116.firebasestorage.app',
    iosBundleId: 'com.example.flutterApplication1',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCIQdJBNjSqiY5C6-wc9cFdIqc69MZr7NY',
    appId: '1:292840826178:web:17c232676c34cc2f1814db',
    messagingSenderId: '292840826178',
    projectId: 'flutter-app1-ef116',
    authDomain: 'flutter-app1-ef116.firebaseapp.com',
    storageBucket: 'flutter-app1-ef116.firebasestorage.app',
  );
}
