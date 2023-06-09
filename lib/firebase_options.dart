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
    apiKey: 'AIzaSyBuyL7CtNQ2JvcP92ulgoGUR8OpjcmI_nU',
    appId: '1:857707658199:web:7dfa499fffcb16a2aae992',
    messagingSenderId: '857707658199',
    projectId: 'cochetec-768d0',
    authDomain: 'cochetec-768d0.firebaseapp.com',
    storageBucket: 'cochetec-768d0.appspot.com',
    measurementId: 'G-CBX27NC85K',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC9pmkalhb6BFoIMipUN7e3fWw0pZ_niYk',
    appId: '1:857707658199:android:5e537edb8c1e12afaae992',
    messagingSenderId: '857707658199',
    projectId: 'cochetec-768d0',
    storageBucket: 'cochetec-768d0.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB0Asc84kqDla5WuFRWFSNqGUT5Fz0FGfQ',
    appId: '1:857707658199:ios:2541127a9d631e84aae992',
    messagingSenderId: '857707658199',
    projectId: 'cochetec-768d0',
    storageBucket: 'cochetec-768d0.appspot.com',
    iosClientId: '857707658199-vhb699thphn593mfig6vb944gdb4sf9t.apps.googleusercontent.com',
    iosBundleId: 'mx.edu.ittepic.damU4Proyecto119400640',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyB0Asc84kqDla5WuFRWFSNqGUT5Fz0FGfQ',
    appId: '1:857707658199:ios:2541127a9d631e84aae992',
    messagingSenderId: '857707658199',
    projectId: 'cochetec-768d0',
    storageBucket: 'cochetec-768d0.appspot.com',
    iosClientId: '857707658199-vhb699thphn593mfig6vb944gdb4sf9t.apps.googleusercontent.com',
    iosBundleId: 'mx.edu.ittepic.damU4Proyecto119400640',
  );
}
