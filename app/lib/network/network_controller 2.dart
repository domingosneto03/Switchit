import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:switchit/firebase_options.dart';

class LoginStatus {
  static String success = "success";
  static String error = "error";
  static String userNotFound = "No user found for that email.";
  static String wrongPassword = "Wrong password provided for that user.";
}

class SignupStatus {
  static String success = "success";
  static String error = "error";
}

class NetworkController {
  static Future<void> init() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    debugPrint("Firebase was initialized");
  }

  static Future<bool> isUserAuthenticated() async {
    var isUserAuthenticatedValue = false;

    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        debugPrint(
            'FirebaseAuth (authStateChanges): User is currently signed out!');
        isUserAuthenticatedValue = false;
      } else {
        debugPrint('FirebaseAuth (authStateChanges): User is signed in!');
        isUserAuthenticatedValue = true;
      }
    });

    return isUserAuthenticatedValue;
  }

  static Future<String> login(String email, String password) async {
    try {
      final result = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      debugPrint('FirebaseAuth (signInWithEmailAndPassword): $result');
      return LoginStatus.success;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        debugPrint(
            'FirebaseAuth (signInWithEmailAndPassword): No user found for that email.');
        return LoginStatus.userNotFound;
      } else if (e.code == 'wrong-password') {
        debugPrint(
            'FirebaseAuth (signInWithEmailAndPassword): Wrong password provided for that user.');
        return LoginStatus.wrongPassword;
      }
      return LoginStatus.error;
    }
  }

  static Future<String> signUp(String email, String password) async {
    try {
      final result = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      debugPrint('FirebaseAuth (createUserWithEmailAndPassword): $result');
      return SignupStatus.success;
    } on FirebaseAuthException catch (e) {
      debugPrint('FirebaseAuth (createUserWithEmailAndPassword): $e');
      return SignupStatus.error;
    }
  }
}
