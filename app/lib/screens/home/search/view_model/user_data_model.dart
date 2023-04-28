import 'package:switchit/screens/home/profile/items_for_trade/view_model/item_data_model.dart';

class UserDataModel {
  String id = "";
  String name = "";
  String surname = "";
  String email = "";
  List<ItemDataModel> items = [];

  UserDataModel(this.id, this.name, this.surname, this.email, this.items);
}
