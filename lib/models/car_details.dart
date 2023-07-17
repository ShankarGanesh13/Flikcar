class FuelType {
  int id;
  String name;
  FuelType({required this.id, required this.name});
  factory FuelType.fromJson(Map<String, dynamic> fuelType) {
    return FuelType(id: fuelType["id"], name: fuelType["name"]);
  }
}
