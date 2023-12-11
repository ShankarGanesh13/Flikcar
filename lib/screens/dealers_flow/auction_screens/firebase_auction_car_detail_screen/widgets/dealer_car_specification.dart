import 'package:flikcar/common_widgets/heading1.dart';
import 'package:flikcar/firebase_models/firebase_car_details.dart';
import 'package:flikcar/models/auction_car_model.dart';
import 'package:flikcar/utils/fonts.dart';
import 'package:flutter/material.dart';

class FirebaseDealerCarSpecification extends StatelessWidget {
  final FirebaseCarDetails car;
  const FirebaseDealerCarSpecification({super.key, required this.car});
  static List<String> specifications = [
    "Mileage",
    "Engine",
    "Max Power",
    "Torque",
    "Seats",
    "Color"
  ];
  static List<String> carSpec = [];

  @override
  Widget build(BuildContext context) {
    carSpec = [
      "${car.properties.mileage}kmpl",
      "${car.properties.engineCC}CC",
      '${car.properties.maxPower}BHP',
      '${car.properties.maxTorque}Nm',
      car.properties.seat,
      car.properties.color
    ];
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        children: [
          const Heading1(title1: "Specifications", title2: ""),
          const SizedBox(height: 15),
          Wrap(
            spacing: 40,
            runSpacing: 20,
            runAlignment: WrapAlignment.spaceEvenly,
            children: List.generate(
                6,
                (index) => SizedBox(
                      width: 85,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            specifications[index],
                            style: AppFonts.w500black14,
                          ),
                          const SizedBox(height: 4),
                          Text(
                            carSpec[index],
                            style: AppFonts.w700black16,
                          )
                        ],
                      ),
                    )),
          )
        ],
      ),
    );
  }
}