import 'package:flutter/material.dart';
import 'package:switchit/ui/followers/follow_main_screen.dart';
import 'package:switchit/ui/messages/messages_screen.dart';
import 'package:switchit/ui/user_profile/user_profile_screen.dart';
import '/ui/credits/credits_screen.dart';

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
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                  width: 400,
                  child: Row(
                    children: [
                      Expanded(
                        child: TextButton(
                          style: const ButtonStyle(
                            foregroundColor:
                                MaterialStatePropertyAll(Colors.white),
                            backgroundColor:
                                MaterialStatePropertyAll(Colors.red),
                          ),
                          onPressed: () {
                            Navigator.pushNamed(
                                context, CreditsScreen.routeName);
                          },
                          child: const Text('Credits Screen'),
                        ),
                      ),
                      Expanded(
                          child: TextButton(
                              style: const ButtonStyle(
                                foregroundColor:
                                    MaterialStatePropertyAll(Colors.white),
                                backgroundColor:
                                    MaterialStatePropertyAll(Colors.red),
                              ),
                              onPressed: () {
                                Navigator.pushNamed(
                                    context, MessagesScreen.routeName);
                              },
                              child: const Text('Messages'),
                          ),
                      ),
                      Expanded(
                        child: TextButton(
                          style: const ButtonStyle(
                            foregroundColor:
                            MaterialStatePropertyAll(Colors.white),
                            backgroundColor:
                            MaterialStatePropertyAll(Colors.red),
                          ),
                          onPressed: () {
                            Navigator.pushNamed(
                                context, UserProfileScreen.routeName);
                          },
                          child: const Text('Profile'),
                        ),
                      ),
                      Expanded(
                          child: TextButton(
                              style: const ButtonStyle(
                                foregroundColor:
                                MaterialStatePropertyAll(Colors.white),
                                backgroundColor:
                                MaterialStatePropertyAll(Colors.red),
                              ),
                              onPressed: () {
                                Navigator.pushNamed(
                                    context, FollowMainScreen.routeName);
                              },
                              child: const Text('Followers/Following')))
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
