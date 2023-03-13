import 'package:flutter/material.dart';
import 'package:learningdart/app/routes.dart';
import 'package:learningdart/ui/home/home_screen.dart';

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
        primarySwatch: Colors.purple,
      ),
      routes: routes,
      home: const HomeScreen(),
    );
  }
}
