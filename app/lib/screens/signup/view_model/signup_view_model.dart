import 'package:flutter/material.dart';

import '../../../network/network_controller.dart';

class SignUpViewModel extends ChangeNotifier {
  bool successSignUp = false;
  String email = "";
  String password = "";

  signUpUser() async {
    var result = await NetworkController.signUp(email, password);

    if (result == SignupStatus.success) {
      successSignUp = true;
    } else {
      successSignUp = false;
    }

    notifyListeners();
  }
}
