import 'package:flutter/material.dart';
import '/ui/followers/components/followers_body.dart';

class FollowersScreen extends StatelessWidget {
  const FollowersScreen({super.key});

  static String routeName = "/followers_screen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Followers'),
        ),
        body: Body());
  }
}