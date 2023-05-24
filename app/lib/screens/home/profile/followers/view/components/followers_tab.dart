import 'package:flutter/material.dart';
import 'package:switchit/screens/home/profile/followers/view/components/follower_card.dart';

import 'package:switchit/models/user_data_model.dart';

class FollowersTab extends StatefulWidget {
  final List<UserDataModel> followers;
  final bool isLoading;

  const FollowersTab({
    Key? key,
    required this.followers,
    required this.isLoading,
  }) : super(key: key);

  @override
  State<FollowersTab> createState() => _FollowersTabState();
}

class _FollowersTabState extends State<FollowersTab> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListView.builder(
          itemCount: widget.followers.length,
          itemBuilder: (BuildContext context, int index) {
            return FollowerCard(follower: widget.followers[index]);
          },
        ),
        Visibility(
          visible: widget.isLoading,
          child: const Center(
            child: CircularProgressIndicator(),
          ),
        )
      ],
    );
  }
}
