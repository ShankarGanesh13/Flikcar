import 'package:flikcar/screens/dealers_flow/dealer_sell_car_screen/dealer_listing_screen/widgets/bool_dropdown_textfield.dart';
import 'package:flikcar/utils/fonts.dart';
import 'package:flutter/material.dart';

class CarInterior extends StatelessWidget {
  const CarInterior({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Interior",
            style: AppFonts.w700black16,
          ),
          const SizedBox(
            height: 20,
          ),
          const BoolDropdownTextField(
              title: "Leather-wrapped steering wheel", selectedValue: ""),
          const BoolDropdownTextField(title: "Tachometer", selectedValue: ""),
          const BoolDropdownTextField(
              title: "Seat upholstery", selectedValue: ""),
          const BoolDropdownTextField(
              title: "Folding rear seat", selectedValue: ""),
          const BoolDropdownTextField(
              title: "Seat adjustment", selectedValue: ""),
          const BoolDropdownTextField(
              title: "Glove compartment", selectedValue: ""),
          const BoolDropdownTextField(
              title: "Air quality control/filter", selectedValue: ""),
          const BoolDropdownTextField(
              title: "Electrically adjustable driver seat", selectedValue: ""),
          const BoolDropdownTextField(
              title: "Leather seats", selectedValue: ""),
          const BoolDropdownTextField(
              title: "Folding table in the rear", selectedValue: ""),
          const BoolDropdownTextField(
              title: "Dual tone dashboard", selectedValue: ""),
          const BoolDropdownTextField(
              title: "Outside temperature display", selectedValue: ""),
          const BoolDropdownTextField(
              title: "Cigarette lighter", selectedValue: ""),
        ],
      ),
    );
  }
}
