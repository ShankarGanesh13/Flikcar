import 'package:flikcar/models/buyer_car_model.dart';

class CustomerTestDrive {
  String customerName;
  String customerPhone;
  String testDriveDate;
  String address;
  BuyerCar car;
  CustomerTestDrive(
      {required this.car,
      required this.customerName,
      required this.address,
      required this.customerPhone,
      required this.testDriveDate});
  factory CustomerTestDrive.fromJson(Map<String, dynamic> json) {
    return CustomerTestDrive(
      customerName: json["dealer"]["name"] ?? "No data",
      customerPhone: json["dealer"]["phone"].toString(),
      address: json["dealer"]["address_one"] ?? "No data",
      testDriveDate: json["test_drive_date"],
      car: BuyerCar.fromJson(json["vehicle"]),
    );
  }
}
