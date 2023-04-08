import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:switchit/firebase_options.dart';

class NetworkController {
  static final NetworkController _singleton = NetworkController._internal();

  factory NetworkController() {
    return _singleton;
  }

  NetworkController._internal();

  Future<void> init() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    debugPrint("Firebase was initialized");
  }
}
