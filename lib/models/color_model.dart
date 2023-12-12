class ColorModel {
  String color;
  String id;
  String hexCode;
  ColorModel({required this.color, required this.hexCode, required this.id});
  factory ColorModel.fromJson(Map<String, dynamic> color) {
    return ColorModel(
      color: color["name"],
      hexCode: color["code"],
      id: color["id"].toString(),
    );
  }
}
