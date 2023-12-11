class FirebaseBuyerCarProperties {
  final String brand;
  final String model;
  final String variant;
  final String fuelType;
  final String bodyType;
  final String color;
  final String seat;
  final String ownerType;
  final String city;
  final String rto;

  final String carDescription; // optional can be an empty string
  final int kmsDriven;
  final int registrationYear;
  final String transmission;
  final int? engineCC;
  final String? maxPower;
  final String? mileage;
  final String? torque;
  final bool? noc; // optional

  final int manufacturedYear;
  final String rtoLocation;

  List<String> comfort;
  List<String> entertainment;
  List<String> exterior;
  List<String> safety;
  List<String> interior;

  FirebaseBuyerCarProperties({
    required this.brand,
    required this.model,
    required this.variant,
    required this.fuelType,
    required this.bodyType,
    required this.color,
    required this.seat,
    required this.ownerType,
    required this.city,
    required this.carDescription,
    required this.kmsDriven,
    required this.registrationYear,
    required this.transmission,
    required this.engineCC,
    required this.maxPower,
    required this.mileage,
    required this.torque,
    required this.noc,
    required this.manufacturedYear,
    required this.rtoLocation,
    required this.comfort,
    required this.entertainment,
    required this.exterior,
    required this.safety,
    required this.interior,
    required this.rto,
  });

  factory FirebaseBuyerCarProperties.fromJson(Map<String, dynamic> json) {
    return FirebaseBuyerCarProperties(
      brand: json['brand'] ?? '',
      model: json['model'] ?? '',
      variant: json['variant'] ?? '',
      fuelType: json['fuelType'] ?? '',
      bodyType: json['bodyType'] ?? '',
      color: json['color'] ?? '',
      seat: json['seat'] ?? '',
      ownerType: json['ownerType'] ?? '',
      city: json['city'] ?? '',
      carDescription: json['carDescription'] ?? '',
      kmsDriven: json['kmsDriven'] ?? 0,
      registrationYear: json['registrationYear'] ?? 0,
      transmission: json['transmission'] ?? '',
      engineCC: json['engineCC'] ?? 0,
      maxPower: json['maxPower'] ?? '',
      mileage: json['mileage'] ?? '',
      torque: json['torque'] ?? '',
      rto: json["rtoLocation"] ?? "",
      noc: json['noc'] ?? false,
      manufacturedYear: json['manufacturedYear'] ?? 0,
      rtoLocation: json['rtoLocation'] ?? '',
      comfort: List<String>.from(json['comfort'] ?? []),
      entertainment: List<String>.from(json['entertainment'] ?? []),
      exterior: List<String>.from(json['exterior'] ?? []),
      safety: List<String>.from(json['safety'] ?? []),
      interior: List<String>.from(json['interior'] ?? []),
    );
  }
}
