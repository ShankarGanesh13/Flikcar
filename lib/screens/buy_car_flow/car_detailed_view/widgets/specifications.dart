import 'package:flikcar/common_widgets/heading1.dart';
import 'package:flikcar/utils/fonts.dart';
import 'package:flutter/material.dart';

class CarSpecification extends StatelessWidget {
  const CarSpecification({super.key});
  static List<String> specifications = [
    "Mileage",
    "Engine",
    "Max Power",
    "Torque",
    "Seats",
    "Color"
  ];
  static List<String> carSpec = [
    "25.4 kmpl",
    "999 CC",
    "69.4 BHP",
    "72 Nm",
    "5",
    "Blue"
  ];
  @override
  Widget build(BuildContext context) {
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
