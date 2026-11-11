import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

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
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'TOMAR_WEB_API_KEY',
    appId: 'TOMAR_WEB_APP_ID',
    messagingSenderId: 'TOMAR_SENDER_ID',
    projectId: 'vortijatra',
    authDomain: 'vortijatra.firebaseapp.com',
    storageBucket: 'vortijatra.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'TOMAR_ANDROID_API_KEY',
    appId: 'TOMAR_ANDROID_APP_ID',
    messagingSenderId: 'TOMAR_SENDER_ID',
    projectId: 'vortijatra',
    storageBucket: 'vortijatra.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'TOMAR_IOS_API_KEY',
    appId: 'TOMAR_IOS_APP_ID',
    messagingSenderId: 'TOMAR_SENDER_ID',
    projectId: 'vortijatra',
    storageBucket: 'vortijatra.appspot.com',
    iosBundleId: 'com.example.vortijatra',
  );
}
