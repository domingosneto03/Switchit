import 'package:flutter/material.dart';
import 'package:switchit/screens/home/profile/followers/view/components/follower_card.dart';

class FollowingTab extends StatefulWidget {
  const FollowingTab({Key? key}) : super(key: key);

  @override
  State<FollowingTab> createState() => _FollowingTabState();
}

class _FollowingTabState extends State<FollowingTab> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(8.0),
      children: const <Widget>[
        FollowerCard(),
        FollowerCard(),
        FollowerCard(),
      ],
    );
  }
}
