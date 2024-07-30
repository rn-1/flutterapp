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
    apiKey: 'AIzaSyB88cgn_k9ncPBMyK4Z3jfUE_EPvIuRJuM',
    appId: '1:475309199023:web:baf765891238d06e074e5a',
    messagingSenderId: '475309199023',
    projectId: 'testing-6ee51',
    authDomain: 'testing-6ee51.firebaseapp.com',
    storageBucket: 'testing-6ee51.appspot.com',
    measurementId: 'G-YCPLJM36PF',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAgfCbTyhNycNP_BAq0hYg6ucuUO8-Z-3w',
    appId: '1:475309199023:android:994e757f4261bdb7074e5a',
    messagingSenderId: '475309199023',
    projectId: 'testing-6ee51',
    storageBucket: 'testing-6ee51.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB-jpV2wF0q-kFa4Xfwep0Fx2fEgXkXFmU',
    appId: '1:475309199023:ios:30273c2181fc5dd3074e5a',
    messagingSenderId: '475309199023',
    projectId: 'testing-6ee51',
    storageBucket: 'testing-6ee51.appspot.com',
    iosBundleId: 'com.example.gemapp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyB-jpV2wF0q-kFa4Xfwep0Fx2fEgXkXFmU',
    appId: '1:475309199023:ios:30273c2181fc5dd3074e5a',
    messagingSenderId: '475309199023',
    projectId: 'testing-6ee51',
    storageBucket: 'testing-6ee51.appspot.com',
    iosBundleId: 'com.example.gemapp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyB88cgn_k9ncPBMyK4Z3jfUE_EPvIuRJuM',
    appId: '1:475309199023:web:0dc4230f922425bc074e5a',
    messagingSenderId: '475309199023',
    projectId: 'testing-6ee51',
    authDomain: 'testing-6ee51.firebaseapp.com',
    storageBucket: 'testing-6ee51.appspot.com',
    measurementId: 'G-N863VM0ZZN',
  );

}