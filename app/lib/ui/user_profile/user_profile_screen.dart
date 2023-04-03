import 'package:flutter/material.dart';
import '/ui/user_profile/components/body.dart';

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({super.key});

  static String routeName = "/user_profile_screen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('My Profile'),
        ),
        body: Body());
  }
}