import 'package:flutter/material.dart';
import 'package:switchit/ui/login/components/body.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  static String routeName = "/login_screen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.deepPurple[600], body: Body());
  }
}
