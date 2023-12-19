import 'package:flikcar/firebase_models/firebase_car_owner.dart';
import 'package:flikcar/firebase_models/firebase_car_properties.dart';
import 'package:flikcar/models/image_model.dart';

class FirebaseAuctionCarDetails {
  String id;
  FirebaseAuctionCarProperties properties;
  int carPrice;
  List<FirebaseImageModel> imageModel;
  List<FirebaseVideoModel> videos;
  String status;
  // FirebaseCarOwner owner;

  FirebaseAuctionCarDetails({
    required this.id,
    required this.properties,
    required this.carPrice,
    required this.imageModel,
    required this.status,
    required this.videos,
    //   required this.owner,
  });
  factory FirebaseAuctionCarDetails.fromJson(Map<String, dynamic> json) {
    return FirebaseAuctionCarDetails(
      id: json['id'] as String,
      properties: FirebaseAuctionCarProperties.fromJson(json['properties']),
      carPrice: json['carPrice'] ?? 0,
      imageModel: (json['images'] as List<dynamic>?)
              ?.map(
                  (e) => FirebaseImageModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      status: json['status'] as String,
      videos: (json['videos'] as List<dynamic>?)
              ?.map(
                  (e) => FirebaseVideoModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      //   owner: FirebaseCarOwner.fromJson(json['owner']),
    );
  }
}
