import 'package:flutter/material.dart';
import 'package:learningdart/ui/credits/components/body.dart';

class CreditsScreen extends StatelessWidget {
  const CreditsScreen({super.key});

  static String routeName = "/credits_screen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Credits'),
        ),
        body: const Body());
  }
}
