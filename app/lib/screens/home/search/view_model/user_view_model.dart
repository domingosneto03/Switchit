import 'package:flutter/material.dart';
import 'package:switchit/network/network_firestore_controller.dart';
import 'package:switchit/screens/home/profile/items_for_trade/view_model/item_data_model.dart';
import 'package:switchit/util/status_view.dart';
import 'package:switchit/screens/home/search/view_model/user_data_model.dart';
import 'package:switchit/database/database_realm.dart';

class UsersViewModel extends ChangeNotifier {
  StatusView status = StatusView.intial;

  var userDocId = DatabaseRealm().getUserDocId();

  List<UserDataModel> users = [];

  UsersViewModel() {
    getUsers();
  }

  Future<void> getUsers() async {
    status = StatusView.inProgress;

    notifyListeners();

    users = await NetworkFirestoreController().getAllUsersFromCloud(userDocId);

    status = StatusView.done;

    notifyListeners();
  }
}