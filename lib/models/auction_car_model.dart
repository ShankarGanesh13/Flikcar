import 'package:flikcar/models/bid_model.dart';
import 'package:http/http.dart';

import 'image_model.dart';

class AuctionCar {
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
  String currentBidPrice;
  String startAuction;
  String endAuction;
  String purchasedBy;
  String purchasedAt;
  String purchasedPrice;
  // BidModel? lastBid;
  // List<BidModel>? recentBid;
  String? yourLastBid;
  String technicianRating;
  String technicianRemarks;
  String noc;
  String rto;
  String roadtaxValidity;
  String insuranceValidity;

  //  print(element["noc"]);
  //       print(element["roadtax_valid_till"]);
  //       print(element["insurance_valid_till"]);

  //  "current_bid_price": 1300000,
  //           "start_auction": "2023-07-19T05:27:39.000Z",
  //           "end_auction": "2023-07-19T15:27:47.000Z",
  //           "purchased_price": null,
  //           "purchased_by": null,
  //           "purchased_at": null,

  AuctionCar({
    required this.id,
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
    this.dealerName,
    this.dealerPhoneNumber,
    this.dealerAddress,
    required this.currentBidPrice,
    required this.endAuction,
    required this.purchasedAt,
    required this.purchasedBy,
    required this.purchasedPrice,
    required this.startAuction,
    required this.technicianRating,
    required this.technicianRemarks,
    required this.insuranceValidity,
    required this.noc,
    required this.roadtaxValidity,
    required this.rto,
    this.yourLastBid,
    //  this.recentBid,
    //  this.lastBid,
  });
  @override
  bool operator ==(other) {
    return other is AuctionCar && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;

  factory AuctionCar.fromJson(Map<String, dynamic> json) {
    return AuctionCar(
      id: json['id'],
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
      status: json['status']?.toString() ?? "N/A",
      saleStatus: json['sale_status']?.toString() ?? "N/A",
      updatedAt: json["updatedAt"]?.toString() ?? "N/A",
      brand: json['vehicleBrand']?["name"]?.toString() ?? "N/A",
      model: json['vehicleModel']?["name"]?.toString() ?? "N/A",
      variant: json['vehicleVariantType']?["name"]?.toString() ?? "N/A",
      fuel: json['vehicleFuelType']?["name"]?.toString() ?? "N/A",
      bodytype: json['vehicleBodyType']?["name"]?.toString() ?? "N/A",
      color: json['vehicleColor']?["name"]?.toString() ?? "N/A",
      seat: json['vehicleSeat']?["no_of_seats"]?.toString() ?? "N/A",
      ownertype: json['vehicleOwnerType']?["type"]?.toString() ?? "N/A",
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
      /////////
      currentBidPrice: json["current_bid_price"] != null
          ? json["current_bid_price"].toString()
          : json["car_price"].toString(),
      endAuction:
          json["end_auction"] != null ? json["end_auction"].toString() : "N/A",
      purchasedAt: json["purchased_at"] != null
          ? json["purchased_at"].toString()
          : "N/A",
      purchasedBy: json["purchased_by"] != null
          ? json["purchased_by"].toString()
          : "N/A",
      purchasedPrice: json["purchased_price"] != null
          ? json["purchased_price"].toString()
          : "N/A",
      startAuction: json["start_auction"] != null
          ? json["start_auction"].toString()
          : "N/A",
      technicianRemarks: json["technician_remarks"] ?? "",
      technicianRating: json["technician_rating"]?.toString() ?? "N/A",
      //recentBid: getBids(json["bid"]),
      // lastBid:
      //     json["bid"].isNotEmpty ? BidModel.fromJson(json["bid"][0]) : null,
      yourLastBid: json["yourLastBid"]?.toString() ?? "N/A",
      noc: json["noc"]?.toString() ?? "N/A",
      roadtaxValidity: json["roadtax_valid_till"]?.toString() ?? "N/A",
      insuranceValidity: json["insurance_valid_till"]?.toString() ?? "N/A",
      rto: json["vehicleRTO"] != null ? json["vehicleRTO"]["location"] : "N/A",
    );

    //  print(element["noc"]);
    //       print(element["roadtax_valid_till"]);
    //       print(element["insurance_valid_till"]);
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

  static List<BidModel> getBids(List list) {
    List<BidModel> result = [];

    if (list.isNotEmpty) {
      list.forEach((e) {
        result.add(BidModel.fromJson(e));
      });
    }
    return result;
  }

  factory AuctionCar.fromJson2(Map<String, dynamic> json) {
    return AuctionCar(
      id: json["vehicle"]['id'],
      carName: json["vehicle"]['car_name']?.toString() ?? "N/A",
      carDescription: json["vehicle"]['car_description']?.toString() ?? "N/A",
      mileage: json["vehicle"]['mileage']?.toString() ?? "N/A",
      torque: json["vehicle"]['torque']?.toString() ?? "N/A",
      engine: json["vehicle"]['engine']?.toString() ?? "N/A",
      maxPower: json["vehicle"]['max_power']?.toString() ?? "N/A",
      driveKms: json["vehicle"]['drive_kms']?.toString() ?? "N/A",
      registrationYear:
          json["vehicle"]['registration_year']?.toString() ?? "N/A",
      transmission: json["vehicle"]['transmission']?.toString() ?? "N/A",
      groundClearance: json["vehicle"]['ground_clearance']?.toString() ?? "N/A",
      bootSpace: json["vehicle"]['boot_space']?.toString() ?? "N/A",
      noOfSeatsRow: json["vehicle"]['no_of_seats_row']?.toString() ?? "N/A",
      fuelTankCapacity:
          json["vehicle"]['fuel_tank_capacity']?.toString() ?? "N/A",
      wheelbase: json["vehicle"]['wheelbase']?.toString() ?? "N/A",
      length: json["vehicle"]['length']?.toString() ?? "N/A",
      alloyWheels: json["vehicle"]['alloy_wheels']?.toString() ?? "N/A",
      frontTyres: json["vehicle"]['front_tyres']?.toString() ?? "N/A",
      rearTyres: json["vehicle"]['rear_tyres']?.toString() ?? "N/A",
      spareWheel: json["vehicle"]['spare_wheel']?.toString() ?? "N/A",
      noOfDoors: json["vehicle"]['no_of_doors']?.toString() ?? "N/A",
      height: json["vehicle"]['height']?.toString() ?? "N/A",
      width: json["vehicle"]['width']?.toString() ?? "N/A",
      wheelCover: json["vehicle"]['wheel_cover']?.toString() ?? "N/A",
      drivetrain: json["vehicle"]['drivetrain']?.toString() ?? "N/A",
      gearBox: json["vehicle"]['gear_box']?.toString() ?? "N/A",
      displacement: json["vehicle"]['displacement']?.toString() ?? "N/A",
      noOfCylinders: json["vehicle"]['no_of_cylinders']?.toString() ?? "N/A",
      valveCylinders: json["vehicle"]['valve_cylinders']?.toString() ?? "N/A",
      turbocharger: json["vehicle"]['turbocharger']?.toString() ?? "N/A",
      limitedSlipDiffe:
          json["vehicle"]['limited_slip_diffe']?.toString() ?? "N/A",
      maxTorque: json["vehicle"]['max_torque']?.toString() ?? "N/A",
      suspensionFront: json["vehicle"]['suspension_front']?.toString() ?? "N/A",
      suspensionRear: json["vehicle"]['suspension_rear']?.toString() ?? "N/A",
      frontBrakeType: json["vehicle"]['front_brake_type']?.toString() ?? "N/A",
      rearBrakeType: json["vehicle"]['rear_brake_type']?.toString() ?? "N/A",
      steeringType: json["vehicle"]['steering_type']?.toString() ?? "N/A",
      minTurningRadius:
          json["vehicle"]['min_turning_radius']?.toString() ?? "N/A",
      carPrice: json["vehicle"]['car_price']?.toString() ?? "N/A",
      salePrice: json["vehicle"]['sale_price']?.toString() ?? "N/A",
      soldTo: json["vehicle"]['sold_to']?.toString() ?? "N/A",
      saleAt: json["vehicle"]['sale_at']?.toString() ?? "N/A",
      status: json["vehicle"]['status'] ?? "N/A",
      saleStatus: json["vehicle"]['sale_status'] ?? "N/A",
      updatedAt: json["vehicle"]["updatedAt"] ?? "N/A",
      brand: json["vehicle"]['vehicleBrand']["name"] ?? "N/A",
      model: json["vehicle"]['vehicleModel']["name"] ?? "N/A",
      variant: json["vehicle"]['vehicleVariantType']["name"] ?? "N/A",
      fuel: json["vehicle"]['vehicleFuelType']["name"] ?? "N/A",
      bodytype: json["vehicle"]['vehicleBodyType']["name"] ?? "N/A",
      color: json["vehicle"]['vehicleColor']["name"] ?? "N/A",
      seat: json["vehicle"]['vehicleSeat']["no_of_seats"]?.toString() ?? "N/A",
      ownertype: json["vehicle"]['vehicleOwnerType']["type"] ?? "N/A",
      //
      carImages:
          List<ImageModel>.from(getImages(json["vehicle"]["vehicleImages"])),

      //
      featureDetails: json["vehicle"]['vehicleFeature'] != null
          ? List<String>.from(myfunc("name", json["vehicle"]['vehicleFeature']))
          : [],
      exteriorDetails: json["vehicle"]['vehicleExterior'] != null
          ? List<String>.from(
              myfunc("name", json["vehicle"]['vehicleExterior']))
          : [],
      comfortDetails: json["vehicle"]['vehicleComfortConvenience'] != null
          ? List<String>.from(
              myfunc("name", json["vehicle"]['vehicleComfortConvenience']))
          : [],
      entertainmentDetails: json["vehicle"]
                  ['vehicleEntertainmentCommunications'] !=
              null
          ? List<String>.from(myfunc(
              "name", json["vehicle"]['vehicleEntertainmentCommunications']))
          : [],
      interiorDetails: json["vehicle"]['vehicleInterior'] != null
          ? List<String>.from(
              myfunc("name", json["vehicle"]['vehicleInterior']))
          : [],
      safetyDetails: json["vehicle"]['vehicleSafety'] != null
          ? List<String>.from(myfunc("name", json["vehicle"]['vehicleSafety']))
          : [],
      dealerId: json["vehicle"]["dealer_id"].toString(),
      dealerName: json["vehicle"]["dealer"] != null
          ? json["vehicle"]["dealer"]["name"]
          : "",
      dealerPhoneNumber: json["vehicle"]["dealer"] != null
          ? json["vehicle"]["dealer"]["phone"].toString()
          : "",
      dealerAddress: json["vehicle"]["dealer"] != null
          ? json["vehicle"]["address_one"]
          : "",
      /////////
      currentBidPrice: json["vehicle"]["current_bid_price"] != null
          ? json["vehicle"]["current_bid_price"].toString()
          : "no data",
      endAuction: json["vehicle"]["end_auction"] != null
          ? json["vehicle"]["end_auction"].toString()
          : "no data",
      purchasedAt: json["vehicle"]["purchased_at"] != null
          ? json["vehicle"]["purchased_at"].toString()
          : "no data",
      purchasedBy: json["vehicle"]["purchased_by"] != null
          ? json["vehicle"]["purchased_by"].toString()
          : "no data",
      purchasedPrice: json["vehicle"]["purchased_price"] != null
          ? json["vehicle"]["purchased_price"].toString()
          : "no data",
      startAuction: json["vehicle"]["start_auction"] != null
          ? json["vehicle"]["start_auction"].toString()
          : "no data",
      // lastBid: json["bid"] != null ? BidModel.fromJson(json["bid"][0]) : null,
      technicianRemarks: json["vehicle"]["technician_remarks"] ?? "",
      // recentBid: getBids(json["bid"] as List),
      technicianRating: json["vehicle"]["technician_rating"].toString(),
      noc: json["vehicle"]["noc"]?.toString() ?? "N/A",
      roadtaxValidity:
          json["vehicle"]["roadtax_valid_till"]?.toString() ?? "N/A",
      insuranceValidity:
          json["vehicle"]["insurance_valid_till"]?.toString() ?? "N/A",
      rto: json["vehicle"]["vehicleRTO"] != null
          ? json["vehicle"]["vehicleRTO"]["location"]
          : "N/A",
    );
  }

  static List<ImageModel> getImages(List list) {
    List<ImageModel> result = [];

    if (list.isNotEmpty) {
      list.forEach((e) => result.add(ImageModel.fromJson(e)));
    }
    return result;
  }
}
