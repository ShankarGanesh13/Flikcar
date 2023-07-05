class OwnerTypeModel {
  String ownerType;
  int id;
  OwnerTypeModel({required this.ownerType, required this.id});
  factory OwnerTypeModel.fromJson(Map<String, dynamic> owner) {
    return OwnerTypeModel(ownerType: owner["type"] ?? "", id: owner["id"]);
  }
}
