class FeatureModel {
  String name;

  bool isSelected;
  FeatureModel({required this.name, this.isSelected = false});

  factory FeatureModel.fromJson(String feature) {
    return FeatureModel(name: feature);
  }
}
