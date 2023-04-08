import 'package:flutter/material.dart';
import 'package:switchit/app/constants.dart';
import 'package:switchit/network/network_auth_controller.dart';
import 'package:switchit/util/status_view.dart';

class ForgotPasswordViewModel extends ChangeNotifier {
  StatusView status = StatusView.intial;
  String message = "";

  String email = "";

  Future<void> resetPassword() async {
    status = StatusView.inProgress;

    notifyListeners();

    if (email.isEmpty || !emailValidatorRegExp.hasMatch(email)) {
      message = "Please enter a valid email address.";
      status = StatusView.messageToShow;
      notifyListeners();
      return;
    }

    var withSuccess = await NetworkAuthController().resetPassword(email);

    if (withSuccess) {
      status = StatusView.done;
    } else {
      message = "Something went wrong.";
      status = StatusView.messageToShow;
    }

    notifyListeners();
  }
}
