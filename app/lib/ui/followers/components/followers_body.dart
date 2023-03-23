import 'package:flutter/material.dart';
import 'package:switchit/ui/followers/followers_screen.dart';

import '../following_screen.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            Expanded(
              child: Align(
                alignment: Alignment.topCenter,
                child: SizedBox(
                  width: 400,
                  child: Row(
                    children: [
                      Expanded(
                          child: TextButton(
                              style: const ButtonStyle(
                                foregroundColor:
                                MaterialStatePropertyAll(Colors.black),

                              ),
                              onPressed: () {
                                Navigator.pushNamed(
                                    context, FollowersScreen.routeName);
                              },
                              child: const Text('Followers')
                          )
                      ),
                      Expanded(
                          child: TextButton(
                              style: const ButtonStyle(
                                foregroundColor:
                                MaterialStatePropertyAll(Colors.grey),
                              ),
                              onPressed: () {
                                Navigator.pushNamed(
                                    context, FollowingScreen.routeName);
                              },
                              child: const Text('Following')
                          )
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}