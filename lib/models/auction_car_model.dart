import 'package:flikcar/models/bid_model.dart';

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
  String currentBidPrice;
  String startAuction;
  String endAuction;
  String purchasedBy;
  String purchasedAt;
  String purchasedPrice;
  BidModel? lastBid;
  String? yourLastBid;
  //  "current_bid_price": 1300000,
  //           "start_auction": "2023-07-19T05:27:39.000Z",
  //           "end_auction": "2023-07-19T15:27:47.000Z",
  //           "purchased_price": null,
  //           "purchased_by": null,
  //           "purchased_at": null,

  AuctionCar(
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
      this.dealerName,
      this.dealerPhoneNumber,
      this.dealerAddress,
      required this.currentBidPrice,
      required this.endAuction,
      required this.purchasedAt,
      required this.purchasedBy,
      required this.purchasedPrice,
      required this.startAuction,
      this.yourLastBid,
      this.lastBid});
  @override
  bool operator ==(other) {
    return other is AuctionCar && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;

  factory AuctionCar.fromJson(Map<String, dynamic> json) {
    return AuctionCar(
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
            ? List<String>.from(
                myfunc("name", json['vehicleComfortConvenience']))
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
        endAuction: json["end_auction"] != null
            ? json["end_auction"].toString()
            : "no data",
        purchasedAt: json["purchased_at"] != null
            ? json["purchased_at"].toString()
            : "no data",
        purchasedBy: json["purchased_by"] != null
            ? json["purchased_by"].toString()
            : "no data",
        purchasedPrice: json["purchased_price"] != null
            ? json["purchased_price"].toString()
            : "no data",
        startAuction: json["start_auction"] != null
            ? json["start_auction"].toString()
            : "no data",
        lastBid:
            json["bid"].isNotEmpty ? BidModel.fromJson(json["bid"][0]) : null,
        yourLastBid: json["yourLastBid"].toString() ?? "No Data");
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

  factory AuctionCar.fromJson2(Map<String, dynamic> json) {
    return AuctionCar(
      id: json["vehicle"]['id'] ?? "No data",
      carName: json["vehicle"]['car_name'] ?? "No data",
      carDescription: json["vehicle"]['car_description'] ?? "No data",
      mileage: json["vehicle"]['mileage'].toString() ?? "No data",
      torque: json["vehicle"]['torque'].toString() ?? "No data",
      engine: json["vehicle"]['engine'].toString() ?? "No data",
      maxPower: json["vehicle"]['max_power'].toString() ?? "No data",
      driveKms: json["vehicle"]['drive_kms'].toString() ?? "No data",
      registrationYear:
          json["vehicle"]['registration_year'].toString() ?? "No data",
      transmission: json["vehicle"]['transmission'] ?? "No data",
      groundClearance:
          json["vehicle"]['ground_clearance'].toString() ?? "No data",
      bootSpace: json["vehicle"]['boot_space'].toString() ?? "No data",
      noOfSeatsRow: json["vehicle"]['no_of_seats_row'].toString() ?? "No data",
      fuelTankCapacity:
          json["vehicle"]['fuel_tank_capacity'].toString() ?? "No data",
      wheelbase: json["vehicle"]['wheelbase'].toString() ?? "No data",
      length: json["vehicle"]['length'].toString() ?? "No data",
      alloyWheels: json["vehicle"]['alloy_wheels'] ?? "No data",
      frontTyres: json["vehicle"]['front_tyres'] ?? "No data",
      rearTyres: json["vehicle"]['rear_tyres'] ?? "No data",
      spareWheel: json["vehicle"]['spare_wheel'] ?? "No data",
      noOfDoors: json["vehicle"]['no_of_doors'].toString() ?? "No data",
      height: json["vehicle"]['height'].toString() ?? "No data",
      width: json["vehicle"]['width'].toString() ?? "No data",
      wheelCover: json["vehicle"]['wheel_cover'] ?? "No data",
      drivetrain: json["vehicle"]['drivetrain'] ?? "No data",
      gearBox: json["vehicle"]['gear_box'].toString() ?? "No data",
      displacement: json["vehicle"]['displacement'].toString() ?? "No data",
      noOfCylinders: json["vehicle"]['no_of_cylinders'].toString() ?? "No data",
      valveCylinders:
          json["vehicle"]['valve_cylinders'].toString() ?? "No data",
      turbocharger: json["vehicle"]['turbocharger'] ?? "No data",
      limitedSlipDiffe: json["vehicle"]['limited_slip_diffe'] ?? "No data",
      maxTorque: json["vehicle"]['max_torque'].toString() ?? "No data",
      suspensionFront: json["vehicle"]['suspension_front'] ?? "No data",
      suspensionRear: json["vehicle"]['suspension_rear'] ?? "No data",
      frontBrakeType: json["vehicle"]['front_brake_type'] ?? "No data",
      rearBrakeType: json["vehicle"]['rear_brake_type'] ?? "No data",
      steeringType: json["vehicle"]['steering_type'] ?? "No data",
      mStringurningRadius:
          json["vehicle"]['min_turning_radius'].toString() ?? "No data",
      carPrice: json["vehicle"]['car_price'].toString() ?? "No data",
      salePrice: json["vehicle"]['sale_price'].toString() ?? "Na data",
      soldTo: json["vehicle"]['sold_to'].toString() ?? "No data",
      saleAt: json["vehicle"]['sale_at'].toString() ?? "No data",
      //status= Active/Inactive
      status: json["vehicle"]['status'] ?? "No data",
      //sale status=Available/Sold Out
      saleStatus: json["vehicle"]['sale_status'] ?? "No data",
      updatedAt: json["vehicle"]["updatedAt"] ?? "No data",

      ///
      brand: json["vehicle"]['vehicleBrand']["name"] ?? "No data",
      model: json["vehicle"]['vehicleModel']["name"] ?? "No data",
      variant: json["vehicle"]['vehicleVariantType']["name"] ?? "No data",
      fuel: json["vehicle"]['vehicleFuelType']["name"] ?? "No data",
      bodytype: json["vehicle"]['vehicleBodyType']["name"] ?? "No data",
      color: json["vehicle"]['vehicleColor']["name"] ?? "No data",
      seat:
          json["vehicle"]['vehicleSeat']["no_of_seats"].toString() ?? "No data",
      ownertype: json["vehicle"]['vehicleOwnerType']["type"] ?? "No data",
      //
      carImages:
          List<String>.from(myfunc("path", json["vehicle"]["vehicleImages"])),
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
      lastBid: json["bid"] != null ? BidModel.fromJson(json["bid"][0]) : null,
    );
  }
}
