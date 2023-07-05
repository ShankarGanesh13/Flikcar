class FuelTypeModel {
  String fuelType;
  int id;
  FuelTypeModel({required this.fuelType, required this.id});
  factory FuelTypeModel.fromJson(Map<String, dynamic> fuel) {
    return FuelTypeModel(fuelType: fuel["name"], id: fuel["id"]);
  }
}
