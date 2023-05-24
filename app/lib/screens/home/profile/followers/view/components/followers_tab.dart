import 'package:flutter/material.dart';
import 'package:switchit/screens/home/profile/followers/view/components/follower_card.dart';

import 'package:switchit/models/user_data_model.dart';

class FollowersTab extends StatefulWidget {
  final List<UserDataModel> followers;

  const FollowersTab({
    Key? key,
    required this.followers,
  }) : super(key: key);

  @override
  State<FollowersTab> createState() => _FollowersTabState();
}

class _FollowersTabState extends State<FollowersTab> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.followers.length,
      itemBuilder: (BuildContext context, int index) {
        return FollowerCard(follower: widget.followers[index]);
      },
    );
  }
}
