import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:switchit/models/user_data_model.dart';
import 'package:switchit/network/network_firestore_controller.dart';

import 'package:switchit/database/database_realm.dart';

class FollowerCard extends StatefulWidget {
  final UserDataModel follower;
  const FollowerCard({required this.follower, Key? key}) : super(key: key);

  @override
  State<FollowerCard> createState() => _FollowerCardState();
}

class _FollowerCardState extends State<FollowerCard> {
  bool isFollowing = false;

  @override
  void initState() {
    super.initState();
    checkIfFollowing();
  }

  void followUser() {
    if (isFollowing) {
      NetworkFirestoreController().removeFollowerFromCurrentUser(widget.follower.id);
    } else {
      NetworkFirestoreController().addFollowerToCurrentUser(widget.follower.id);
    }
    checkIfFollowing();
  }

  Future<void> checkIfFollowing() async {
    final currentUserId = await DatabaseRealm().getUserDocId();

    CollectionReference followersCollection =
      FirebaseFirestore.instance.collection('followers');

    DocumentSnapshot followerDoc = await followersCollection
        .doc(widget.follower.id)
        .collection('userFollowers')
        .doc(currentUserId)
        .get();
    setState(() {
      isFollowing = followerDoc.exists;
    });
  }



  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: Card(
        child: ListTile(
          contentPadding: const EdgeInsets.all(10),
          leading: Image.network(widget.follower.photoUrl),
          title: Text("${widget.follower.name} ${widget.follower.surname}"),
          trailing: SizedBox(
            width: 100,
            child: ElevatedButton(
              style: ButtonStyle(
                  padding: MaterialStateProperty.all(
                      const EdgeInsets.only(left: 15, right: 15)),
                  backgroundColor: isFollowing
                      ? MaterialStateProperty.all(Colors.white)
                      : MaterialStateProperty.all(Colors.deepPurple),
                  foregroundColor: isFollowing
                      ? MaterialStateProperty.all(Colors.deepPurple)
                      : MaterialStateProperty.all(Colors.white),
                  side: isFollowing
                      ? MaterialStateProperty.all(
                          const BorderSide(width: 2, color: Colors.deepPurple))
                      : MaterialStateProperty.all(const BorderSide(
                          width: 0, color: Colors.transparent))),
              onPressed: followUser,
              child: isFollowing ? const Text("Following") : const Text("Follow"),
            ),
          ),
        ),
      ),
    );
  }
}
