import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

class DefaultFirebaseOptions {
  static const FirebaseOptions android = FirebaseOptions(
      apiKey: "AIzaSyAkYLkHKjXAv11YvJVtxDkAV-0_bCXXh2g",
      appId: "1:1078355761574:android:8a15d1b1adeebe0d5a5767",
      messagingSenderId: "1093622058675",
      projectId: "com.example.smartedu"
  );


  static const FirebaseOptions ios = FirebaseOptions(
      apiKey: "AIzaSyAkYLkHKjXAv11YvJVtxDkAV-0_bCXXh2g",
      appId: "1:1078355761574:android:8a15d1b1adeebe0d5a5767",
      messagingSenderId: "1093622058675",
      projectId: "com.example.smartedu"
  );

  static FirebaseOptions get currentPlatform {
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
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


}