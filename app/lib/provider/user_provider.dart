import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:switchit/models/user_data_model.dart';

class UserProvider extends ChangeNotifier {
  late UserDataModel currentUser;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  void setCurrentUser(UserDataModel user) {
    currentUser = user;
    notifyListeners();
  }

  Future<UserDataModel> getCurrentUser(String userId) async {
    final userDoc = await _firestore.collection('users').doc(userId).get();
    UserDataModel user = UserDataModel.fromDocument(userDoc);
    print(user);
    return user;
  }

  Future<List<String>> getCurrentUserFollowers() async {
    final followerDocs = await _firestore
      .collection('followers')
      .doc(currentUser.id)
      .collection('userFollowers')
      .get();
    return followerDocs.docs.map((doc) => doc.id).toList();
  }

  Future<UserDataModel> getFollowerById(String followerId) async {
    final followerDoc =
        await _firestore.collection('users').doc(followerId).get();
    return UserDataModel.fromDocument(followerDoc);
  }

  Future<List<String>> getCurrentUserFollowing() async {
    final followingDocs = await _firestore
        .collection('following')
        .doc(currentUser.id)
        .collection('userFollowing')
        .get();
    return followingDocs.docs.map((doc) => doc.id).toList();
  }

  Future<UserDataModel> getFollowingById(String followingId) async {
    final followingDoc =
        await _firestore.collection('users').doc(followingId).get();
    return UserDataModel.fromDocument(followingDoc);
  }


}

