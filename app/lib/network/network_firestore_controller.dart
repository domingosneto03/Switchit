import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:switchit/database/database_realm.dart';
import 'package:switchit/screens/home/profile/items_for_trade/view_model/item_data_model.dart';

class TableCloudUser {
  static String name = "users";
  static String fieldUserName = "name";
  static String fieldUserSurname = "surname";
  static String fieldUserEmail = "email";
  static String fieldUserItems = "items";
}

class TableCloudItem {
  static String name = "items";
  static String fieldItemName = "name";
  static String fieldItemDescription = "description";
  static String fieldItemLocation = "location";
  static String fieldItemIsTraded = "traded";
}

class NetworkFirestoreController {
  // User

  static Future<bool> addUserToCloud(
      String name, String surname, String email) async {
    CollectionReference users =
        FirebaseFirestore.instance.collection(TableCloudUser.name);

    var isAddedToCloud = false;

    await users.add({
      TableCloudUser.fieldUserName: name,
      TableCloudUser.fieldUserSurname: surname,
      TableCloudUser.fieldUserEmail: email
    }).then((value) {
      DatabaseRealm().setUser(name, surname, email, value.id);
      debugPrint(
          "FirebaseFirestore (addUserToCloud): User Added with id: ${value.id}");

      isAddedToCloud = true;
    }).catchError((error) {
      debugPrint(
          "FirebaseFirestore (addUserToCloud): Failed to add user: $error");
      isAddedToCloud = false;
    });

    return isAddedToCloud;
  }

  static Future<bool> removeUserFromCloud(String userId) async {
    CollectionReference users =
        FirebaseFirestore.instance.collection(TableCloudUser.name);

    var isRemovedFromCloud = false;

    await users.doc(userId).delete().then((value) {
      debugPrint("FirebaseFirestore (removeUserFromCloud): User Removed");
      isRemovedFromCloud = true;
    }).catchError((error) {
      debugPrint(
          "FirebaseFirestore (removeUserFromCloud): Failed to remove user: $error");
      isRemovedFromCloud = false;
    });

    return isRemovedFromCloud;
  }

  // Item

  static Future<bool> addItemCurrentUserToCloud(
      String name, String description, String location) async {
    CollectionReference users =
        FirebaseFirestore.instance.collection(TableCloudUser.name);

    var userDocId = await DatabaseRealm().getUserDocId();
    var isAddedToCloud = false;

    await users.doc(userDocId).collection(TableCloudItem.name).add({
      TableCloudItem.fieldItemName: name,
      TableCloudItem.fieldItemDescription: description,
      TableCloudItem.fieldItemLocation: location,
      TableCloudItem.fieldItemIsTraded: false
    }).then((value) {
      debugPrint("FirebaseFirestore (addItemToCloud): Item Added");
      isAddedToCloud = true;
    }).catchError((error) {
      debugPrint(
          "FirebaseFirestore (addItemToCloud): Failed to add item: $error");
      isAddedToCloud = false;
    });

    return isAddedToCloud;
  }

  static Future<List<ItemDataModel>> getItemsCurrentUserCloud() async {
    CollectionReference users =
        FirebaseFirestore.instance.collection(TableCloudUser.name);

    var userDocId = await DatabaseRealm().getUserDocId();

    List<ItemDataModel> items = [];

    users
        .doc(userDocId)
        .collection(TableCloudItem.name)
        .get()
        .then((querySnapshot) {
      for (var doc in querySnapshot.docs) {
        String name = doc.get(TableCloudItem.fieldItemName);
        String description = doc.get(TableCloudItem.fieldItemDescription);
        String location = doc.get(TableCloudItem.fieldItemLocation);
        bool isTraded = doc.get(TableCloudItem.fieldItemIsTraded);

        items.add(ItemDataModel(name, description, location, isTraded));
      }

      debugPrint("FirebaseFirestore (getItemsCurrentUserCloud): Success");
    }).catchError((error) {
      debugPrint(
          "FirebaseFirestore (getItemsCurrentUserCloud): Failed to get items: $error");
    });

    return items;
  }
}
