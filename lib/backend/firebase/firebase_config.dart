import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyDt-aN6Y1P94pWir5bGDD_TwzloMfO_t1w",
            authDomain: "test-zippypay.firebaseapp.com",
            projectId: "test-zippypay",
            storageBucket: "test-zippypay.appspot.com",
            messagingSenderId: "174082544178",
            appId: "1:174082544178:web:3f99aff80f65511930222b",
            measurementId: "G-T6X27FTLBK"));
  } else {
    await Firebase.initializeApp();
  }
}
