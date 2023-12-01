import 'package:flikcar/models/auction_car_model.dart';
import 'package:flikcar/models/buyer_car_model.dart';
import 'package:flikcar/screens/buy_car_flow/car_detailed_view/car_specifications/widgets/specification_text.dart';
import 'package:flikcar/utils/fonts.dart';
import 'package:flutter/material.dart';

class DimensionCapacitySpecification extends StatelessWidget {
  final AuctionCar car;
  DimensionCapacitySpecification({super.key, required this.car});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Dimensions & Capacity",
            style: AppFonts.w700black16,
          ),
          const SizedBox(
            height: 20,
          ),
          SpecificationText(
              title: "Ground Clearance", subtitle: "${car.groundClearance} mm"),
          SpecificationText(
              title: "Seating capacity", subtitle: car.seat.toString()),
          SpecificationText(
              title: "Boot space", subtitle: "${car.bootSpace} ltr"),
          SpecificationText(
              title: "Number of seating rows",
              subtitle: car.noOfSeatsRow.toString()),
          SpecificationText(
              title: "Fuel tank capacity",
              subtitle: "${car.fuelTankCapacity} ltr"),
          SpecificationText(
              title: "Wheelbase", subtitle: "${car.wheelbase} mm"),
          SpecificationText(title: "Length", subtitle: "${car.length} mm"),
          SpecificationText(
              title: "Front tyres", subtitle: "${car.frontTyres}"),
          SpecificationText(title: "Rear tyres", subtitle: "${car.rearTyres}"),
          SpecificationText(
              title: "Wheel cover", subtitle: "${car.wheelCover}"),
          SpecificationText(
              title: "Spare wheel", subtitle: "${car.spareWheel}"),
          SpecificationText(title: "No of doors", subtitle: "${car.noOfDoors}"),
          SpecificationText(title: "Height", subtitle: "${car.height}"),
          SpecificationText(title: "Width", subtitle: "${car.width}"),
          SpecificationText(
              title: "Alloy wheels", subtitle: "${car.alloyWheels}"),
        ],
      ),
    );
  }
}
