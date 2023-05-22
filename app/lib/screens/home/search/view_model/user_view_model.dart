import 'package:flutter/material.dart';
import 'package:switchit/network/network_firestore_controller.dart';
import 'package:switchit/screens/home/profile/items_for_trade/view_model/item_data_model.dart';
import 'package:switchit/screens/home/search/view_model/user_data_model.dart';
import 'package:switchit/util/status_view.dart';

class UserViewModel extends ChangeNotifier {
  StatusView status = StatusView.intial;

  UserDataModel? user;

  String message = '';

  Future<void> getUser(String docId) async {
    status = StatusView.inProgress;

    notifyListeners();

    user = await NetworkFirestoreController().getUserCloud(docId);

    status = StatusView.done;

    notifyListeners();
  }
}
