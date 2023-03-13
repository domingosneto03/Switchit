import 'package:flutter/material.dart';
import 'package:learningdart/ui/credits/credits_screen.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Column(children: [
          Expanded(
              child: Align(
            alignment: Alignment.bottomCenter,
            child: TextButton(
                style: const ButtonStyle(
                  foregroundColor: MaterialStatePropertyAll(Colors.white),
                  backgroundColor: MaterialStatePropertyAll(Colors.red),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, CreditsScreen.routeName);
                },
                child: const Text('Credits Screen')),
          ))
        ]),
      ),
    );
  }
}
