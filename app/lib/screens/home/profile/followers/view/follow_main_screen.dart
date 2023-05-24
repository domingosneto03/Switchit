import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:switchit/database/database_realm.dart';
import 'package:switchit/models/user_data_model.dart';
import 'package:switchit/network/network_firestore_controller.dart';
import 'package:switchit/screens/home/profile/followers/view/components/followers_tab.dart';
import 'package:switchit/screens/home/profile/followers/view/components/following_tab.dart';

class FollowMainScreen extends StatefulWidget {
  const FollowMainScreen({Key? key}) : super(key: key);

  static String routeName = "/followers_screen";

  @override
  State<FollowMainScreen> createState() => _FollowMainScreenState();
}

class _FollowMainScreenState extends State<FollowMainScreen> {
  bool _isLoading = false;

  NetworkFirestoreController networkFirestoreController =
      NetworkFirestoreController();

  List<UserDataModel> _followers = [];
  List<UserDataModel> _following = [];

  @override
  void initState() {
    super.initState();
    networkFirestoreController = NetworkFirestoreController();
    fetchFollowers();
    fetchFollowing();
  }

  Future<void> fetchFollowers() async {

    var userDocId = await DatabaseRealm().getUserDocId();

    List<UserDataModel> followers =
        await networkFirestoreController.getFollowersUserCloud(userDocId);

    setState(() {
      _followers = followers;
    });
  }

  Future<void> fetchFollowing() async {

    var userDocId = await DatabaseRealm().getUserDocId();

    List<UserDataModel> following =
        await networkFirestoreController.getFollowingsUserCloud(userDocId);

    setState(() {
      _following = following;
    });
  }

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
            title: const Text("Followers/Following"),
          ),
          body: TabBarView(
            children: [
              FollowersTab(
                followers: _followers,
                isLoading: _isLoading,
              ),
              FollowingTab(
                following: _following,
                isLoading: _isLoading,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
