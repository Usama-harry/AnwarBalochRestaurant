import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Auth with ChangeNotifier {
  User? user;

  bool get isLoggedIn {
    user = FirebaseAuth.instance.currentUser;
    return user != null;
  }

  //Sign Up

  Future<bool?> signUpWithEmailAndPassword(
      String email, String password) async {
    return await FirebaseAuth.instance
        .createUserWithEmailAndPassword(
      email: email,
      password: password,
    )
        .then((userCredential) {
      if (userCredential.user != null) {
        user = userCredential.user;
        notifyListeners();
        return true;
      }
    }).catchError((error) {
      throw error;
    });
  }
}
