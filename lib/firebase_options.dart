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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyAhT9hVXGRCOlLsIpaFtCF75IQQJi-VPag',
    appId: '1:875656324603:web:6dc7c3fcc995a23a97175e',
    messagingSenderId: '875656324603',
    projectId: 'comic-book-74280',
    authDomain: 'comic-book-74280.firebaseapp.com',
    storageBucket: 'comic-book-74280.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCLujk9gMCNSoMkMEtA5T9GL7rCkP1xIIk',
    appId: '1:875656324603:android:75b8660ed4ba3a7297175e',
    messagingSenderId: '875656324603',
    projectId: 'comic-book-74280',
    storageBucket: 'comic-book-74280.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCOxsOvNDBLX74GLmqad-zMAYvT9oTsb-M',
    appId: '1:875656324603:ios:9c40499aabfdf7fb97175e',
    messagingSenderId: '875656324603',
    projectId: 'comic-book-74280',
    storageBucket: 'comic-book-74280.appspot.com',
    iosClientId: '875656324603-48hf3rm3gdbiao3gtsl8u51clsstsme7.apps.googleusercontent.com',
    iosBundleId: 'com.example.comicBook',
  );
}
