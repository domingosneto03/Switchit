import 'package:flutter/material.dart';
import 'package:switchit/screens/home/profile/followers/view/components/follower_card.dart';

import 'package:switchit/models/user_data_model.dart';

class FollowingTab extends StatefulWidget {
  final List<UserDataModel> following;

  const FollowingTab({
    Key? key,
    required this.following,
  }) : super(key: key);

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
