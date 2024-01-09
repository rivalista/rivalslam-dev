// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<String> addUserBuddies(String? uuid) async {
  // Add your function code here!
  try {
    await FirebaseFirestore.instance
        .collection("users")
        .get()
        .then((value) async {
      for (int i = 0; i < value.docs.length; i++) {
        await FirebaseFirestore.instance
            .collection("users")
            .doc(uuid!)
            .collection("user_buddies")
            .add(value.docs.elementAt(i).data());
      }
    });
  } catch (error) {
    return 'Failed to add user - $error';
  }
  return uuid!;
}
