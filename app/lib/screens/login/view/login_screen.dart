import 'package:flutter/material.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:provider/provider.dart';
import 'package:switchit/screens/login/view/components/body.dart';
import 'package:switchit/screens/login/view_model/login_view_model.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  static String routeName = "/login_screen";

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [ChangeNotifierProvider(create: (_) => LoginViewModel())],
        child: Scaffold(
            backgroundColor: Colors.deepPurple[600],
            body: ProgressHUD(child: const Body())));
  }
}
