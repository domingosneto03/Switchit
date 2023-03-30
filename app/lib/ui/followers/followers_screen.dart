import 'package:flutter/material.dart';
import '/ui/followers/components/followers_body.dart';

class FollowersScreen extends StatefulWidget {
  const FollowersScreen({super.key});

  static String routeName = "/followers_screen";

  @override
  State<FollowersScreen> createState() => _FollowersScreenState();
}

class _FollowersScreenState extends State<FollowersScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            bottom: const TabBar(
              tabs: [
                Tab(text: "Followers"),
                Tab(text: "Following"),
              ],
            ),
            title: const Text("Followers"),
          ),
          body: const TabBarView(
            children: [
              Text(
                "Followers",
                textAlign: TextAlign.center,
              ),
              Text(
                "Following",
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
      ),
    );
  }
}
