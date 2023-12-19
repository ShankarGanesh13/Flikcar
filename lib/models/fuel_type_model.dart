class FuelTypeModel {
  String fuelType;
  int id;
  bool isSelected;
  FuelTypeModel({
    required this.fuelType,
    required this.id,
    this.isSelected = false,
  });
  factory FuelTypeModel.fromJson(Map<String, dynamic> fuel) {
    return FuelTypeModel(fuelType: fuel["name"], id: fuel["id"]);
  }
}
