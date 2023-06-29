import 'package:flikcar/screens/dealers_flow/dealer_sell_car_screen/dealer_listing_screen/widgets/bool_dropdown_textfield.dart';
import 'package:flikcar/screens/dealers_flow/dealer_sell_car_screen/dealer_listing_screen/widgets/specification_text_field.dart';
import 'package:flikcar/utils/fonts.dart';
import 'package:flutter/material.dart';

class EngineTransmisson extends StatelessWidget {
  const EngineTransmisson({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Engine & Transmisson",
            style: AppFonts.w700black16,
          ),
          const SizedBox(
            height: 20,
          ),
          const SpecificationTextField(maxLength: 30, title: "Drivetrain"),
          const SpecificationTextField(maxLength: 30, title: "Gear box"),
          const SpecificationTextField(
              maxLength: 4, title: "Displacement (in cc)"),
          const SpecificationTextField(
              maxLength: 2, title: "Number of cylinders"),
          const SpecificationTextField(
              maxLength: 30, title: "Valve/cylinder (configuration)"),
          const SpecificationTextField(
              maxLength: 20, title: "Limited slip differential (LSD)"),
          const SpecificationTextField(maxLength: 30, title: "Mild hybrid"),
          const BoolDropdownTextField(title: "Turbocharger", selectedValue: ""),
          const SizedBox(
            height: 60,
          )
        ],
      ),
    );
  }
}
