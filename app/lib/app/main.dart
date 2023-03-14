import 'package:flutter/material.dart';
import '/app/routes.dart';
import '/ui/login/login_screen.dart';

void main() {
  runApp(const SwitchitApp());
}

class SwitchitApp extends StatelessWidget {
  const SwitchitApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Switchit',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      routes: routes,
      home: const LoginScreen(),
    );
  }
}
