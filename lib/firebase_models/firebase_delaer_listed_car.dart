class FirebaseDealerListedCar {
  String id;
  String brand;
  String model;
  String variant;
  String fuelType;
  String kmsDriven;
  String registrationYear;
  String transmission;
  String status;
  String? saleStatus;
  int createdAt;

  FirebaseDealerListedCar({
    required this.id,
    required this.brand,
    required this.model,
    required this.variant,
    required this.fuelType,
    required this.kmsDriven,
    required this.registrationYear,
    required this.transmission,
    required this.status,
    required this.createdAt,
    this.saleStatus,
  });

  factory FirebaseDealerListedCar.fromJson(Map<String, dynamic> json) {
    return FirebaseDealerListedCar(
      id: json['vehicleId'] ?? '',
      brand: json['brand'] ?? '',
      model: json['model'] ?? '',
      variant: json['variant'] ?? '',
      fuelType: json['fuelType'] ?? '',
      kmsDriven: json['kmsDriven'].toString(),
      registrationYear: json['registrationYear'].toString(),
      transmission: json['transmission'] ?? '',
      status: json['status'] ?? '',
      saleStatus: json['saleStatus'] ?? '',
      createdAt: json["createdAt"] ?? 0,
    );
  }
}
