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
    apiKey: 'AIzaSyDIOgWMFJJajWGKEmWqaMmoUF2J717SarQ',
    appId: '1:949932462637:web:48f1a78ae39f0e581d9ea4',
    messagingSenderId: '949932462637',
    projectId: 'spotify-newapp',
    authDomain: 'spotify-newapp.firebaseapp.com',
    storageBucket: 'spotify-newapp.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBtAR3kgw4Zvp-TT6L7ikyq7-NiW9LG_Eg',
    appId: '1:949932462637:android:580b3f9c2f2a2a931d9ea4',
    messagingSenderId: '949932462637',
    projectId: 'spotify-newapp',
    storageBucket: 'spotify-newapp.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBm9l9fnI-T32kn5cYa1S6RSnSAfyjzUwk',
    appId: '1:949932462637:ios:ee940b073fdf2a291d9ea4',
    messagingSenderId: '949932462637',
    projectId: 'spotify-newapp',
    storageBucket: 'spotify-newapp.firebasestorage.app',
    iosBundleId: 'com.example.spotiThird',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBm9l9fnI-T32kn5cYa1S6RSnSAfyjzUwk',
    appId: '1:949932462637:ios:ee940b073fdf2a291d9ea4',
    messagingSenderId: '949932462637',
    projectId: 'spotify-newapp',
    storageBucket: 'spotify-newapp.firebasestorage.app',
    iosBundleId: 'com.example.spotiThird',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDIOgWMFJJajWGKEmWqaMmoUF2J717SarQ',
    appId: '1:949932462637:web:74767df9eacb7fc21d9ea4',
    messagingSenderId: '949932462637',
    projectId: 'spotify-newapp',
    authDomain: 'spotify-newapp.firebaseapp.com',
    storageBucket: 'spotify-newapp.firebasestorage.app',
  );
}