import 'package:flikcar/models/buyer_car_model.dart';
import 'package:flutter/material.dart';

import 'overview_details.dart';

class OverviewList extends StatelessWidget {
  final BuyerCar car1;
  final BuyerCar car2;
  const OverviewList({super.key, required this.car1, required this.car2});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: [
            OverviewDetails(
                title: "PRICE",
                value1: "₹${car1.carPrice}",
                value2: "₹${car2.carPrice}"),
            OverviewDetails(
                title: "KILOMETERS DRIVEN",
                value1: "${car1.driveKms} km",
                value2: "${car2.driveKms} km"),
            const OverviewDetails(
                title: "REGISTRATION RTO", value1: "WB10", value2: "WB12"),
            OverviewDetails(
                title: "REGISTRATION YEAR",
                value1: car1.registrationYear,
                value2: car2.registrationYear),
            OverviewDetails(
                title: "FUEL TYPE", value1: car1.fuel, value2: car2.fuel),
            OverviewDetails(
                title: "OWNER", value1: car1.ownertype, value2: car2.ownertype),
            OverviewDetails(
                title: "TRANSMISSON TYPE",
                value1: car1.transmission,
                value2: car2.transmission),
            const OverviewDetails(
                title: "INSURANCE (VALID UPTO)",
                value1: "24-Aug-2025",
                value2: "24-Aug-2025"),
            const SizedBox(height: 50)
          ],
        ),
      ),
    );
  }
}
