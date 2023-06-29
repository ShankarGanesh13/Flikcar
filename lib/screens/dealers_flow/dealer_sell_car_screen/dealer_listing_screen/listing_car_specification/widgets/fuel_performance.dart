import 'package:flikcar/screens/dealers_flow/dealer_sell_car_screen/dealer_listing_screen/widgets/specification_text_field.dart';
import 'package:flikcar/utils/fonts.dart';
import 'package:flutter/material.dart';

class FuelPerformance extends StatelessWidget {
  const FuelPerformance({super.key});

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
        const SpecificationTextField(maxLength: 5, title: "Max power (in bhp)"),
        const SpecificationTextField(maxLength: 5, title: "Max torque (in nm)"),
        const SpecificationTextField(
            maxLength: 5, title: "Mileage (ARAI) in kmpl"),
        const SpecificationTextField(
            maxLength: 5, title: "Max power (bhp @ rpm)"),
        const SpecificationTextField(
            maxLength: 5, title: "Max power (nm @ rpm)")
      ],
    );
  }
}
