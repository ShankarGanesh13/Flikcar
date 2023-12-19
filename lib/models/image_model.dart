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

class FirebaseVideoModel {
  String videoUrl;
  String videoType;
  String thumbnailUrl;
  FirebaseVideoModel(
      {required this.videoType,
      required this.videoUrl,
      required this.thumbnailUrl});

  factory FirebaseVideoModel.fromJson(Map<String, dynamic> video) {
    return FirebaseVideoModel(
      videoType: video["type"].toString(),
      videoUrl: video["path"],
      thumbnailUrl: video["thumb"],
    );
  }
}
