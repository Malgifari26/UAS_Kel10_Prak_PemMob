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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyAOEKLeyPwRRYnbE5uBSfYLUtpP_aTySfY',
    appId: '1:458779496958:web:ff9d9e29249f5800a870af',
    messagingSenderId: '458779496958',
    projectId: 'absensi-666f2',
    authDomain: 'absensi-666f2.firebaseapp.com',
    databaseURL: 'https://absensi-666f2-default-rtdb.firebaseio.com',
    storageBucket: 'absensi-666f2.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC4UdJclzUOLvfxyCF5shkTuJpe2fbAecY',
    appId: '1:458779496958:android:0eaab32b001ebf19a870af',
    messagingSenderId: '458779496958',
    projectId: 'absensi-666f2',
    databaseURL: 'https://absensi-666f2-default-rtdb.firebaseio.com',
    storageBucket: 'absensi-666f2.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBypciUXiDu0uIhN39BEinQcaaKNLQvwpE',
    appId: '1:458779496958:ios:efb932d0b5cfd731a870af',
    messagingSenderId: '458779496958',
    projectId: 'absensi-666f2',
    databaseURL: 'https://absensi-666f2-default-rtdb.firebaseio.com',
    storageBucket: 'absensi-666f2.appspot.com',
    iosBundleId: '.absensi.absensiFlutter',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAOEKLeyPwRRYnbE5uBSfYLUtpP_aTySfY',
    appId: '1:458779496958:web:0b798c8e20be945aa870af',
    messagingSenderId: '458779496958',
    projectId: 'absensi-666f2',
    authDomain: 'absensi-666f2.firebaseapp.com',
    databaseURL: 'https://absensi-666f2-default-rtdb.firebaseio.com',
    storageBucket: 'absensi-666f2.appspot.com',
  );
}
