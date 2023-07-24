import 'package:flikcar/models/auction_car_model.dart';
import 'package:flikcar/models/buyer_car_model.dart';
import 'package:flikcar/screens/buy_car_flow/car_detailed_view/car_specifications/widgets/specification_text.dart';
import 'package:flikcar/utils/fonts.dart';
import 'package:flutter/material.dart';

class FuelPerformanceSpecification extends StatelessWidget {
  final AuctionCar car;
  FuelPerformanceSpecification({super.key, required this.car});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Fuel & Performance",
          style: AppFonts.w700black16,
        ),
        const SizedBox(
          height: 20,
        ),
        SpecificationText(title: "Max power", subtitle: "${car.maxPower} bhp"),
        SpecificationText(title: "Max torque", subtitle: "${car.maxTorque} Nm"),
        SpecificationText(
            title: "Mileage (ARAI)", subtitle: "${car.mileage} kmpl"),
        // SpecificationText(title: "Max power (bhp @rpm)", subtitle: "666mm"),
        // SpecificationText(title: "Max torque (nm @ rpm)", subtitle: "666mm"),
        //   SpecificationText(title: "Sport mode", subtitle: "${car.sp}"),
        SpecificationText(title: "Drive modes", subtitle: "${car.fuel}"),
      ],
    );
  }
}
