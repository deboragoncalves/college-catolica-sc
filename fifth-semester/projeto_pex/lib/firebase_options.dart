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
    apiKey: 'AIzaSyAKhzPOHQp4YFWiXi_pKRHZeJoToWbozTI',
    appId: '1:601840769353:web:d4ba29de3eb8e1ea426298',
    messagingSenderId: '601840769353',
    projectId: 'projeto-pex-gp03',
    authDomain: 'projeto-pex-gp03.firebaseapp.com',
    storageBucket: 'projeto-pex-gp03.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAkmZfcNe0phOxRxZZ847rMUIZSQfB2DnY',
    appId: '1:601840769353:android:4214174f37612522426298',
    messagingSenderId: '601840769353',
    projectId: 'projeto-pex-gp03',
    storageBucket: 'projeto-pex-gp03.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBegvgBz8F4XBz4TMSvbYX2Bd94RbweXNo',
    appId: '1:601840769353:ios:4964a834cd49775c426298',
    messagingSenderId: '601840769353',
    projectId: 'projeto-pex-gp03',
    storageBucket: 'projeto-pex-gp03.appspot.com',
    iosBundleId: 'com.example.projetoPex',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBegvgBz8F4XBz4TMSvbYX2Bd94RbweXNo',
    appId: '1:601840769353:ios:4964a834cd49775c426298',
    messagingSenderId: '601840769353',
    projectId: 'projeto-pex-gp03',
    storageBucket: 'projeto-pex-gp03.appspot.com',
    iosBundleId: 'com.example.projetoPex',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAKhzPOHQp4YFWiXi_pKRHZeJoToWbozTI',
    appId: '1:601840769353:web:72c77e2382940cab426298',
    messagingSenderId: '601840769353',
    projectId: 'projeto-pex-gp03',
    authDomain: 'projeto-pex-gp03.firebaseapp.com',
    storageBucket: 'projeto-pex-gp03.appspot.com',
  );
}
