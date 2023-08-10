class BuyerCarDisplay {
  String model;
  String brand;
  String status;
  String carPrice;
  String fuel;
  String kmsDriven;
  String registrationYear;
  String transmission;
  String dealerName;
  String dealerPhoneNumber;
  String dealerAddress;
  List<String> images;

  BuyerCarDisplay({
    required this.model,
    required this.brand,
    required this.status,
    required this.carPrice,
    required this.fuel,
    required this.kmsDriven,
    required this.registrationYear,
    required this.transmission,
    required this.dealerName,
    required this.dealerPhoneNumber,
    required this.dealerAddress,
    required this.images,
  });

  factory BuyerCarDisplay.fromJson(Map<String, dynamic> json) {
    return BuyerCarDisplay(
      model: json['model'],
      brand: json['brand'],
      status: json['status'],
      carPrice: json['carPrice'],
      fuel: json['fuel'],
      kmsDriven: json['kmsDriven'],
      registrationYear: json['registrationYear'],
      transmission: json['transmission'],
      dealerName: json['dealerName'],
      dealerPhoneNumber: json['dealerPhoneNumber'],
      dealerAddress: json['dealerAddress'],
      images: List<String>.from(json['images']),
    );
  }
}
