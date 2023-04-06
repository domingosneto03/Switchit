import 'package:flutter/material.dart';
import 'package:switchit/screens/home/main/components/body.dart';

class HomeTabScreen extends StatelessWidget {
  const HomeTabScreen({super.key});

  static String routeName = "/home_tab_screen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Home'),
        ),
        body: const Body());
  }
}
