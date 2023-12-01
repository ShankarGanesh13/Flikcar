class FirebaseDisplayCar {
  final String id;
  final int registrationYear;
  final String variant;
  final String city;
  final String ownerType;
  final String model;
  final String seat;
  final String brand;
  final int kmsDriven;
  final String transmission;
  final String fuelType;
  final String imagePath;
  final String color;
  final String bodyType;

  FirebaseDisplayCar({
    required this.id,
    required this.registrationYear,
    required this.variant,
    required this.city,
    required this.ownerType,
    required this.model,
    required this.seat,
    required this.brand,
    required this.kmsDriven,
    required this.transmission,
    required this.fuelType,
    required this.imagePath,
    required this.color,
    required this.bodyType,
  });

  factory FirebaseDisplayCar.fromJson(Map<String, dynamic> json) {
    return FirebaseDisplayCar(
      id: json['id'] ?? '',
      registrationYear: json['registerationYear'] ?? 0,
      variant: json['variant'] ?? '',
      city: json['city'] ?? '',
      ownerType: json['ownerType'] ?? '',
      model: json['model'] ?? '',
      seat: json['seat'] ?? '',
      brand: json['brand'] ?? '',
      kmsDriven: json['kmsDriven'] ?? 0,
      transmission: json['transmission'] ?? '',
      fuelType: json['fuelType'] ?? '',
      imagePath: json['imagePath'] ?? '',
      color: json['color'] ?? '',
      bodyType: json['bodyType'] ?? '',
    );
  }
}
