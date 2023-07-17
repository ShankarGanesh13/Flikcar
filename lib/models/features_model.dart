class FeatureModel {
  String name;
  int id;
  bool isSelected;
  FeatureModel({required this.id, required this.name, this.isSelected = false});

  factory FeatureModel.fromJson(Map<String, dynamic> feature) {
    return FeatureModel(id: feature["id"], name: feature["name"]);
  }
}
