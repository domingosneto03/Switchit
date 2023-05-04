import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:switchit/screens/home/profile/followers/view/components/followers_tab.dart';
import 'package:switchit/screens/home/profile/followers/view/components/following_tab.dart';

FirebaseFirestore firestore = FirebaseFirestore.instance;
QuerySnapshot querySnapshot = await firestore
  .collection('followers')
  .document(currentUser.id)
  .collection('userFollowers')
  .getDocuments();

class FollowMainScreen extends StatefulWidget {
  const FollowMainScreen({super.key});

  static String routeName = "/followers_screen";

  @override
  State<FollowMainScreen> createState() => _FollowMainScreenState();
}

class _FollowMainScreenState extends State<FollowMainScreen> {
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
              FollowersTab(),
              FollowingTab(),
            ],
          ),
        ),
      ),
    );
  }
}
