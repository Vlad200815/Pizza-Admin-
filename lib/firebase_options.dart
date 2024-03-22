import "package:firebase_core/firebase_core.dart" show FirebaseOptions;
import "package:flutter/foundation.dart"
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return webProd;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        throw UnsupportedError(
            "DefaultFirebaseOptions have not been configured for androind");
      case TargetPlatform.iOS:
        throw UnsupportedError(
            "DefaultFirebaseOptions have not been configured for iOS");
      case TargetPlatform.macOS:
        throw UnsupportedError(
            "DefaultFirebaseOptions have not been configured for macOS");
      case TargetPlatform.windows:
        throw UnsupportedError(
            "DefaultFirebaseOptions have not been configured for windows");
      case TargetPlatform.linux:
        throw UnsupportedError(
            "DefaultFirebaseOptions have not been configured for linux");
      default:
        throw UnimplementedError('DefaultFirebaseOptions are not supported');
    }
  }

  static const FirebaseOptions webProd = FirebaseOptions(
    apiKey: "AIzaSyDbDwhFa93yBQ6TLQSEwDBsJCkZ2SGfBgI",
    authDomain: "just-9404a.firebaseapp.com",
    projectId: "just-9404a",
    storageBucket: "just-9404a.appspot.com",
    messagingSenderId: "868767924703",
    appId: "1:868767924703:web:6f3e3e7cffc204c04b846a",
  );
}
