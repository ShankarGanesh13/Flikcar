import 'package:flikcar/screens/dealers_flow/dealer_sell_car_screen/dealer_listing_screen/widgets/bool_dropdown_textfield.dart';
import 'package:flikcar/utils/fonts.dart';
import 'package:flutter/material.dart';

class CarComfort extends StatelessWidget {
  const CarComfort({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Comfort",
            style: AppFonts.w700black16,
          ),
          const SizedBox(
            height: 20,
          ),
          const BoolDropdownTextField(
              title: "Anti-glare mirrors-manual", selectedValue: ""),
          const BoolDropdownTextField(
              title: "Power-windows", selectedValue: ""),
          const BoolDropdownTextField(
              title: "Air-conditioner", selectedValue: ""),
          const BoolDropdownTextField(
              title: "Power steering", selectedValue: ""),
          const BoolDropdownTextField(
              title: "12V power outlets", selectedValue: ""),
          const BoolDropdownTextField(
              title: "Seat lumbar support", selectedValue: ""),
          const BoolDropdownTextField(title: "Cup holders", selectedValue: ""),
          const BoolDropdownTextField(title: "Clock", selectedValue: ""),
          const BoolDropdownTextField(
              title: "Voice command/control", selectedValue: ""),
          const BoolDropdownTextField(
              title: "Ventilated seats rear", selectedValue: ""),
          const BoolDropdownTextField(
              title: "Ventilated seats", selectedValue: ""),
          const BoolDropdownTextField(
              title: "Cruise control", selectedValue: ""),
          const BoolDropdownTextField(
              title: "Automatic climate control", selectedValue: ""),
          const BoolDropdownTextField(
              title: "Rear AC vents", selectedValue: ""),
          const BoolDropdownTextField(
              title: "Traction control", selectedValue: ""),
          const BoolDropdownTextField(
              title: "Steering wheel gearshift paddles", selectedValue: ""),
          const BoolDropdownTextField(
              title: "Keyless start", selectedValue: ""),
          const BoolDropdownTextField(
              title: "Glove box cooling", selectedValue: ""),
          const BoolDropdownTextField(title: "Armrest", selectedValue: ""),
          const BoolDropdownTextField(
              title: "Keyless entry", selectedValue: ""),
          const BoolDropdownTextField(
              title: "Vanity mirror on sun visors", selectedValue: ""),
          const BoolDropdownTextField(
              title: "Adjustable  headrests", selectedValue: ""),
          const BoolDropdownTextField(title: "Trunk light", selectedValue: ""),
          const BoolDropdownTextField(
              title: "Gear indicator", selectedValue: ""),
          const BoolDropdownTextField(
              title: "Rear reading lamp", selectedValue: ""),
          const BoolDropdownTextField(
              title: "Remote trunk opener", selectedValue: ""),
          const BoolDropdownTextField(
              title: "Remote fuel lid opener", selectedValue: ""),
          const BoolDropdownTextField(
              title: "Rear window blind", selectedValue: ""),
          const BoolDropdownTextField(
              title: "Luggage hook and net", selectedValue: ""),
        ],
      ),
    );
  }
}
