class ItemDataModel {
  String id = "";
  String name = "";
  String description = "";
  String location = "";
  bool traded = false;
  String imageUrl = "";
  String owner;

  ItemDataModel(this.id, this.name, this.description, this.location,
      this.traded, this.imageUrl, this.owner);
}
