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
    apiKey: 'AIzaSyCp-pvZ12zz-6ggNprGXN-bNPAsKaPImTc',
    appId: '1:553411028992:android:4d1006342dc9181ca990e5',
    messagingSenderId: '553411028992',
    projectId: 'vortijatra',
    authDomain: 'vortijatra.firebaseapp.com',
    storageBucket: 'vortijatra.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCp-pvZ12zz-6ggNprGXN-bNPAsKaPImTc',
    appId: '1:553411028992:android:4d1006342dc9181ca990e5',
    messagingSenderId: '553411028992',
    projectId: 'vortijatra',
    storageBucket: 'vortijatra.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCp-pvZ12zz-6ggNprGXN-bNPAsKaPImTc',
    appId: '1:553411028992:android:4d1006342dc9181ca990e5',
    messagingSenderId: '553411028992',
    projectId: 'vortijatra',
    storageBucket: 'vortijatra.firebasestorage.app',
    iosBundleId: 'com.vortijatra.app',
  );
}
