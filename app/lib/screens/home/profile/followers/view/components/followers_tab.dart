import 'package:flutter/material.dart';
import 'package:switchit/screens/home/profile/followers/view/components/follower_card.dart';

import '../../../../../../models/user_data_model.dart';

class FollowersTab extends StatefulWidget {
  const FollowersTab({required this.followers});
  final List<UserDataModel> followers;


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
