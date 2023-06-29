import 'package:flikcar/screens/dealers_flow/dealer_sell_car_screen/dealer_listing_screen/widgets/bool_dropdown_textfield.dart';
import 'package:flikcar/utils/fonts.dart';
import 'package:flutter/material.dart';

class CarSafety extends StatelessWidget {
  const CarSafety({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Safety",
            style: AppFonts.w700black16,
          ),
          const SizedBox(
            height: 20,
          ),
          const BoolDropdownTextField(title: "Airbags", selectedValue: ""),
          const BoolDropdownTextField(title: "Rear camera", selectedValue: ""),
          const BoolDropdownTextField(
              title: "Anti-lock braking system (ABS)", selectedValue: ""),
          const BoolDropdownTextField(
              title: "Central locking", selectedValue: ""),
          const BoolDropdownTextField(
              title: "Rear seat belts", selectedValue: ""),
          const BoolDropdownTextField(
              title: "Seat belt warning", selectedValue: ""),
          const BoolDropdownTextField(
              title: "Electronic brake force distribution (EBD)",
              selectedValue: ""),
          const BoolDropdownTextField(
              title: "Child safety lock", selectedValue: ""),
          const BoolDropdownTextField(
              title: "Low fuel level warning", selectedValue: ""),
          const BoolDropdownTextField(
              title: "Engine check warning", selectedValue: ""),
          const BoolDropdownTextField(
              title: "Electronic stability program(ESP)", selectedValue: ""),
          const BoolDropdownTextField(title: "Knee airbags", selectedValue: ""),
          const BoolDropdownTextField(
              title: "Brake assist(BA)", selectedValue: ""),
          const BoolDropdownTextField(
              title: "360 view camera", selectedValue: ""),
          const BoolDropdownTextField(
              title: "Blind spot monitor", selectedValue: ""),
          const BoolDropdownTextField(
              title: "Automatic head lamps", selectedValue: ""),
          const BoolDropdownTextField(
              title: "Follow me home headlamps", selectedValue: ""),
          const BoolDropdownTextField(
              title: "Tyre pressure monitoring system(TPMS) ",
              selectedValue: ""),
          const BoolDropdownTextField(
              title: "Hill hold control", selectedValue: ""),
          const BoolDropdownTextField(
              title: "Hill descent control", selectedValue: ""),
          const BoolDropdownTextField(
              title: "Child seat anchor points", selectedValue: ""),
          const BoolDropdownTextField(
              title: "Engine immobilizer", selectedValue: ""),
          const BoolDropdownTextField(
              title: "Anti theft alarm", selectedValue: ""),
          const BoolDropdownTextField(
              title: "Headlight height adjuster", selectedValue: ""),
          const BoolDropdownTextField(
              title: "Speed sensing door lock", selectedValue: ""),
          const BoolDropdownTextField(
              title: "Door ajar warning", selectedValue: ""),
          const BoolDropdownTextField(
              title: "Middle rear three-point seatbelt", selectedValue: ""),
          const BoolDropdownTextField(
              title: "Middle rear headrest", selectedValue: ""),
          const BoolDropdownTextField(
              title: "Impact sensing auto door unlock", selectedValue: ""),
        ],
      ),
    );
  }
}
