import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyAtE8kMwIWZK-Btf-F8I4Go9sd12J8Rq7I",
            authDomain: "sandbox-rivalslam.firebaseapp.com",
            projectId: "sandbox-rivalslam",
            storageBucket: "sandbox-rivalslam.appspot.com",
            messagingSenderId: "219229032266",
            appId: "1:219229032266:web:3006ecdbee91b98a8ebbb3",
            measurementId: "G-N3FYX04RSW"));
  } else {
    await Firebase.initializeApp();
  }
}
