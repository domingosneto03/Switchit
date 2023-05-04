import 'package:flutter/material.dart';
import 'package:switchit/models/user_data_model.dart';

class UserProvider extends ChangeNotifier {
  late UserDataModel currentUser;

  void setCurrentUser(UserDataModel user) {
    currentUser = user;
    notifyListeners();
  }
}

