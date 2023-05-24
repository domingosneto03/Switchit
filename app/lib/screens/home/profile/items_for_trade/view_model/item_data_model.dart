import 'package:switchit/models/user_data_model.dart';

class ItemDataModel {
  String id = "";
  String name = "";
  String description = "";
  String location = "";
  bool traded = false;
  String imageUrl = "";
  String ownerDocId = "";
  String ownerUsername = "";

  ItemDataModel(this.id, this.name, this.description, this.location,
      this.traded, this.imageUrl, this.ownerDocId, this.ownerUsername);
}
