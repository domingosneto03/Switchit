import 'package:flutter/material.dart';
import '/ui/followers/components/following_body.dart';

class FollowingScreen extends StatelessWidget {
  const FollowingScreen({super.key});

  static String routeName = "/following_screen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Following'),
        ),
        body: Body());
  }
}