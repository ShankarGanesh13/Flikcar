import 'package:flikcar/firebase_models/firebase_car_owner.dart';

class FirebaseBuyerCarProperties {
  String RTOlocation;
  String bodyType;
  String brand;
  String city;
  String color;
  List<String> comfort;
  String description;
  int engineCC;
  List<String> exterior;
  String fuelType;
  List<String> interior;
  int kmsDriven;
  int manufacturedYear;
  int maxPower;
  int? torque;
  int? mileage;
  String model;
  String ownerType;
  int registrationYear;
  List<String> safety;
  List<String> entertainment;

  String saleStatus;
  int seat;
  String transmission;
  int uploadedAt;
  String uploadedBy;
  String variant;
  FirebaseCarOwner dealer;

  FirebaseBuyerCarProperties({
    required this.RTOlocation,
    required this.bodyType,
    required this.brand,
    required this.city,
    required this.color,
    required this.comfort,
    required this.description,
    required this.engineCC,
    required this.exterior,
    required this.fuelType,
    required this.interior,
    required this.kmsDriven,
    required this.manufacturedYear,
    required this.maxPower,
    this.torque,
    this.mileage,
    required this.model,
    required this.ownerType,
    required this.registrationYear,
    required this.safety,
    required this.saleStatus,
    required this.seat,
    required this.transmission,
    required this.uploadedAt,
    required this.uploadedBy,
    required this.variant,
    required this.dealer,
    required this.entertainment,
  });

  factory FirebaseBuyerCarProperties.fromJson(Map<String, dynamic> json) {
    return FirebaseBuyerCarProperties(
      RTOlocation: json['RTOlocation'] ?? '',
      bodyType: json['bodyType'] ?? '',
      brand: json['brand'] ?? '',
      city: json['city'] ?? '',
      color: json['color'] ?? '',
      comfort: List<String>.from(json['comfort'] ?? []),
      description: json['description'] ?? '',
      engineCC: json['engineCC'] ?? 0,
      exterior: List<String>.from(json['exterior'] ?? []),
      fuelType: json['fuelType'] ?? '',
      interior: List<String>.from(json['interior'] ?? []),
      kmsDriven: json['kmsDriven'] ?? 0,
      manufacturedYear: json['manufacturedYear'] ?? 0,
      maxPower: json['maxPower'] ?? 0,
      torque: json['maxTorque'],
      mileage: json['mileage'],
      model: json['model'] ?? '',
      ownerType: json['ownerType'] ?? '',
      registrationYear: json['registrationYear'] ?? 0,
      safety: List<String>.from(json['safety'] ?? []),
      saleStatus: json['saleStatus'] ?? '',
      seat: json['seat'] ?? 0,
      transmission: json['transmission'] ?? '',
      uploadedAt: json['uploadedAt'] ?? 0,
      uploadedBy: json['uploadedBy'] ?? '',
      variant: json['variant'] ?? '',
      entertainment: List<String>.from(json['entertainment'] ?? []),
      dealer: FirebaseCarOwner.fromJson(json['dealer'] ?? <String, dynamic>{}),
    );
  }
}
