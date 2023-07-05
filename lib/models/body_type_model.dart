class BodyTypeModel {
  String bodyType;
  int id;
  BodyTypeModel({required this.bodyType, required this.id});
  factory BodyTypeModel.fromJson(Map<String, dynamic> bodyType) {
    return BodyTypeModel(bodyType: bodyType["name"], id: bodyType["id"]);
  }
}
