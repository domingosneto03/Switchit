import 'package:flutter/material.dart';
import 'package:switchit/app/constants.dart';
import 'package:switchit/network/network_auth_controller.dart';
import 'package:switchit/util/status_view.dart';

class LoginViewModel extends ChangeNotifier {
  StatusView status = StatusView.intial;
  String message = "";

  String email = "";
  String password = "";
  bool isRemembered = false;

  Future<void> login() async {
    status = StatusView.inProgress;

    notifyListeners();

    if (email.isEmpty || !emailValidatorRegExp.hasMatch(email)) {
      message = "Please enter a valid email address.";
      status = StatusView.messageToShow;
      notifyListeners();
      return;
    }
    if (password.isEmpty) {
      message = "Please enter a password.";
      status = StatusView.messageToShow;
      notifyListeners();
      return;
    }

    var result = await NetworkAuthController().login(email, password);

    if (result == LoginStatus.success) {
      status = StatusView.done;
    } else if (result == LoginStatus.wrongPassword) {
      message = "Wrong password.";
      status = StatusView.messageToShow;
    } else if (result == LoginStatus.userNotFound) {
      message = "User not found.";
      status = StatusView.messageToShow;
    } else {
      message = "Something went wrong.";
      status = StatusView.messageToShow;
    }

    notifyListeners();
  }
}
