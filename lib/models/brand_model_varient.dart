class BrandModelVarient {
  int id;
  String name;
  String image;
  List<Model> models;

  BrandModelVarient(
      {required this.id,
      required this.image,
      required this.name,
      required this.models});

  factory BrandModelVarient.fromJson(Map<String, dynamic> json) {
    var modelList = json['vehicleModels'] as List;
    List<Model> models =
        modelList.map((modelJson) => Model.fromJson(modelJson)).toList();

    return BrandModelVarient(
      id: json['id'],
      image: json['image'],
      name: json['name'],
      models: models,
    );
  }
}

class Model {
  int brandId;
  int modelId;
  String name;
  List<Varient> varients;

  Model({
    required this.brandId,
    required this.modelId,
    required this.name,
    required this.varients,
  });

  factory Model.fromJson(Map<String, dynamic> json) {
    var varientList = json['vehicleVariantTypes'] as List;
    List<Varient> varients = varientList
        .map((varientJson) => Varient.fromJson(varientJson))
        .toList();

    return Model(
      brandId: json['brand_id'],
      modelId: json['id'],
      name: json['name'],
      varients: varients,
    );
  }
}

class Varient {
  int varientId;
  int modelId;
  int brandId;
  String name;

  Varient({
    required this.varientId,
    required this.modelId,
    required this.name,
    required this.brandId,
  });

  factory Varient.fromJson(Map<String, dynamic> json) {
    return Varient(
      varientId: json['id'],
      modelId: json['model_id'],
      name: json['name'],
      brandId: json['brand_id'],
    );
  }
}
