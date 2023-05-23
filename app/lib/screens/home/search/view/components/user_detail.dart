import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:switchit/screens/home/profile/items_for_trade/view_model/item_data_model.dart';
import 'package:switchit/screens/home/search/view_model/user_data_model.dart';
import 'package:switchit/network/network_firestore_controller.dart';

class UserDetail extends StatelessWidget{

  String ownerDocId;

  UserDetail({Key? key, required this.ownerDocId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<UserDataModel>(
        future: NetworkFirestoreController().getUserCloud(ownerDocId),
        builder: (BuildContext context, AsyncSnapshot<UserDataModel> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else if (snapshot.hasData) {
            UserDataModel user = snapshot.data!;
            return Scaffold(
              appBar: AppBar(
                title: const Text('User Details'),
              ),
              body: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.blueGrey,
                      ),
                      height: 100,
                      width: 100,
                      margin: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                      child: const Icon(
                        Icons.person,
                        color: Colors.black,
                        size: 100,
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ListTile(
                            title: Text(user.name),
                            subtitle: Text(user.surname),
                          ),
                          ListTile(
                            title: Text(user.email),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          } else {
            // Handle the case when snapshot does not have data (null)
            return const Center(
              child: Text('No user data available.'),
            );
          }
        },
      ),
    );
  }

}