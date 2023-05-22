import 'package:switchit/screens/home/search/view_model/user_data_model.dart';

class ItemDataModel {
  String id = "";
  String name = "";
  String description = "";
  String location = "";
  bool traded = false;
  String imageUrl = "";
  String ownerEmail;

  ItemDataModel(this.id, this.name, this.description, this.location,
      this.traded, this.imageUrl, this.ownerEmail);
}
