import 'package:flikcar/firebase_models/firebase_display_car_details.dart';

class FirebaseTestDrive {
  final int date;
  final int createdAt;
  final String venue;
  final FirebaseDisplayCar carDetails;
  final String address;
  final bool isDeleted;
  final DealerDetails dealerDetails;
  final String id;
  final CustomerDetails customerDetails;

  FirebaseTestDrive({
    required this.date,
    required this.createdAt,
    required this.venue,
    required this.carDetails,
    required this.address,
    required this.isDeleted,
    required this.dealerDetails,
    required this.id,
    required this.customerDetails,
  });

  factory FirebaseTestDrive.fromJson(Map<String, dynamic> json) {
    return FirebaseTestDrive(
      date: json['date'] ?? 0,
      createdAt: json['createdAt'] ?? 0,
      venue: json['venue'] ?? '',
      carDetails: FirebaseDisplayCar.fromJson(json['carDetails'] ?? {}),
      address: json['address'] ?? '',
      isDeleted: json['isDeleted'] ?? false,
      dealerDetails: DealerDetails.fromJson(json['dealerDetails'] ?? {}),
      id: json['id'] ?? '',
      customerDetails: CustomerDetails.fromJson(json['customerDetails'] ?? {}),
    );
  }
}

class DealerDetails {
  final String firstName;
  final String lastName;
  final String phone;
  final String userId;

  DealerDetails({
    required this.firstName,
    required this.lastName,
    required this.phone,
    required this.userId,
  });

  factory DealerDetails.fromJson(Map<String, dynamic> json) {
    return DealerDetails(
      firstName: json['firstName'] ?? '',
      lastName: json['lastName'] ?? '',
      phone: json['phone'] ?? '',
      userId: json['userId'] ?? '',
    );
  }
}

class CustomerDetails {
  final String firstName;
  final String lastName;
  final String phone;
  final String userId;

  CustomerDetails({
    required this.firstName,
    required this.lastName,
    required this.phone,
    required this.userId,
  });

  factory CustomerDetails.fromJson(Map<String, dynamic> json) {
    return CustomerDetails(
      firstName: json['firstName'] ?? '',
      lastName: json['lastName'] ?? '',
      phone: json['phone'] ?? '',
      userId: json['userId'] ?? '',
    );
  }
}
