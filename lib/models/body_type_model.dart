class BodyTypeModel {
  String bodyType;
  int id;
  bool isSelected;
  BodyTypeModel({
    required this.bodyType,
    required this.id,
    this.isSelected = false,
  });
  factory BodyTypeModel.fromJson(Map<String, dynamic> bodyType) {
    return BodyTypeModel(bodyType: bodyType["name"], id: bodyType["id"]);
  }
}

class TransmissionType {
  String transmissionType;
  int id;
  bool isSelected;
  TransmissionType({
    required this.transmissionType,
    required this.id,
    this.isSelected = false,
  });
  factory TransmissionType.fromJson(Map<String, dynamic> bodyType) {
    return TransmissionType(
        transmissionType: bodyType["name"], id: bodyType["id"]);
  }
}
