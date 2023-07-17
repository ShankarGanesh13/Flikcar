import 'package:flikcar/models/buyer_car_model.dart';

class DealerTestDrive {
  String customerName;
  String customerPhone;
  String testDriveDate;
  BuyerCar car;
  DealerTestDrive(
      {required this.car,
      required this.customerName,
      required this.customerPhone,
      required this.testDriveDate});
  factory DealerTestDrive.fromJson(Map<String, dynamic> json) {
    return DealerTestDrive(
      customerName: json["Customer"]["fname"] ?? "No data",
      customerPhone: json["Customer"]["phone"],
      testDriveDate: json["test_drive_date"],
      car: BuyerCar.fromJson(json["vehicle"]),
    );
  }
}
