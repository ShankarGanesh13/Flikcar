class BrandModelVarient {
  String name;
  List<Model> models;

  BrandModelVarient({required this.name, required this.models});

  factory BrandModelVarient.fromJson(Map<String, dynamic> json) {
    var modelList = json['models'] as List;
    List<Model> models =
        modelList.map((modelJson) => Model.fromJson(modelJson)).toList();

    return BrandModelVarient(
      name: json['name'],
      models: models,
    );
  }
}

class Model {
  String name;
  List<Varient> varients;

  Model({
    required this.name,
    required this.varients,
  });

  factory Model.fromJson(Map<String, dynamic> json) {
    var varientList = json['variants'] as List;
    List<Varient> varients = varientList
        .map((varientJson) => Varient.fromJson(varientJson))
        .toList();

    return Model(
      name: json['name'],
      varients: varients,
    );
  }
}

class Varient {
  String name;

  Varient({
    required this.name,
  });

  factory Varient.fromJson(String json) {
    return Varient(
      name: json,
    );
  }
}
