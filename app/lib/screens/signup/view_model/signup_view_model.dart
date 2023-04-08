import 'package:flutter/material.dart';
import 'package:switchit/app/constants.dart';
import 'package:switchit/network/network_auth_controller.dart';
import 'package:switchit/util/status_view.dart';

class SignUpViewModel extends ChangeNotifier {
  StatusView status = StatusView.intial;
  String message = "";

  String name = "";
  String surname = "";
  String email = "";
  String password = "";

  Future<void> signUp() async {
    status = StatusView.inProgress;

    notifyListeners();

    if (name.isEmpty || name.length < 2) {
      message = "Please enter a valid name.";
      status = StatusView.messageToShow;
      notifyListeners();
      return;
    }
    if (surname.isEmpty || surname.length < 2) {
      message = "Please enter a valid surname.";
      status = StatusView.messageToShow;
      notifyListeners();
      return;
    }
    if (email.isEmpty || !emailValidatorRegExp.hasMatch(email)) {
      message = "Please enter a valid email address.";
      status = StatusView.messageToShow;
      notifyListeners();
      return;
    }
    if (password.isEmpty || password.length < 5) {
      message = "Please enter a valid password (more than 5 characters).";
      status = StatusView.messageToShow;
      notifyListeners();
      return;
    }

    var result =
        await NetworkAuthController().signUp(name, surname, email, password);

    if (result == SignUpStatus.success) {
      status = StatusView.done;
    } else if (result == SignUpStatus.emailAddressRegistered) {
      message = "Email address is already registered.";
      status = StatusView.messageToShow;
    } else {
      message = "Something went wrong.";
      status = StatusView.messageToShow;
    }

    notifyListeners();
  }
}
