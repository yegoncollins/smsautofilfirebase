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
    apiKey: 'AIzaSyAv91xnadakNUiaEn7jWswAwyVTV5kKd_o',
    appId: '1:546293840742:web:5af9cd59ac114776d9e6a7',
    messagingSenderId: '546293840742',
    projectId: 'phone-auth-baffc',
    authDomain: 'phone-auth-baffc.firebaseapp.com',
    storageBucket: 'phone-auth-baffc.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBFoBJ1BE3upnDnwy5YsxYtmfW9RI5iE0o',
    appId: '1:546293840742:android:ed002e282d986490d9e6a7',
    messagingSenderId: '546293840742',
    projectId: 'phone-auth-baffc',
    storageBucket: 'phone-auth-baffc.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCBPtIQc8PnKd6KKv3NvO3Nh5zjBa9DfQI',
    appId: '1:546293840742:ios:092e9543745e8c78d9e6a7',
    messagingSenderId: '546293840742',
    projectId: 'phone-auth-baffc',
    storageBucket: 'phone-auth-baffc.appspot.com',
    iosBundleId: 'com.example.smsautofilfirebase',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCBPtIQc8PnKd6KKv3NvO3Nh5zjBa9DfQI',
    appId: '1:546293840742:ios:092e9543745e8c78d9e6a7',
    messagingSenderId: '546293840742',
    projectId: 'phone-auth-baffc',
    storageBucket: 'phone-auth-baffc.appspot.com',
    iosBundleId: 'com.example.smsautofilfirebase',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAv91xnadakNUiaEn7jWswAwyVTV5kKd_o',
    appId: '1:546293840742:web:de1ffb61d711fc0fd9e6a7',
    messagingSenderId: '546293840742',
    projectId: 'phone-auth-baffc',
    authDomain: 'phone-auth-baffc.firebaseapp.com',
    storageBucket: 'phone-auth-baffc.appspot.com',
  );
}
