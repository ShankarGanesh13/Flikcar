class FirebaseDealerCarProperties {
  final String brand;
  final String model;
  final String variant;
  final String fuelType;
  final String bodyType;
  final String color;
  final String seat;
  final String ownerType; // 'first owner', 'second owner'
  final String city;
  final String carDescription;
  final int kmsDriven;
  final int registrationYear;
  final String transmission;
  final int engineCC;
  final String maxPower;
  final String mileage;
  final String torque;
  final bool noc;
  final int manufacturingYear;
  final String rtoLocation;
  List<String> comfort;
  List<String> entertainment;
  List<String> exterior;
  List<String> safety;
  List<String> interior;

  FirebaseDealerCarProperties({
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
    required this.manufacturingYear,
    required this.rtoLocation,
    required this.comfort,
    required this.entertainment,
    required this.exterior,
    required this.safety,
    required this.interior,
  });
  factory FirebaseDealerCarProperties.fromJson(Map<String, dynamic> json) {
    return FirebaseDealerCarProperties(
      brand: json['brand'],
      model: json['model'],
      variant: json['variant'],
      fuelType: json['fuelType'],
      bodyType: json['bodyType'],
      color: json['color'],
      seat: json['seat'],
      ownerType: json['ownerType'],
      city: json['city'],
      carDescription: json['carDescription'],
      kmsDriven: json['kmsDriven'],
      registrationYear: json['registrationYear'],
      transmission: json['transmission'],
      engineCC: json['engineCC'],
      maxPower: json['maxPower'],
      mileage: json['mileage'],
      torque: json['torque'],
      noc: json['noc'],
      manufacturingYear: json['manufacturingYear'],
      rtoLocation: json['rtoLocation'],
      comfort: (json['comfort'] as List).cast<String>(),
      entertainment: (json['entertainment'] as List).cast<String>(),
      exterior: (json['exterior'] as List).cast<String>(),
      safety: (json['safety'] as List).cast<String>(),
      interior: (json['interior'] as List).cast<String>(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'brand': brand,
      'model': model,
      'variant': variant,
      'fuelType': fuelType,
      'bodyType': bodyType,
      'color': color,
      'seat': seat,
      'ownerType': ownerType,
      'city': city,
      'carDescription': carDescription,
      'kmsDriven': kmsDriven,
      'registrationYear': registrationYear,
      'transmission': transmission,
      'engineCC': engineCC,
      'maxPower': maxPower,
      'mileage': mileage,
      'torque': torque,
      'noc': noc,
      'manufacturingYear': manufacturingYear,
      'rtoLocation': rtoLocation,
      'comfort': comfort,
      'entertainment': entertainment,
      'exterior': exterior,
      'safety': safety,
      'interior': interior,
    };
  }
}
