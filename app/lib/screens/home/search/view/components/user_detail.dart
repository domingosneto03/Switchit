import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:switchit/screens/home/profile/items_for_trade/view_model/item_data_model.dart';
import 'package:switchit/screens/home/search/view_model/user_data_model.dart';
import 'package:switchit/network/network_firestore_controller.dart';
import 'package:switchit/screens/home/search/view_model/user_view_model.dart';

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
            // Display a loading indicator while fetching the user data
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            // Display an error message if an error occurred
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else if (snapshot.hasData) {
            // User data has been successfully fetched
            UserDataModel user = snapshot.data!;
            return Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                Expanded(
                  flex: 1,
                  child: ListView.builder(
                    itemCount: 1,
                    itemBuilder: (context, index) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          ClipRRect(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(8.0),
                              topRight: Radius.circular(8.0),
                            ),
                            // Use the user data to display information
                            child: Text('Name: ${user.name}'),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ],
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