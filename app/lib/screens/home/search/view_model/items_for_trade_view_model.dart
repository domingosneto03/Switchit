import 'package:flutter/material.dart';
import 'package:switchit/network/network_firestore_controller.dart';
import 'package:switchit/screens/home/profile/items_for_trade/view_model/item_data_model.dart';
import 'package:switchit/screens/home/search/view_model/user_data_model.dart';
import 'package:switchit/screens/home/search/view_model/user_view_model.dart';
import 'package:switchit/util/status_view.dart';

class ItemsForTradeViewModel extends ChangeNotifier {
  StatusView status = StatusView.intial;
  String message = "";

  List<ItemDataModel> items = [];

  ItemsForTradeViewModel() {
    getItems();
  }

  Future<void> getItems() async {
    status = StatusView.inProgress;

    notifyListeners();

    for(UserDataModel user in UsersViewModel().users){
      for(ItemDataModel item in user.items){
        items.add(item);
      }
    }

    status = StatusView.done;

    notifyListeners();
  }
}