import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/material.dart';
import 'package:switchit/database/database_realm.dart';

class NetworkStorageController {
  static final NetworkStorageController _singleton =
      NetworkStorageController._internal();

  factory NetworkStorageController() {
    return _singleton;
  }

  NetworkStorageController._internal();

  // Image

  Future<String> uploadPhoto(String imagePath) async {
    final file = File(imagePath);

    var userEmail = await DatabaseRealm().getUserEmail();

    var destination = 'users/$userEmail';
    var itemName = DateTime.now().millisecondsSinceEpoch.toString();

    try {
      final ref = firebase_storage.FirebaseStorage.instance
          .ref(destination)
          .child(itemName);
      await ref.putFile(file);

      final imageUrl = await firebase_storage.FirebaseStorage.instance
          .ref(destination)
          .child(itemName)
          .getDownloadURL();

      debugPrint("FirebaseStorage (uploadPhoto): Success");
      return imageUrl;
    } catch (e) {
      debugPrint("FirebaseStorage (uploadPhoto): Error $e");
      return "";
    }
  }
}
