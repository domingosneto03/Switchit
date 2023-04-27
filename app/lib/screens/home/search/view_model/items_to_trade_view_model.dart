import 'package:flutter/material.dart';
import 'package:switchit/network/network_firestore_controller.dart';
import 'package:switchit/screens/home/profile/items_for_trade/view_model/item_data_model.dart';
import 'package:switchit/util/status_view.dart';

class ItemsForTradeViewModel extends ChangeNotifier {
  StatusView status = StatusView.intial;

  List<ItemDataModel> items = [];

  String message ='';

  ItemsForTradeViewModel() {
    getAllItems();
  }


  Future<void> getAllItems() async {
    status = StatusView.inProgress;

    notifyListeners();

    items = await NetworkFirestoreController().getAllItemsCloud();

    status = StatusView.done;

    notifyListeners();
  }

}
