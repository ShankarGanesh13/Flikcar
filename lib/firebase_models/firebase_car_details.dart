import 'package:flikcar/firebase_models/firebase_car_owner.dart';
import 'package:flikcar/firebase_models/firebase_car_properties.dart';
import 'package:flikcar/models/image_model.dart';

class FirebaseCarDetails {
  String id;
  FirebaseCarProperties properties;
  int carPrice;
  List<FirebaseImageModel> imageModel;
  String status;
  // FirebaseCarOwner owner;

  FirebaseCarDetails({
    required this.id,
    required this.properties,
    required this.carPrice,
    required this.imageModel,
    required this.status,
    //   required this.owner,
  });
  factory FirebaseCarDetails.fromJson(Map<String, dynamic> json) {
    return FirebaseCarDetails(
      id: json['id'] as String,
      properties: FirebaseCarProperties.fromJson(json['properties']),
      carPrice: json['carPrice'] ?? 0,
      imageModel: (json['images'] as List<dynamic>?)
              ?.map(
                  (e) => FirebaseImageModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      status: json['status'] as String,
      //   owner: FirebaseCarOwner.fromJson(json['owner']),
    );
  }
}
