import 'package:flutter/material.dart';
import 'package:switchit/network/network_firestore_controller.dart';
import 'package:switchit/screens/home/profile/items_for_trade/view_model/item_data_model.dart';
import 'package:switchit/util/status_view.dart';

class ItemsForTradeViewModel extends ChangeNotifier {
  StatusView status = StatusView.intial;

  List<ItemDataModel> items = [];
  List<ItemDataModel> originalItems = [];

  String message = '';

  ItemsForTradeViewModel() {
    getAllItems();
  }

  Future<void> getAllItems() async {
    status = StatusView.inProgress;

    notifyListeners();

    items = await NetworkFirestoreController().getAllItems();
    originalItems = items;

    status = StatusView.done;

    notifyListeners();
  }


  void filterSearchResults(String query) {
    items = originalItems
        .where((item) => item.name.toLowerCase().contains(query.toLowerCase()))
        .toList();

    notifyListeners();
  }
}
