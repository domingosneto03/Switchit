import 'package:flutter/material.dart';
import 'package:switchit/models/user_data_model.dart';
import 'package:switchit/network/network_firestore_controller.dart';

class FollowerCard extends StatefulWidget {
  final UserDataModel follower;
  const FollowerCard({required this.follower, Key? key}) : super(key: key);

  @override
  State<FollowerCard> createState() => _FollowerCardState();
}

class _FollowerCardState extends State<FollowerCard> {
  bool pressed = false;

  void followUser() {
    if (pressed) {
      NetworkFirestoreController().removeFollowerFromCurrentUser(widget.follower.id);
    } else {
      NetworkFirestoreController().addFollowerToCurrentUser(widget.follower.id);
    }
    setState(() {
      pressed = !pressed;
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
                  backgroundColor: pressed
                      ? MaterialStateProperty.all(Colors.white)
                      : MaterialStateProperty.all(Colors.deepPurple),
                  foregroundColor: pressed
                      ? MaterialStateProperty.all(Colors.deepPurple)
                      : MaterialStateProperty.all(Colors.white),
                  side: pressed
                      ? MaterialStateProperty.all(
                          const BorderSide(width: 2, color: Colors.deepPurple))
                      : MaterialStateProperty.all(const BorderSide(
                          width: 0, color: Colors.transparent))),
              onPressed: followUser,
              child: pressed ? const Text("Following") : const Text("Follow"),
            ),
          ),
        ),
      ),
    );
  }
}
