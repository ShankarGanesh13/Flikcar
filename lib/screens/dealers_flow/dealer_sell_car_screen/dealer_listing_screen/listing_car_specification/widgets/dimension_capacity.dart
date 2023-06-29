import 'package:flikcar/screens/dealers_flow/dealer_sell_car_screen/dealer_listing_screen/widgets/bool_dropdown_textfield.dart';
import 'package:flikcar/screens/dealers_flow/dealer_sell_car_screen/dealer_listing_screen/widgets/specification_text_field.dart';
import 'package:flikcar/utils/fonts.dart';
import 'package:flutter/material.dart';

class DimensionCapacity extends StatelessWidget {
  const DimensionCapacity({super.key});

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
          const SpecificationTextField(
              maxLength: 5, title: "Ground Clearence (in mm)"),
          const SpecificationTextField(maxLength: 5, title: "Seating capacity"),
          const SpecificationTextField(
              maxLength: 5, title: "Boot space(in litres)"),
          const SpecificationTextField(
              maxLength: 5, title: "Number of seating rows"),
          const SpecificationTextField(
              maxLength: 5, title: "Fuel tank capacity(in litres)"),
          const SpecificationTextField(
              maxLength: 5, title: "Wheelbase (in mm)"),
          const SpecificationTextField(maxLength: 5, title: "Length (in mm)"),
          const SpecificationTextField(maxLength: 5, title: "Front tyres"),
          const SpecificationTextField(maxLength: 5, title: "Rear tyres"),
          const SpecificationTextField(maxLength: 5, title: "Height (in mm)"),
          const SpecificationTextField(maxLength: 5, title: "Width (in mm)"),
          const BoolDropdownTextField(title: "Wheel cover", selectedValue: ""),
          const BoolDropdownTextField(title: "Alloy wheels", selectedValue: ""),
          const BoolDropdownTextField(title: "Spare wheel", selectedValue: ""),
          const SizedBox(
            height: 100,
          ),
        ],
      ),
    );
  }
}
