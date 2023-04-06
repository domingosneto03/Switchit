import 'package:flutter/material.dart';
import 'package:switchit/network/network_auth_controller.dart';
import 'package:switchit/util/status_view.dart';

class ProfileViewModel extends ChangeNotifier {
  StatusView status = StatusView.intial;
  String message = "";

  Future<void> logout() async {
    status = StatusView.inProgress;

    notifyListeners();

    var result = await NetworkAuthController.logout();

    if (result) {
      status = StatusView.done;
    } else {
      message = "Something went wrong.";
      status = StatusView.messageToShow;
    }

    notifyListeners();
  }

  Future<void> deleteAccount() async {
    status = StatusView.inProgress;

    notifyListeners();

    var result = await NetworkAuthController.deleteAccount();

    if (result) {
      status = StatusView.done;
    } else {
      message = "Something went wrong.";
      status = StatusView.messageToShow;
    }

    notifyListeners();
  }
}
