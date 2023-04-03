import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:switchit/screens/signup/view/components/body.dart';
import 'package:switchit/screens/signup/view_model/signup_view_model.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  static String routeName = "/signup_screen";

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [ChangeNotifierProvider(create: (_) => SignUpViewModel())],
        child: Scaffold(
            appBar: AppBar(),
            backgroundColor: Colors.deepPurple[600],
            body: Body()));
  }
}
