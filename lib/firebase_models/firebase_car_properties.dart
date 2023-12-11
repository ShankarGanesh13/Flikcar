class FirebaseCarProperties {
  String brand;
  String bodyType;
  List<String> exterior;
  List<String> safety;
  String seat;
  String variant;
  String noc;
  List<String> entertainment;
  List<String> comfort;
  String fuelType;
  String ownerType;
  String transmission;
  String city;
  String rtoLocation;
  List<String> interior;
  String model;
  String inspectionReport;
  String carDescription;
  String color;
  int? roadTaxValidity;
  int? insuranceValidity;
  String inspectionScore;
  String manufacturingYear;
  String registerationYear;
  String maxPower;
  String mileage;
  String engineCC;
  String kmsDriven;
  String maxTorque;

  FirebaseCarProperties({
    required this.manufacturingYear,
    required this.brand,
    required this.registerationYear,
    required this.bodyType,
    required this.exterior,
    required this.safety,
    required this.seat,
    required this.variant,
    required this.maxPower,
    required this.noc,
    required this.mileage,
    required this.entertainment,
    required this.comfort,
    required this.fuelType,
    required this.ownerType,
    required this.transmission,
    required this.city,
    required this.rtoLocation,
    required this.engineCC,
    required this.kmsDriven,
    required this.interior,
    required this.maxTorque,
    required this.inspectionScore,
    required this.model,
    required this.inspectionReport,
    required this.carDescription,
    required this.color,
    this.insuranceValidity,
    this.roadTaxValidity,
  });

  factory FirebaseCarProperties.fromJson(Map<String, dynamic> json) {
    print('firebase car properties from json called');
    print(json["carDescription"]);
    return FirebaseCarProperties(
      manufacturingYear: json['manufacturingYear']?.toString() ?? 'N/A',
      brand: json['brand'] ?? 'N/A',
      registerationYear: json['registrationYear']?.toString() ?? 'N/A',
      bodyType: json['bodyType'] ?? 'N/A',
      exterior: List<String>.from(json['exterior'] ?? []),
      safety: List<String>.from(json['safety'] ?? []),
      seat: json['seat']?.toString() ?? 'N/A',
      variant: json['variant'] ?? 'N/A',
      maxPower: json['maxPower']?.toString() ?? '-',
      noc: json['noc']?.toString() ?? 'N/A',
      mileage: json['mileage']?.toString() ?? '-',
      entertainment: List<String>.from(json['entertainment'] ?? []),
      comfort: List<String>.from(json['comfort'] ?? []),
      fuelType: json['fuelType'] ?? 'N/A',
      ownerType: json['ownerType'] ?? 'N/A',
      transmission: json['transmission'] ?? 'N/A',
      city: json['city'] ?? 'N/A',
      rtoLocation: json['rtoLocation'] ?? 'N/A',
      engineCC: json['engineCC']?.toString() ?? '-',
      kmsDriven: json['kmsDriven']?.toString() ?? 'N/A',
      interior: List<String>.from(json['interior'] ?? []),
      maxTorque: json['maxTorque']?.toString() ?? '-',
      inspectionScore: json['inspectionScore']?.toString() ?? 'N/A',
      model: json['model'] ?? 'N/A',
      inspectionReport: json['inspectionReport'] ?? 'N/A',
      carDescription: json['carDescription'] ?? 'N/A',
      color: json['color'] ?? 'N/A',
      roadTaxValidity: json['roadTaxValidity'],
      insuranceValidity: json['insuranceValidity'],
    );
  }
}
