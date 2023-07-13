import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyC1XUqnK6TZgGXbA4GaEBe3D5wjd0Pxoic",
            authDomain: "quid-eda9a.firebaseapp.com",
            projectId: "quid-eda9a",
            storageBucket: "quid-eda9a.appspot.com",
            messagingSenderId: "1033004220873",
            appId: "1:1033004220873:web:f3c33fd9e4267abefa2818",
            measurementId: "G-DJ3CDS8YYF"));
  } else {
    await Firebase.initializeApp();
  }
}
