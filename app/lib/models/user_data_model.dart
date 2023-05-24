import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:switchit/screens/home/profile/items_for_trade/view_model/item_data_model.dart';

class UserDataModel {
  String id = "";
  String name = "";
  String surname = "";
  String email = "";
  String photoUrl = "";
  //Timestamp timestamp = DateTime.now() as Timestamp;
  List<ItemDataModel> items = [];
  bool isFollowing = false;

  UserDataModel({required this.id, required this.name, required this.surname,
    required this.email, required this.photoUrl, required this.items});

  factory UserDataModel.fromDocument(DocumentSnapshot doc) {
    return UserDataModel(
      id: doc.id,
      email: doc['email'],
      name: doc['name'],
      surname: doc['surname'],
      photoUrl: doc['photoUrl'],
      items: doc['items'],
    );
  }
}
