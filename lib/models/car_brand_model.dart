class CarBrandModel {
  int id;
  String brandName;
  String logoImage;
  bool isSelected;
  List<CarModel> models;

  CarBrandModel(
      {required this.brandName,
      required this.models,
      required this.logoImage,
      required this.id,
      this.isSelected = false});

  factory CarBrandModel.fromJson(Map<String, dynamic> brand) {
    return CarBrandModel(
        id: brand["id"],
        brandName: brand["name"],
        models: getModels(brand["vehicleModels"]),
        logoImage: brand["image"]);
  }
  static List<CarModel> getModels(List models) {
    List<CarModel> allModels = [];
    for (var i = 0; i < models.length; i++) {
      allModels.add(
        CarModel.fromJson(models[i]),
      );
    }
    return allModels;
  }
}

class CarModel {
  String model;
  int id;
  bool isSelected;
  CarModel({required this.model, this.isSelected = false, required this.id});

  factory CarModel.fromJson(Map<String, dynamic> carModel) {
    return CarModel(model: carModel["name"], id: carModel["id"]);
  }
}
