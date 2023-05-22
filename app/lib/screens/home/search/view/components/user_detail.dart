import 'package:flutter/material.dart';
import 'package:switchit/screens/home/profile/items_for_trade/view_model/item_data_model.dart';
import 'package:switchit/screens/home/search/view_model/user_data_model.dart';

class UserDetail extends StatelessWidget{

  String ownerEmail;

  UserDetail({Key? key, required this.ownerEmail}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          Expanded(
              flex: 1,
              child: (() {
                return ListView.builder(
                    itemCount: 1,
                    itemBuilder: (context, index) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: const <Widget>[
                          ClipRRect(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(8.0),
                              topRight: Radius.circular(8.0),
                            ),
                          ),
                        ],
                      );
                    });
              }()))
        ],
      ),
    );
  }

}