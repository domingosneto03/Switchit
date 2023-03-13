import 'package:flutter/material.dart';
import '/ui/home/home_screen.dart';

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
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => const HomeScreen()),
                    (Route<dynamic> route) => false,
                  );
                },
                child: const Text('Home Screen')),
          ))
        ]),
      ),
    );
  }
}
