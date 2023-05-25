
import 'package:flutter/material.dart';
import 'package:switchit/database/database_realm.dart';
import 'package:switchit/network/network_firestore_controller.dart';

class PostCard extends StatelessWidget {
  final snap;
  const PostCard({Key? key, required this.snap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(
            vertical: 10
        ),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(
                  vertical: 4,
                  horizontal: 16
              ).copyWith(right: 0),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 16,
                    backgroundImage: AssetImage('assets/images/user.png'),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 8
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            DatabaseRealm().getUserSurname(),
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  IconButton(onPressed: () {
                    showDialog(context: context, builder: (context) => Dialog(
                      child: ListView(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shrinkWrap: true,
                        children: [
                          'Delete',
                        ].map(
                              (e) => InkWell(
                            onTap: () async {
                              NetworkFirestoreController().removeEventFromCloud('tentei');
                              Navigator.of(context).pop();
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(vertical: 12, horizontal:16),
                              child: Text(e),
                            ),
                          ),
                        ).toList(),
                      ),
                    ) );
                  }, icon: Icon(Icons.more_horiz)),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.35,
              width: double.infinity,
              child: Image.network(snap['imageUrl'],
                fit: BoxFit.cover,
              ),
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.only(left:12, bottom: 3, top: 8),
              child: RichText(
                text: TextSpan(
                  style: const TextStyle(color: Colors.black),
                  children: [
                    TextSpan(
                      text:
                      DatabaseRealm().getUserSurname(),
                      style: const TextStyle(color: Colors.deepPurpleAccent, fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                      text: ' ${snap['description']}',
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.only(left:12, bottom: 3),
              child: RichText(
                text: TextSpan(
                  style: const TextStyle(color: Colors.black),
                  children: [
                    TextSpan(
                      text: 'Event date:',
                      style: const TextStyle(color: Colors.deepPurpleAccent, fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                      text: ' ${snap['date']}',
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.only(left:12, bottom: 3),
              child: RichText(
                text: TextSpan(
                  style: const TextStyle(color: Colors.black),
                  children: [
                    TextSpan(
                      text: 'Location:',
                      style: const TextStyle(color: Colors.deepPurpleAccent, fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                      text: ' ${snap['location']}',
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
    );
  }

}