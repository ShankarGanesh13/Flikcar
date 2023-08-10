import 'package:isar/isar.dart';

class BuyerCar {
  int id;
  String carName;
  String carDescription;
  String mileage;
  String torque;
  String engine;
  String maxPower;
  String driveKms;
  String registrationYear;
  String transmission;
  String groundClearance;
  String bootSpace;
  String noOfSeatsRow;
  String fuelTankCapacity;
  String wheelbase;
  String length;
  String alloyWheels;
  String frontTyres;
  String rearTyres;
  String spareWheel;
  String noOfDoors;
  String height;
  String width;
  String wheelCover;
  String drivetrain;
  String gearBox;
  String displacement;
  String noOfCylinders;
  String valveCylinders;
  String turbocharger;
  String limitedSlipDiffe;
  String maxTorque;
  String suspensionFront;
  String suspensionRear;
  String frontBrakeType;
  String rearBrakeType;
  String steeringType;
  String mStringurningRadius;
  String carPrice;
  String? salePrice;
  String? soldTo;
  String? saleAt;
  String status;
  String saleStatus;
  String brand;
  String model;
  String variant;
  String fuel;
  String bodytype;
  String color;
  String seat;
  String ownertype;
  String updatedAt;
  List<String> carImages;
  List<String> featureDetails;
  List<String> exteriorDetails;
  List<String> comfortDetails;
  List<String> entertainmentDetails;
  List<String> interiorDetails;
  List<String> safetyDetails;
  String dealerId;
  String? dealerPhoneNumber;
  String? dealerName;
  String? dealerAddress;
  String technicianRating;
  bool isFavourite;

  BuyerCar(
      {required this.id,
      required this.carName,
      required this.carDescription,
      required this.mileage,
      required this.torque,
      required this.engine,
      required this.maxPower,
      required this.driveKms,
      required this.registrationYear,
      required this.transmission,
      required this.groundClearance,
      required this.bootSpace,
      required this.noOfSeatsRow,
      required this.fuelTankCapacity,
      required this.wheelbase,
      required this.length,
      required this.alloyWheels,
      required this.frontTyres,
      required this.rearTyres,
      required this.spareWheel,
      required this.noOfDoors,
      required this.height,
      required this.width,
      required this.wheelCover,
      required this.drivetrain,
      required this.gearBox,
      required this.displacement,
      required this.noOfCylinders,
      required this.valveCylinders,
      required this.turbocharger,
      required this.limitedSlipDiffe,
      required this.maxTorque,
      required this.suspensionFront,
      required this.suspensionRear,
      required this.frontBrakeType,
      required this.rearBrakeType,
      required this.steeringType,
      required this.mStringurningRadius,
      required this.carPrice,
      required this.salePrice,
      required this.soldTo,
      required this.saleAt,
      required this.status,
      required this.saleStatus,
      required this.brand,
      required this.model,
      required this.variant,
      required this.fuel,
      required this.bodytype,
      required this.color,
      required this.seat,
      required this.ownertype,
      required this.updatedAt,
      required this.featureDetails,
      required this.exteriorDetails,
      required this.comfortDetails,
      required this.carImages,
      required this.entertainmentDetails,
      required this.interiorDetails,
      required this.safetyDetails,
      required this.dealerId,
      required this.technicianRating,
      this.dealerName,
      this.isFavourite = false,
      this.dealerPhoneNumber,
      this.dealerAddress});

  factory BuyerCar.fromJson(Map<String, dynamic> json) {
    return BuyerCar(
      id: json['id'] ?? "No data",
      carName: json['car_name'] ?? "No data",
      carDescription: json['car_description'] ?? "No data",
      mileage: json['mileage'].toString() ?? "No data",
      torque: json['torque'].toString() ?? "No data",
      engine: json['engine'].toString() ?? "No data",
      maxPower: json['max_power'].toString() ?? "No data",
      driveKms: json['drive_kms'].toString() ?? "No data",
      registrationYear: json['registration_year'].toString() ?? "No data",
      transmission: json['transmission'] ?? "No data",
      groundClearance: json['ground_clearance'].toString() ?? "No data",
      bootSpace: json['boot_space'].toString() ?? "No data",
      noOfSeatsRow: json['no_of_seats_row'].toString() ?? "No data",
      fuelTankCapacity: json['fuel_tank_capacity'].toString() ?? "No data",
      wheelbase: json['wheelbase'].toString() ?? "No data",
      length: json['length'].toString() ?? "No data",
      alloyWheels: json['alloy_wheels'] ?? "No data",
      frontTyres: json['front_tyres'] ?? "No data",
      rearTyres: json['rear_tyres'] ?? "No data",
      spareWheel: json['spare_wheel'] ?? "No data",
      noOfDoors: json['no_of_doors'].toString() ?? "No data",
      height: json['height'].toString() ?? "No data",
      width: json['width'].toString() ?? "No data",
      wheelCover: json['wheel_cover'] ?? "No data",
      drivetrain: json['drivetrain'] ?? "No data",
      gearBox: json['gear_box'].toString() ?? "No data",
      displacement: json['displacement'].toString() ?? "No data",
      noOfCylinders: json['no_of_cylinders'].toString() ?? "No data",
      valveCylinders: json['valve_cylinders'].toString() ?? "No data",
      turbocharger: json['turbocharger'] ?? "No data",
      limitedSlipDiffe: json['limited_slip_diffe'] ?? "No data",
      maxTorque: json['max_torque'].toString() ?? "No data",
      suspensionFront: json['suspension_front'] ?? "No data",
      suspensionRear: json['suspension_rear'] ?? "No data",
      frontBrakeType: json['front_brake_type'] ?? "No data",
      rearBrakeType: json['rear_brake_type'] ?? "No data",
      steeringType: json['steering_type'] ?? "No data",
      mStringurningRadius: json['min_turning_radius'].toString() ?? "No data",
      carPrice: json['car_price'].toString() ?? "No data",
      salePrice: json['sale_price'].toString() ?? "Na data",
      soldTo: json['sold_to'].toString() ?? "No data",
      saleAt: json['sale_at'].toString() ?? "No data",
      //status= Active/Inactive
      status: json['status'] ?? "No data",
      //sale status=Available/Sold Out
      saleStatus: json['sale_status'] ?? "No data",
      updatedAt: json["updatedAt"] ?? "No data",

      ///
      brand: json['vehicleBrand']["name"] ?? "No data",
      model: json['vehicleModel']["name"] ?? "No data",
      variant: json['vehicleVariantType']["name"] ?? "No data",
      fuel: json['vehicleFuelType']["name"] ?? "No data",
      bodytype: json['vehicleBodyType']["name"] ?? "No data",
      color: json['vehicleColor']["name"] ?? "No data",
      seat: json['vehicleSeat']["no_of_seats"].toString() ?? "No data",
      ownertype: json['vehicleOwnerType']["type"] ?? "No data",
      //
      carImages: List<String>.from(myfunc("path", json["vehicleImages"])),
      featureDetails: json['vehicleFeature'] != null
          ? List<String>.from(myfunc("name", json['vehicleFeature']))
          : [],
      exteriorDetails: json['vehicleExterior'] != null
          ? List<String>.from(myfunc("name", json['vehicleExterior']))
          : [],
      comfortDetails: json['vehicleComfortConvenience'] != null
          ? List<String>.from(myfunc("name", json['vehicleComfortConvenience']))
          : [],
      entertainmentDetails: json['vehicleEntertainmentCommunications'] != null
          ? List<String>.from(
              myfunc("name", json['vehicleEntertainmentCommunications']))
          : [],
      interiorDetails: json['vehicleInterior'] != null
          ? List<String>.from(myfunc("name", json['vehicleInterior']))
          : [],
      safetyDetails: json['vehicleSafety'] != null
          ? List<String>.from(myfunc("name", json['vehicleSafety']))
          : [],
      dealerId: json["dealer_id"].toString(),
      dealerName: json["dealer"] != null ? json["dealer"]["name"] : "",
      dealerPhoneNumber:
          json["dealer"] != null ? json["dealer"]["phone"].toString() : "",
      dealerAddress: json["dealer"] != null ? json["address_one"] : "",
      technicianRating: json["technician_rating"].toString(),
    );
  }
  static List<String> myfunc(key, List list) {
    List<String> result = [];

    if (list.isNotEmpty) {
      list.forEach((e) => result.add(
            e[key].toString(),
          ));
    }
    return result;
  }
}
