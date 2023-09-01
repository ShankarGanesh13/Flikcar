class BuyerCarDisplay {
  int id;
  String brand;
  String model;
  String variant;
  String fuelType;
  String bodyType;
  String mileage;
  String torque;
  String engine;
  String driveKms;
  String maxPower;
  String transmission;
  String technicianRating;
  int price;
  String registerationYear;
  String status;
  String saleStatus;

  List<String> images;
  Dealer dealer;

  BuyerCarDisplay(
      {required this.id,
      required this.brand,
      required this.model,
      required this.variant,
      required this.fuelType,
      required this.bodyType,
      required this.mileage,
      required this.torque,
      required this.engine,
      required this.maxPower,
      required this.transmission,
      required this.technicianRating,
      required this.price,
      required this.status,
      required this.saleStatus,
      required this.images,
      required this.dealer,
      required this.registerationYear,
      required this.driveKms});

  factory BuyerCarDisplay.fromJson(Map<String, dynamic> json) {
    return BuyerCarDisplay(
      id: json['id'],
      brand: json['vehicleBrand']['name'],
      model: json['vehicleModel']['name'],
      variant: json['vehicleVariantType']['name'],
      fuelType: json['vehicleFuelType']['name'],
      bodyType: json["vehicleBodyType"] != null
          ? json['vehicleBodyType']['name']
          : "N.A",
      mileage: json['mileage'].toString(),
      torque: json['torque'].toString(),
      engine: json['engine'].toString(),
      maxPower: json['max_power'].toString(),
      transmission: json['transmission'],
      technicianRating: json['technician_rating'].toString(),
      price: json['car_price'] ?? "N.A",
      status: json['status'] ?? "N.A",
      saleStatus: json['sale_status'],
      driveKms: json["drive_kms"].toString() ?? "N.A",
      registerationYear: json["registration_year"].toString(),
      images: List<String>.from(
          json['vehicleImages'].map((image) => image['path'])),
      dealer: Dealer.fromJson(json['dealer']),
    );
  }
}

class Dealer {
  String phone;
  String name;
  String addressOne;
  String addressTwo;

  Dealer({
    required this.phone,
    required this.name,
    required this.addressOne,
    required this.addressTwo,
  });

  factory Dealer.fromJson(Map<String, dynamic> json) {
    return Dealer(
      phone: json['phone'].toString() ?? "N.A",
      name: json['name'] ?? "N.A",
      addressOne: json['address_one'] ?? "N.A",
      addressTwo: json['address_two'] ?? "N.A",
    );
  }
}
