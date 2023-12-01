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

class FirebaseImageModel {
  String imageUrl;
  String imageType;
  FirebaseImageModel({required this.imageType, required this.imageUrl});

  factory FirebaseImageModel.fromJson(Map<String, dynamic> image) {
    return FirebaseImageModel(
      imageType: image["type"].toString(),
      imageUrl: image["path"],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'path': imageUrl,
      'type': imageType,
    };
  }
}
