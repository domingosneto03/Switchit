import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:switchit/database/database_realm.dart';
import 'package:switchit/screens/home/profile/items_for_trade/view_model/item_data_model.dart';

import 'package:switchit/screens/home/search/view_model/user_data_model.dart';

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
  static String fieldItemImageUrl = "imageUrl";
}

class NetworkFirestoreController {
  static final NetworkFirestoreController _singleton =
      NetworkFirestoreController._internal();

  factory NetworkFirestoreController() {
    return _singleton;
  }

  NetworkFirestoreController._internal();

  // User

  Future<bool> addUserToCloud(String name, String surname, String email) async {
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

  Future<bool> getUserFromCloud(String email) async {
    CollectionReference users =
        FirebaseFirestore.instance.collection(TableCloudUser.name);

    var success = false;

    await users
        .where(TableCloudUser.fieldUserEmail, isEqualTo: email)
        .get()
        .then(
      (querySnapshot) async {
        var user = querySnapshot.docs.first;
        await DatabaseRealm().setUser(
            user.get(TableCloudUser.fieldUserName),
            user.get(TableCloudUser.fieldUserSurname),
            user.get(TableCloudUser.fieldUserEmail),
            user.id);

        debugPrint("FirebaseFirestore (getUserFromCloud): Success");
        success = true;
      },
      onError: (e) => {
        debugPrint(
            "FirebaseFirestore (getUserFromCloud): Failed to get user: $e"),
        success = false
      },
    );
    return success;
  }

  Future<bool> removeUserFromCloud(String userId) async {
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

  Future<bool> addItemCurrentUserToCloud(
      String name, String description, String location, String imageUrl) async {
    CollectionReference users =
        FirebaseFirestore.instance.collection(TableCloudUser.name);

    var userDocId = await DatabaseRealm().getUserDocId();

    var isAddedToCloud = false;

    await users.doc(userDocId).collection(TableCloudItem.name).add({
      TableCloudItem.fieldItemName: name,
      TableCloudItem.fieldItemDescription: description,
      TableCloudItem.fieldItemLocation: location,
      TableCloudItem.fieldItemIsTraded: false,
      TableCloudItem.fieldItemImageUrl: imageUrl
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

  Future<List<ItemDataModel>> getItemsUserCloud(String userDocId) async {
    CollectionReference users =
        FirebaseFirestore.instance.collection(TableCloudUser.name);

    List<ItemDataModel> items = [];

    var data = await users.doc(userDocId).collection(TableCloudItem.name).get();

    for (var doc in data.docs) {
      String id = doc.id;
      String name = doc.get(TableCloudItem.fieldItemName);
      String description = doc.get(TableCloudItem.fieldItemDescription);
      String location = doc.get(TableCloudItem.fieldItemLocation);
      bool isTraded = doc.get(TableCloudItem.fieldItemIsTraded);
      String imageUrl = doc.get(TableCloudItem.fieldItemImageUrl);

      debugPrint(
          "FirebaseFirestore (getItemsCurrentUserCloud): ItemDataModel-> name: $name, description: $description, location: $location, isTraded: $isTraded, imageUrl: $imageUrl");

      items.add(
          ItemDataModel(id, name, description, location, isTraded, imageUrl));
    }

    debugPrint("FirebaseFirestore (getItemsCurrentUserCloud): Success");

    return items;
  }

  Future<bool> removeItemFromCloud(String itemId) async {
    var userDocId = await DatabaseRealm().getUserDocId();

    CollectionReference users =
        FirebaseFirestore.instance.collection(TableCloudUser.name);

    var isRemovedFromCloud = false;

    await users
        .doc(userDocId)
        .collection(TableCloudItem.name)
        .doc(itemId)
        .delete()
        .then((value) {
      debugPrint("FirebaseFirestore (removeItemFromCloud): Item Removed");
      isRemovedFromCloud = true;
    }).catchError((error) {
      debugPrint(
          "FirebaseFirestore (removeItemFromCloud): Failed to remove item: $error");
      isRemovedFromCloud = false;
    });

    return isRemovedFromCloud;
  }

  Future<List<UserDataModel>> getAllItemsCloud() async {
    CollectionReference users =
        FirebaseFirestore.instance.collection(TableCloudUser.name);

    var userDocId = await DatabaseRealm().getUserDocId();

    List<UserDataModel> usersList = [];

    var data = await users.get();

    for (var doc in data.docs) {
      String id = doc.id;

      if (userDocId != id) {
        String name = doc.get(TableCloudUser.fieldUserName);
        String surname = doc.get(TableCloudUser.fieldUserSurname);
        String email = doc.get(TableCloudUser.fieldUserEmail);

        var items = await getItemsUserCloud(doc.id);

        debugPrint(
            "FirebaseFirestore (getItemsCurrentUserCloud): ItemDataModel-> name: $name, surname: $surname, email: $email, items: $items");

        usersList.add(UserDataModel(id, name, surname, email, items));
      }
    }

    debugPrint("FirebaseFirestore (getItemsCurrentUserCloud): Success");

    return usersList;
  }

  Future<List<ItemDataModel>> getAllItems() async {
    List<ItemDataModel> itemsList = [];
    List<UserDataModel> usersData = await getAllItemsCloud();

    for (UserDataModel user in usersData) {
      itemsList.addAll(user.items);
    }
    return itemsList;
  }
}
