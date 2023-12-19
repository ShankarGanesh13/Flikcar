class OwnerTypeModel {
  String ownerType;
  int id;
  bool isSelected;
  OwnerTypeModel({
    required this.ownerType,
    required this.id,
    this.isSelected = false,
  });
  factory OwnerTypeModel.fromJson(Map<String, dynamic> owner) {
    return OwnerTypeModel(ownerType: owner["type"] ?? "", id: owner["id"]);
  }
}
