import 'package:flutter/material.dart';
import 'package:switchit/screens/home/profile/followers/view/components/follower_card.dart';

class FollowersTab extends StatefulWidget {
  const FollowersTab({Key? key}) : super(key: key);

  @override
  State<FollowersTab> createState() => _FollowersTabState();
}

class _FollowersTabState extends State<FollowersTab> {
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
