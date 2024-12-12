import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart' show kIsWeb;

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (!kIsWeb) {
      throw UnsupportedError(
        'career_birdge는 일단 웹 플랫폼만 지원합니다.',
      );
    }
    return web;
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyCm1qotI79gnwBqaGXwSV_YbPmdTvtel2k',
    appId: '1:224819126631:web:f26d7d21787df3c5138fc2',
    messagingSenderId: '224819126631',
    projectId: 'test-57e02',
    authDomain: 'test-57e02.firebaseapp.com',
    storageBucket: 'test-57e02.firebasestorage.app',
    measurementId: 'G-44RL9K2PK8',
  );
}