import 'package:flutter/material.dart';
import '/ui/login/components/body.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  static String routeName = "/login_screen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Login'),
        ),
        body: const Body());
  }
}
