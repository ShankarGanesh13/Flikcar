import 'package:flikcar/firebase_models/firebase_dealer_car_properties.dart';
import 'package:flikcar/models/image_model.dart';

class FirebaseDealerCar {
  String id;
  int carPrice;
  String status; // ACTIVE or INACTIVE
  List<FirebaseImageModel> images;
  FirebaseDealerCarProperties properties;
  String saleStatus; // AVAILABLE or SOLD
  String uploadedBy;
  DateTime uploadedAt;
  FirebaseDealer dealer;

  FirebaseDealerCar({
    required this.id,
    required this.carPrice,
    required this.status,
    required this.images,
    required this.properties,
    required this.saleStatus,
    required this.uploadedBy,
    required this.uploadedAt,
    required this.dealer,
  });
  factory FirebaseDealerCar.fromJson(Map<String, dynamic> json) {
    return FirebaseDealerCar(
      id: json['id'],
      carPrice: json['carPrice'],
      status: json['status'],
      images: (json['images'] as List)
          .map((image) => FirebaseImageModel.fromJson(image))
          .toList(),
      properties: FirebaseDealerCarProperties.fromJson(json['properties']),
      saleStatus: json['saleStatus'],
      uploadedBy: json['uploadedBy'],
      uploadedAt: DateTime.parse(json['uploadedAt']),
      dealer: FirebaseDealer.fromJson(json['dealer']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'carPrice': carPrice,
      'status': status,
      'images': images.map((image) => image.toJson()).toList(),
      'properties': properties.toJson(),
      'saleStatus': saleStatus,
      'uploadedBy': uploadedBy,
      'uploadedAt': uploadedAt.toIso8601String(),
      'dealer': dealer.toJson(),
    };
  }
}

class FirebaseDealer {
  String dealerId;
  String name;
  String phone;
  String address;

  FirebaseDealer({
    required this.dealerId,
    required this.name,
    required this.phone,
    required this.address,
  });
  factory FirebaseDealer.fromJson(Map<String, dynamic> json) {
    return FirebaseDealer(
      dealerId: json['dealerId'],
      name: json['name'],
      phone: json['phone'],
      address: json['address'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'dealerId': dealerId,
      'name': name,
      'phone': phone,
      'address': address,
    };
  }
}
