import 'package:flutter/material.dart';
import 'package:learningdart/ui/home/components/body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Home screen'),
        ),
        body: const Body());
  }
}
