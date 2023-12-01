class CarListing {
  final String id;
  final double price;
  final String createdAt;
  final String createdBy;
  final List<Image> media;
  final Owner owner;
  final Properties properties;
  final String status;
  final String updatedAt;
  final String interior;
  final String exterior;
  final String comfort;
  final String safety;
  final String entertainment;
  final String inspectionReport;
  final String inspectionScore; //out of 5

  CarListing({
    required this.id,
    required this.price,
    required this.createdAt,
    required this.createdBy,
    required this.media,
    required this.owner,
    required this.properties,
    required this.status,
    required this.updatedAt,
    required this.interior,
    required this.exterior,
    required this.comfort,
    required this.safety,
    required this.entertainment,
    required this.inspectionReport,
    required this.inspectionScore,
  });

  // factory CarListing.fromJson(Map<String, dynamic> json) {
  //   return CarListing(
  //     id: json['id'] ?? '',
  //     price: json['price'] ?? 0.0,
  //     createdAt: json['createdAt'] ?? '',
  //     createdBy: json['createdBy'] ?? '',
  //     media: (json['media'] as List<dynamic>?)
  //             ?.map((item) => Image.fromJson(item))
  //             .toList() ??
  //         [],
  //     owner: Owner.fromJson(json['owner'] ?? {}),
  //     properties: Properties.fromJson(json['properties'] ?? {}),
  //     status: json['status'] ?? '',
  //     updatedAt: json['updatedAt'] ?? '',
  //     interior: json['interior'] ?? '',
  //     exterior: json['exterior'] ?? '',
  //     comfort: json['comfort'] ?? '',
  //     safety: json['safety'] ?? '',
  //     entertainment: json['entertainment'] ?? '',
  //   );
  // }
}

class Image {
  final String path;
  final String type;

  Image({
    required this.path,
    required this.type,
  });

  factory Image.fromJson(Map<String, dynamic> json) {
    return Image(
      path: json['path'] ?? '',
      type: json['type'] ?? '',
    );
  }
}

class Owner {
  final String phone;
  final String address;
  final String name;
  final String id;

  Owner({
    required this.phone,
    required this.address,
    required this.name,
    required this.id,
  });

  factory Owner.fromJson(Map<String, dynamic> json) {
    return Owner(
      phone: json['phone'] ?? '',
      address: json['address'] ?? '',
      name: json['name'] ?? '',
      id: json['id'] ?? '',
    );
  }
}

class Properties {
  final int registrationYear;
  final String bodyType;
  final int kmsDriven;
  final String seat;
  final String color;
  final String fuelType;
  final String brand;
  final String ownerType;
  final String model;
  final String city;
  final String variant;
  final String transmission;

  Properties({
    required this.registrationYear,
    required this.bodyType,
    required this.kmsDriven,
    required this.seat,
    required this.color,
    required this.fuelType,
    required this.brand,
    required this.ownerType,
    required this.model,
    required this.city,
    required this.variant,
    required this.transmission,
  });

  factory Properties.fromJson(Map<String, dynamic> json) {
    return Properties(
      registrationYear: json['registrationYear'] ?? 0,
      bodyType: json['bodyType'] ?? '',
      kmsDriven: json['kmsDriven'] ?? 0,
      seat: json['seat'] ?? '',
      color: json['color'] ?? '',
      fuelType: json['fuelType'] ?? '',
      brand: json['brand'] ?? '',
      ownerType: json['ownerType'] ?? '',
      model: json['model'] ?? '',
      city: json['city'] ?? '',
      variant: json['variant'] ?? '',
      transmission: json['transmission'] ?? '',
    );
  }
}
  // class Specification{
  //   String mileage;
  //   String engine;
  //   String maxPower;
  //   String torque;
  //   String seats;
    
  // }
