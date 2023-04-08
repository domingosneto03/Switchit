import 'package:flutter/material.dart';
import 'package:switchit/network/network_firestore_controller.dart';
import 'package:switchit/network/network_storage_controller.dart';
import 'package:switchit/screens/home/profile/items_for_trade/view_model/item_data_model.dart';
import 'package:switchit/util/status_view.dart';

class ItemsForTradeViewModel extends ChangeNotifier {
  StatusView status = StatusView.intial;
  String message = "";

  String newItemImageUrl = "";
  String newItemName = "";
  String newItemDescription = "";
  String newItemLocation = "";

  List<ItemDataModel> items = [];

  ItemsForTradeViewModel() {
    getItemsCurrentUser();
  }

  Future<void> onPhotoSelected(String? imagePath) async {
    status = StatusView.inProgress;

    notifyListeners();

    try {
      var result = await NetworkStorageController().uploadPhoto(imagePath!);

      if (result.isEmpty) {
        message = "Something went wrong";
        status = StatusView.messageToShow;
      } else {
        newItemImageUrl = result;
        message = "";
        status = StatusView.done;
      }
    } catch (e) {
      message = "Something went wrong.";
      status = StatusView.messageToShow;
    }

    notifyListeners();
  }

  Future<void> createItem() async {
    status = StatusView.inProgress;

    notifyListeners();

    if (newItemImageUrl.isEmpty) {
      message = "Please choose a valid image.";
      status = StatusView.messageToShow;
      notifyListeners();
      return;
    }
    if (newItemName.isEmpty || newItemName.length < 2) {
      message = "Please enter a valid name.";
      status = StatusView.messageToShow;
      notifyListeners();
      return;
    }
    if (newItemDescription.isEmpty || newItemDescription.length < 10) {
      message = "Please enter a valid description.";
      status = StatusView.messageToShow;
      notifyListeners();
      return;
    }
    if (newItemLocation.isEmpty || newItemLocation.length < 10) {
      message = "Please enter a valid location.";
      status = StatusView.messageToShow;
      notifyListeners();
      return;
    }

    var result = await NetworkFirestoreController().addItemCurrentUserToCloud(
        newItemName, newItemDescription, newItemLocation, newItemImageUrl);

    if (result) {
      status = StatusView.done;
    } else {
      message = "Something went wrong.";
      status = StatusView.messageToShow;
    }

    notifyListeners();
  }

  Future<void> getItemsCurrentUser() async {
    status = StatusView.inProgress;

    notifyListeners();

    items = await NetworkFirestoreController().getItemsCurrentUserCloud();

    status = StatusView.done;

    notifyListeners();
  }

  Future<void> deleteItem(String itemId) async {
    status = StatusView.inProgress;

    notifyListeners();

    var result = await NetworkFirestoreController().removeItemFromCloud(itemId);

    if (result) {
      status = StatusView.done;
    } else {
      message = "Something went wrong.";
      status = StatusView.messageToShow;
    }

    notifyListeners();
  }
}
