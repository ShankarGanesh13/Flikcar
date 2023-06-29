import 'package:flikcar/screens/dealers_flow/dealer_sell_car_screen/dealer_listing_screen/widgets/bool_dropdown_textfield.dart';
import 'package:flikcar/utils/fonts.dart';
import 'package:flutter/material.dart';

class CarEntertainment extends StatelessWidget {
  const CarEntertainment({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Entertainment &\nCommunication",
            style: AppFonts.w700black16,
          ),
          const SizedBox(height: 20),
          const BoolDropdownTextField(
              title: "Touch screen infotainment system", selectedValue: ""),
          const BoolDropdownTextField(
              title: "GPS navigation system", selectedValue: ""),
          const BoolDropdownTextField(
              title: "Integrated 2 din audio", selectedValue: ""),
          const BoolDropdownTextField(
              title: "Bluetooth compatibility / connectivity",
              selectedValue: ""),
          const BoolDropdownTextField(title: "Speakers", selectedValue: ""),
          const BoolDropdownTextField(title: "Am/fm radio", selectedValue: ""),
          const BoolDropdownTextField(
              title: "Integrated (in-dash) music system", selectedValue: ""),
          const BoolDropdownTextField(
              title: "Display screen for rear passengers", selectedValue: ""),
          const BoolDropdownTextField(
              title: "Heads up display (HUD)", selectedValue: ""),
          const BoolDropdownTextField(
              title: "Auto cd changer", selectedValue: ""),
          const BoolDropdownTextField(
              title: "Audio system remote control", selectedValue: ""),
          const BoolDropdownTextField(title: "CD player", selectedValue: ""),
          const BoolDropdownTextField(
              title: "Internal storage/hard drive", selectedValue: ""),
        ],
      ),
    );
  }
}
