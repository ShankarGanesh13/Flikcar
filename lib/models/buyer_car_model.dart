import 'package:isar/isar.dart';

part "buyer_car_model.g.dart";

@collection
class BuyerCar {
  @Index(unique: true, replace: true)
  Id id;
  String carName;
  String carDescription;
  int mileage;
  int torque;
  int engine;
  int maxPower;
  int driveKms;
  int registrationYear;
  String transmission;
  int groundClearance;
  int bootSpace;
  int noOfSeatsRow;
  int fuelTankCapacity;
  int wheelbase;
  int length;
  String alloyWheels;
  String frontTyres;
  String rearTyres;
  String spareWheel;
  int noOfDoors;
  int height;
  int width;
  String wheelCover;
  String drivetrain;
  int gearBox;
  int displacement;
  int noOfCylinders;
  int valveCylinders;
  String turbocharger;
  String limitedSlipDiffe;
  String maxTorque;
  String suspensionFront;
  String suspensionRear;
  String frontBrakeType;
  String rearBrakeType;
  String steeringType;
  int minTurningRadius;
  int carPrice;
  int? salePrice;
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
  int seat;
  String ownertype;
  List<String> carImages;
  List<String> featureDetails;
  List<String> exteriorDetails;
  List<String> comfortDetails;
  List<String> entertainmentDetails;
  List<String> interiorDetails;
  List<String> safetyDetails;
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
      required this.minTurningRadius,
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
      required this.featureDetails,
      required this.exteriorDetails,
      required this.comfortDetails,
      required this.carImages,
      required this.entertainmentDetails,
      required this.interiorDetails,
      required this.safetyDetails});

  factory BuyerCar.fromJson(Map<String, dynamic> json) {
    return BuyerCar(
      id: json['id'] ?? "Data not available",
      carName: json['car_name'] ?? "Data not available",
      carDescription: json['car_description'] ?? "Data not available",
      mileage: json['mileage'] ?? "Data not available",
      torque: json['torque'] ?? "Data not available",
      engine: json['engine'] ?? "Data not available",
      maxPower: json['max_power'] ?? "Data not available",
      driveKms: json['drive_kms'] ?? "Data not available",
      registrationYear: json['registration_year'] ?? "Data not available",
      transmission: json['transmission'] ?? "Data not available",
      groundClearance: json['ground_clearance'] ?? "Data not available",
      bootSpace: json['boot_space'] ?? "Data not available",
      noOfSeatsRow: json['no_of_seats_row'] ?? "Data not available",
      fuelTankCapacity: json['fuel_tank_capacity'] ?? "Data not available",
      wheelbase: json['wheelbase'] ?? "Data not available",
      length: json['length'] ?? "Data not available",
      alloyWheels: json['alloy_wheels'] ?? "Data not available",
      frontTyres: json['front_tyres'] ?? "Data not available",
      rearTyres: json['rear_tyres'] ?? "Data not available",
      spareWheel: json['spare_wheel'] ?? "Data not available",
      noOfDoors: json['no_of_doors'] ?? "Data not available",
      height: json['height'] ?? "Data not available",
      width: json['width'] ?? "Data not available",
      wheelCover: json['wheel_cover'] ?? "Data not available",
      drivetrain: json['drivetrain'] ?? "Data not available",
      gearBox: json['gear_box'] ?? "Data not available",
      displacement: json['displacement'] ?? "Data not available",
      noOfCylinders: json['no_of_cylinders'] ?? "Data not available",
      valveCylinders: json['valve_cylinders'] ?? "Data not available",
      turbocharger: json['turbocharger'] ?? "Data not available",
      limitedSlipDiffe: json['limited_slip_diffe'] ?? "Data not available",
      maxTorque: json['max_torque'] ?? "Data not available",
      suspensionFront: json['suspension_front'] ?? "Data not available",
      suspensionRear: json['suspension_rear'] ?? "Data not available",
      frontBrakeType: json['front_brake_type'] ?? "Data not available",
      rearBrakeType: json['rear_brake_type'] ?? "Data not available",
      steeringType: json['steering_type'] ?? "Data not available",
      minTurningRadius: json['min_turning_radius'] ?? "Data not available",
      carPrice: json['car_price'] ?? "Data not available",
      salePrice: json['sale_price'] ?? 0,
      soldTo: json['sold_to'] ?? "Data not available",
      saleAt: json['sale_at'] ?? "Data not available",
      status: json['status'] ?? "Data not available",
      saleStatus: json['sale_status'] ?? "Data not available",

      ///
      brand: json['vehicleBrand']["name"] ?? "Data not available",
      model: json['vehicleModel']["name"] ?? "Data not available",
      variant: json['vehicleVariantType']["name"] ?? "Data not available",
      fuel: json['vehicleFuelType']["name"] ?? "Data not available",
      bodytype: json['vehicleBodyType']["name"] ?? "Data not available",
      color: json['vehicleColor']["name"] ?? "Data not available",
      seat: json['vehicleSeat']["no_of_seats"] ?? 5,
      ownertype: json['vehicleOwnerType']["type"] ?? "Data not available",
      //
      carImages: List<String>.from(myfunc("path", json["vehicleImages"])),
      featureDetails: List<String>.from(myfunc("name", json['vehicleFeature'])),
      exteriorDetails:
          List<String>.from(myfunc("name", json['vehicleExterior'])),
      comfortDetails:
          List<String>.from(myfunc("name", json['vehicleComfortConvenience'])),
      entertainmentDetails: List<String>.from(
          myfunc("name", json['vehicleEntertainmentCommunications'])),
      interiorDetails:
          List<String>.from(myfunc("name", json['vehicleInterior'])),
      safetyDetails: List<String>.from(myfunc("name", json['vehicleSafety'])),
    );
  }
  static List<String> myfunc(key, list) {
    List<String> result = [];
    list.forEach((e) => result.add(e[key].toString()));
    return result;
  }
}
