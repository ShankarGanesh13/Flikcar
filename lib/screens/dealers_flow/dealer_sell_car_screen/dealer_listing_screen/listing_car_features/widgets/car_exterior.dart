import 'package:flikcar/screens/dealers_flow/dealer_sell_car_screen/dealer_listing_screen/widgets/bool_dropdown_textfield.dart';
import 'package:flikcar/utils/fonts.dart';
import 'package:flutter/material.dart';

class CarExterior extends StatelessWidget {
  const CarExterior({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Exterior",
            style: AppFonts.w700black16,
          ),
          const SizedBox(
            height: 20,
          ),
          const BoolDropdownTextField(
              title: "Headlamps-conventional", selectedValue: ""),
          const BoolDropdownTextField(
              title: "Outside rear view mirrors(ORVMs)", selectedValue: ""),
          const BoolDropdownTextField(
              title: "Rear power window", selectedValue: ""),
          const BoolDropdownTextField(
              title: "Body coloured bumpers", selectedValue: ""),
          const BoolDropdownTextField(
              title: "Tail lamps- Conventional", selectedValue: ""),
          const BoolDropdownTextField(title: "Rear spoiler", selectedValue: ""),
          const BoolDropdownTextField(title: "Sunroof", selectedValue: ""),
          const BoolDropdownTextField(title: "Tinted glass", selectedValue: ""),
          const BoolDropdownTextField(
              title: "Rain sensing wipers", selectedValue: ""),
          const BoolDropdownTextField(title: "Rear wiper", selectedValue: ""),
          const BoolDropdownTextField(
              title: "Rear defogger", selectedValue: ""),
          const BoolDropdownTextField(title: "Fog lamps", selectedValue: ""),
          const BoolDropdownTextField(title: "Roof rails", selectedValue: ""),
          const BoolDropdownTextField(title: "Roof carrier", selectedValue: ""),
          const BoolDropdownTextField(title: "Side stepper", selectedValue: ""),
          const BoolDropdownTextField(
              title: "Xenon headlamps/hid-headlamps", selectedValue: ""),
          const BoolDropdownTextField(
              title: "Chrome grille", selectedValue: ""),
        ],
      ),
    );
  }
}
