import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyCEtFmQIY-6-fNLi_CRLCWsDk_3w29occk",
            authDomain: "bookie-d58e4.firebaseapp.com",
            projectId: "bookie-d58e4",
            storageBucket: "bookie-d58e4.appspot.com",
            messagingSenderId: "564894284019",
            appId: "1:564894284019:web:76b568f256556d4c575f86",
            measurementId: "G-56E9VZL3HR"));
  } else {
    await Firebase.initializeApp();
  }
}
