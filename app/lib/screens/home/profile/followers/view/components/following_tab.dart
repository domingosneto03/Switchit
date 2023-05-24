import 'package:flutter/material.dart';
import 'package:switchit/screens/home/profile/followers/view/components/follower_card.dart';

import 'package:switchit/models/user_data_model.dart';

class FollowingTab extends StatefulWidget {
  const FollowingTab({required this.following, Key? key});
  final List<UserDataModel> following;

  @override
  State<FollowingTab> createState() => _FollowingTabState();
}

class _FollowingTabState extends State<FollowingTab> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.following.length,
      itemBuilder: (BuildContext context, int index) {
        return FollowerCard(follower: widget.following[index]);
      },
    );
  }
}
