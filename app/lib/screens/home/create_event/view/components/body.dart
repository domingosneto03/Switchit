import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: [],
        ),
      ),
    );
  }
}
