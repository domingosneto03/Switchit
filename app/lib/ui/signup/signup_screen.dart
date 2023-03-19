import 'package:flutter/material.dart';
import 'package:switchit/ui/signup/components/body.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  static String routeName = "/signup_screen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        backgroundColor: Colors.deepPurple[600],
        body: Body());
  }
}
