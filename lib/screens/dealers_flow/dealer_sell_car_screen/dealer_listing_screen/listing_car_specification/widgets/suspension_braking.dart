import 'package:flikcar/screens/dealers_flow/dealer_sell_car_screen/dealer_listing_screen/widgets/specification_text_field.dart';
import 'package:flikcar/utils/fonts.dart';
import 'package:flutter/material.dart';

class SuspensionBrakes extends StatelessWidget {
  const SuspensionBrakes({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Suspension,steering\n& brakes",
          style: AppFonts.w700black16,
        ),
        const SizedBox(height: 20),
        const SpecificationTextField(maxLength: 20, title: "Suspension front"),
        const SpecificationTextField(maxLength: 20, title: "Suspension rear"),
        const SpecificationTextField(maxLength: 20, title: "Front brake type"),
        const SpecificationTextField(maxLength: 20, title: "Rear brake type"),
        const SpecificationTextField(maxLength: 20, title: "Steering type"),
      ],
    );
  }
}
