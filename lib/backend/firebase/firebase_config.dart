import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyAprvSSxCRNH-_UiuNJOtr4m6N8ZcCor7Y",
            authDomain: "app-kyrios.firebaseapp.com",
            projectId: "app-kyrios",
            storageBucket: "app-kyrios.appspot.com",
            messagingSenderId: "240200136964",
            appId: "1:240200136964:web:4513ef3bb074d23973f851"));
  } else {
    await Firebase.initializeApp();
  }
}
