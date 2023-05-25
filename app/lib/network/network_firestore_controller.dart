import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:switchit/database/database_realm.dart';
import 'package:switchit/screens/home/profile/items_for_trade/view_model/item_data_model.dart';
import '../screens/home/create_event/view_model/event_data_model.dart';
import 'package:switchit/models/user_data_model.dart';


class TableCloudUser {
  static String name = "users";
  static String fieldUserName = "name";
  static String fieldUserSurname = "surname";
  static String fieldUserEmail = "email";
  static String fieldUserItems = "items";
  static String fieldUserPhotoUrl = "photoUrl";
}

class TableCloudItem {
  static String name = "items";
  static String fieldItemName = "name";
  static String fieldItemDescription = "description";
  static String fieldItemLocation = "location";
  static String fieldItemIsTraded = "traded";
  static String fieldItemOwnerDocId = "ownerDocId";
  static String fieldItemOwnerUsername = "ownerUsername";
  static String fieldItemImageUrl = "imageUrl";
}

class TableCloudEvent {
  static String name = "events";
  static String fieldEventDescription = "description";
  static String fieldEventDate = "date";
  static String fieldEventLocation = "location";
  static String fieldEventImageUrl = "imageUrl";
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

  Future<UserDataModel?> getUserFromCloudId(String userId) async {
    CollectionReference users =
        FirebaseFirestore.instance.collection(TableCloudUser.name);

    try {
      final userDoc = await users.doc(userId).get();
      if (userDoc.exists) {
        String name = userDoc.get(TableCloudUser.fieldUserName);
        String surname = userDoc.get(TableCloudUser.fieldUserSurname);
        String email = userDoc.get(TableCloudUser.fieldUserEmail);
        String photoUrl = userDoc.get(TableCloudUser.fieldUserPhotoUrl);
        List<ItemDataModel> items = await getItemsUserCloud(userDoc.id);

        return UserDataModel(
          id: userId,
          name: name,
          surname: surname,
          email: email,
          photoUrl: photoUrl,
          items: items,
        );
      } else {
        return null; // User document not found
      }
    } catch (error) {
      debugPrint('FirebaseFirestore (getUserFromCloud): Failed to get user: $error');
      return null; // Error occurred while fetching user
    }
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
      TableCloudItem.fieldItemImageUrl: imageUrl,
      TableCloudItem.fieldItemOwnerDocId: await DatabaseRealm().getUserDocId(),
      TableCloudItem.fieldItemOwnerUsername: await DatabaseRealm().getUserName()
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
      String ownerUsername = doc.get(TableCloudItem.fieldItemOwnerUsername);
      String ownerDocId = doc.get(TableCloudItem.fieldItemOwnerDocId);
      debugPrint(
          "FirebaseFirestore (getItemsCurrentUserCloud): ItemDataModel-> name: $name, description: $description, location: $location, isTraded: $isTraded, imageUrl: $imageUrl");

      items.add(
          ItemDataModel(id, name, description, location, isTraded, imageUrl, ownerDocId, ownerUsername)
      );
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
        String photoUrl = doc.get(TableCloudUser.fieldUserPhotoUrl);

        var items = await getItemsUserCloud(doc.id);

        debugPrint(
            "FirebaseFirestore (getItemsCurrentUserCloud): ItemDataModel-> name: $name, surname: $surname, email: $email, items: $items");

        usersList.add(UserDataModel(
            id: id,
            name: name,
            surname: surname,
            email: email,
            items: items,
            photoUrl: photoUrl));
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


  Future<List<UserDataModel>> getFollowersUserCloud(String? docUserId) async {
    CollectionReference followersCollection =
      FirebaseFirestore.instance.collection('followers');
    List<UserDataModel> followers = [];

    QuerySnapshot followerDocs = await followersCollection
      .doc(docUserId!)
      .collection('userFollowers')
      .get();

    for (var doc in followerDocs.docs) {
      String followerId = doc.id;
      UserDataModel? follower = await getUserCloud(followerId);
      followers.add(follower!);
    }
    return followers;
  }

  Future<List<UserDataModel>> getFollowingsUserCloud(String? docUserId) async {
    CollectionReference followingCollection =
        FirebaseFirestore.instance.collection('following');
    List<UserDataModel> followings = [];

    QuerySnapshot followingDocs = await followingCollection
      .doc(docUserId!)
      .collection('userFollowing')
      .get();

    for (var doc in followingDocs.docs) {
      String followingId = doc.id;
      UserDataModel? following = await getUserCloud(followingId);
      followings.add(following!);
    }
    return followings;
  }

  Future<UserDataModel> getUserCloud(String userDocId) async {
    CollectionReference users =
      FirebaseFirestore.instance.collection(TableCloudUser.name);

    List<ItemDataModel> itemsList = [];

    var data = await users.get();

    for (var doc in data.docs) {
      String id = doc.id;

      if (userDocId == id) {
        String name = doc.get(TableCloudUser.fieldUserName);
        String surname = doc.get(TableCloudUser.fieldUserSurname);
        String email = doc.get(TableCloudUser.fieldUserEmail);
        String photoUrl = doc.get(TableCloudUser.fieldUserPhotoUrl);
        var items = await getItemsUserCloud(doc.id);

        debugPrint(
            "FirebaseFirestore (getItemsCurrentUserCloud): ItemDataModel-> name: $name, surname: $surname, email: $email, items: $items");

        return UserDataModel(
            id: id,
            name: name,
            surname: surname,
            email: email,
            photoUrl: photoUrl,
            items: items);
      }
    }
    return UserDataModel(
        id: "",
        name: "",
        surname: "surname",
        email: "email",
        photoUrl: "",
        items: itemsList);
  }

  Future<void> addFollowerToCurrentUser(String followerId) async {
    final currentUserDocId = await DatabaseRealm().getUserDocId();

    final followingCollection = FirebaseFirestore.instance
      .collection('following')
      .doc(currentUserDocId)
      .collection('userFollowing');

    await followingCollection.doc(followerId).set({});

    final followersCollection = FirebaseFirestore.instance
      .collection('followers')
      .doc(followerId)
      .collection('userFollowers');

    await followersCollection.doc(currentUserDocId).set({});
  }

  Future<void> removeFollowerFromCurrentUser(String otherId) async {
    final currentUserDocId = await DatabaseRealm().getUserDocId();

    final followingCollection = FirebaseFirestore.instance
      .collection('following')
      .doc(currentUserDocId)
      .collection('userFollowing');

    await followingCollection.doc(otherId).delete();

    final followersCollection = FirebaseFirestore.instance
      .collection('followers')
      .doc(otherId)
      .collection('userFollowers');

    await followersCollection.doc(currentUserDocId).delete();
  }


  // Event

  Future<bool> addEventCurrentUserToCloud(
       String description,String date,  String location, String imageUrl) async {
    CollectionReference users =
    FirebaseFirestore.instance.collection(TableCloudUser.name);

    var userDocId = await DatabaseRealm().getUserDocId();

    var isAddedToCloud = false;

    await users.doc(userDocId).collection(TableCloudEvent.name).add({
      TableCloudEvent.fieldEventDescription: description,
      TableCloudEvent.fieldEventDate: date,
      TableCloudEvent.fieldEventLocation: location,
      TableCloudEvent.fieldEventImageUrl: imageUrl
    }).then((value) {
      debugPrint("FirebaseFirestore (addEventToCloud): Event Added");
      isAddedToCloud = true;
    }).catchError((error) {
      debugPrint(
          "FirebaseFirestore (addItemToCloud): Failed to add event: $error");
      isAddedToCloud = false;
    });

    return isAddedToCloud;
  }

  Future<List<EventDataModel>> getEventUserCloud(String userDocId) async {
    CollectionReference users =
    FirebaseFirestore.instance.collection(TableCloudUser.name);

    List<EventDataModel> events = [];

    var data = await users.doc(userDocId).collection(TableCloudEvent.name).get();

    var ownerData = await users.get();

    String email;

    for (var doc in ownerData.docs) {
      String id = doc.id;
      if (userDocId == id) {
        String email = doc.get(TableCloudUser.fieldUserEmail);
      }
    }

    for (var doc in data.docs) {
      String id = doc.id;
      String description = doc.get(TableCloudEvent.fieldEventDescription);
      String date = doc.get(TableCloudEvent.fieldEventDate);
      String location = doc.get(TableCloudEvent.fieldEventLocation);
      String imageUrl = doc.get(TableCloudEvent.fieldEventImageUrl);
      String email = "utilizador";
      debugPrint(
          "FirebaseFirestore (getEventsCurrentUserCloud): EventDataModel->  description: $description, date: $date, location: $location, imageUrl: $imageUrl");

      events.add(
          EventDataModel(id, description, date, location, imageUrl, email));
    }

    debugPrint("FirebaseFirestore (getEventsCurrentUserCloud): Success");

    return events;
  }

  Future<bool> removeEventFromCloud(String eventId) async {
    var userDocId = await DatabaseRealm().getUserDocId();

    CollectionReference users =
    FirebaseFirestore.instance.collection(TableCloudUser.name);

    var isRemovedFromCloud = false;

    await users
        .doc(userDocId)
        .collection(TableCloudEvent.name)
        .doc(eventId)
        .delete()
        .then((value) {
      debugPrint("FirebaseFirestore (removeEventFromCloud): Event Removed");
      isRemovedFromCloud = true;
    }).catchError((error) {
      debugPrint(
          "FirebaseFirestore (removeItemFromCloud): Failed to remove event: $error");
      isRemovedFromCloud = false;
    });

    return isRemovedFromCloud;
  }
}
