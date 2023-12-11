import 'package:flikcar/firebase_models/firebase_buyer_car_properties.dart';
import 'package:flikcar/firebase_models/firebase_car_owner.dart';
import 'package:flikcar/firebase_models/firebase_car_properties.dart';
import 'package:flikcar/models/image_model.dart';

class FirebaseBuyerCar {
  String id;
  String carPrice;
  List<FirebaseImageModel> images;
  FirebaseBuyerCarProperties properties;
  FirebaseCarOwner owner;
  String saleStatus;
  String status;
  int updatedAt;

  FirebaseBuyerCar(
      {required this.id,
      required this.carPrice,
      required this.images,
      required this.properties,
      required this.owner,
      required this.saleStatus,
      required this.status,
      required this.updatedAt});

  factory FirebaseBuyerCar.fromJson(Map<String, dynamic> json) {
    return FirebaseBuyerCar(
        id: json['id'] ?? '',
        carPrice: json['carPrice'] ?? '',
        images: List<FirebaseImageModel>.from((json['images'] ?? [])
            .map((image) => FirebaseImageModel.fromJson(image))),
        properties: FirebaseBuyerCarProperties.fromJson(
            json['properties'] ?? <String, dynamic>{}),
        owner: FirebaseCarOwner.fromJson(json['owner'] ?? <String, dynamic>{}),
        saleStatus: json['saleStatus'] ?? '',
        status: json['status'] ?? '',
        updatedAt: json["updatedAt"]);
  }
}
