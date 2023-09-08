import 'package:flikcar/models/image_model.dart';
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
  String minTurningRadius;
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
  List<ImageModel> carImages;
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
      required this.isFavourite,
      this.dealerPhoneNumber,
      this.dealerAddress});

  factory BuyerCar.fromJson(Map<String, dynamic> json) {
    return BuyerCar(
      id: json['id'] ?? "N/A",
      carName: json['car_name']?.toString() ?? "N/A",
      carDescription: json['car_description']?.toString() ?? "N/A",
      mileage: json['mileage']?.toString() ?? "N/A",
      torque: json['torque']?.toString() ?? "N/A",
      engine: json['engine']?.toString() ?? "N/A",
      maxPower: json['max_power']?.toString() ?? "N/A",
      driveKms: json['drive_kms']?.toString() ?? "N/A",
      registrationYear: json['registration_year']?.toString() ?? "N/A",
      transmission: json['transmission']?.toString() ?? "N/A",
      groundClearance: json['ground_clearance']?.toString() ?? "N/A",
      bootSpace: json['boot_space']?.toString() ?? "N/A",
      noOfSeatsRow: json['no_of_seats_row']?.toString() ?? "N/A",
      fuelTankCapacity: json['fuel_tank_capacity']?.toString() ?? "N/A",
      wheelbase: json['wheelbase']?.toString() ?? "N/A",
      length: json['length']?.toString() ?? "N/A",
      alloyWheels: json['alloy_wheels']?.toString() ?? "N/A",
      frontTyres: json['front_tyres']?.toString() ?? "N/A",
      rearTyres: json['rear_tyres']?.toString() ?? "N/A",
      spareWheel: json['spare_wheel']?.toString() ?? "N/A",
      noOfDoors: json['no_of_doors']?.toString() ?? "N/A",
      height: json['height']?.toString() ?? "N/A",
      width: json['width']?.toString() ?? "N/A",
      wheelCover: json['wheel_cover']?.toString() ?? "N/A",
      drivetrain: json['drivetrain']?.toString() ?? "N/A",
      gearBox: json['gear_box']?.toString() ?? "N/A",
      displacement: json['displacement']?.toString() ?? "N/A",
      noOfCylinders: json['no_of_cylinders']?.toString() ?? "N/A",
      valveCylinders: json['valve_cylinders']?.toString() ?? "N/A",
      turbocharger: json['turbocharger']?.toString() ?? "N/A",
      limitedSlipDiffe: json['limited_slip_diffe']?.toString() ?? "N/A",
      maxTorque: json['max_torque']?.toString() ?? "N/A",
      suspensionFront: json['suspension_front']?.toString() ?? "N/A",
      suspensionRear: json['suspension_rear']?.toString() ?? "N/A",
      frontBrakeType: json['front_brake_type']?.toString() ?? "N/A",
      rearBrakeType: json['rear_brake_type']?.toString() ?? "N/A",
      steeringType: json['steering_type']?.toString() ?? "N/A",
      minTurningRadius: json['min_turning_radius']?.toString() ?? "N/A",
      carPrice: json['car_price']?.toString() ?? "N/A",
      salePrice: json['sale_price']?.toString() ?? "N/A",
      soldTo: json['sold_to']?.toString() ?? "N/A",
      saleAt: json['sale_at']?.toString() ?? "N/A",
      //status= Active/Inactive
      status: json['status']?.toString() ?? "N/A",
      //sale status=Available/Sold Out
      saleStatus: json['sale_status']?.toString() ?? "N/A",
      updatedAt: json["updatedAt"]?.toString() ?? "N/A",
      isFavourite: json["favourite_car"] == null ? false : true,

      ///
      brand: json['vehicleBrand']?["name"]?.toString() ?? "N/A",
      model: json['vehicleModel']?["name"]?.toString() ?? "N/A",
      variant: json['vehicleVariantType']?["name"]?.toString() ?? "N/A",
      fuel: json['vehicleFuelType']?["name"]?.toString() ?? "N/A",
      bodytype: json['vehicleBodyType']?["name"]?.toString() ?? "N/A",
      color: json['vehicleColor']?["name"]?.toString() ?? "N/A",
      seat: json['vehicleSeat']?["no_of_seats"]?.toString() ?? "N/A",
      ownertype: json['vehicleOwnerType']?["type"]?.toString() ?? "N/A",
      //
      carImages: List<ImageModel>.from(getImages(json["vehicleImages"])),
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
      technicianRating: json["technician_rating"]?.toString() ?? "N/A",
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

  static List<ImageModel> getImages(List list) {
    List<ImageModel> result = [];

    if (list.isNotEmpty) {
      list.forEach((e) => result.add(ImageModel.fromJson(e)));
    }
    return result;
  }
}
