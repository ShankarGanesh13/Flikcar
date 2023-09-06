class ImageModel {
  String imageUrl;
  String imageType;
  ImageModel({required this.imageType, required this.imageUrl});

  factory ImageModel.fromJson(Map<String, dynamic> image) {
    return ImageModel(
      imageType: image["image_type_id"].toString(),
      imageUrl: image["path"],
    );
  }
}
