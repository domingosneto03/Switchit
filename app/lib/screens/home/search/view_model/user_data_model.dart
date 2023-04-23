import 'package:switchit/screens/home/profile/items_for_trade/view_model/item_data_model.dart';

class UserDataModel {
  String id = "";
  String name = "";
  String surname = "";
  String email = "";
  List<ItemDataModel> items = [];

  UserDataModel.fromMap(Map<String, dynamic> data){
    id = data['id'];
    name = data[name];
    surname = data['surname'];
    email = data['email'];
    items = data['items'];
  }
}
