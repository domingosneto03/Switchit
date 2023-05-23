import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:switchit/database/database_realm.dart';
import 'package:switchit/network/network_firestore_controller.dart';

class LoginStatus {
  static String success = "success";
  static String error = "error";
  static String userNotFound = "No user found for that email.";
  static String wrongPassword = "Wrong password provided for that user.";
}

class SignUpStatus {
  static String success = "success";
  static String emailAddressRegistered =
      "The email address is already in use by another account.";
  static String error = "error";
}

class NetworkAuthController {
  static final NetworkAuthController _singleton =
      NetworkAuthController._internal();

  factory NetworkAuthController() {
    return _singleton;
  }

  NetworkAuthController._internal();

  Future<bool> isUserAuthenticated() async {
    var currentUser = FirebaseAuth.instance.currentUser;

    if (currentUser != null) {
      debugPrint("FirebaseAuth (isUserAuthenticated): User is authenticated");

      return true;
    } else {
      debugPrint(
          "FirebaseAuth (isUserAuthenticated): User is not authenticated");
      return false;
    }
  }

  Future<String> login(String email, String password) async {
    try {
      final result = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      debugPrint('FirebaseAuth (signInWithEmailAndPassword): $result');
      var success = await NetworkFirestoreController().getUserFromCloud(email);

      if (!success) {
        return LoginStatus.error;
      }

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

  Future<String> signUp(
      String name, String surname, String email, String password) async {
    try {
      final result = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      debugPrint('FirebaseAuth (createUserWithEmailAndPassword): $result');

      var isAddedToCloud = await NetworkFirestoreController()
          .addUserToCloud(name, surname, email);

      if (!isAddedToCloud) {
        return SignUpStatus.error;
      }

      return SignUpStatus.success;
    } on FirebaseAuthException catch (e) {
      debugPrint('FirebaseAuth (createUserWithEmailAndPassword): $e');

      if (e.message == SignUpStatus.emailAddressRegistered) {
        return SignUpStatus.emailAddressRegistered;
      }
      return SignUpStatus.error;
    }
  }

  Future<bool> logout() async {
    try {
      await FirebaseAuth.instance.signOut();
      DatabaseRealm().clearDatabase();
      debugPrint('FirebaseAuth (logout): success');

      return true;
    } on FirebaseAuthException catch (e) {
      debugPrint('FirebaseAuth (logout): $e');

      return false;
    }
  }

  Future<bool> resetPassword(String email) async {
    try {
      await FirebaseAuth.instance.setLanguageCode("en");
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);

      debugPrint('FirebaseAuth (resetPassword): success');

      return true;
    } on FirebaseAuthException catch (e) {
      debugPrint('FirebaseAuth (resetPassword): $e');

      return false;
    }
  }

  Future<bool> deleteAccount() async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      await user?.delete();

      debugPrint('FirebaseAuth (deleteAccount): success');

      var userDocId = await DatabaseRealm().getUserDocId();
      var isRemovedFromCloud =
          await NetworkFirestoreController().removeUserFromCloud(userDocId!);

      if (!isRemovedFromCloud) {
        return false;
      }

      DatabaseRealm().clearDatabase();

      return true;
    } on FirebaseAuthException catch (e) {
      debugPrint('FirebaseAuth (deleteAccount): $e');

      return false;
    }
  }
}
