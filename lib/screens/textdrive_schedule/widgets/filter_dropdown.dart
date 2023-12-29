import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flikcar/screens/buy_car_flow/provider/test_drive_service.dart';
import 'package:flikcar/utils/fonts.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FilterDropDown extends StatefulWidget {
  const FilterDropDown({super.key});

  @override
  State<FilterDropDown> createState() => _FilterDropDownState();
}

class _FilterDropDownState extends State<FilterDropDown> {
  final List<String> items = [
    'All',
    'Upcoming',
    'Completed',
  ];
  String? selectedValue;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, top: 15),
      child: DropdownButtonHideUnderline(
        child: DropdownButton2<String>(
          isExpanded: true,
          hint: Text('All ', style: AppFonts.w700black14),
          items: items
              .map((String item) => DropdownMenuItem<String>(
                    value: item,
                    child: Text(item, style: AppFonts.w700black14),
                  ))
              .toList(),
          value: selectedValue,
          onChanged: (String? value) {
            setState(() {
              selectedValue = value;
            });
            Provider.of<TestDriveService>(context, listen: false)
                .filterTestDrive(filter: selectedValue!);
          },
          buttonStyleData: const ButtonStyleData(
            padding: EdgeInsets.symmetric(horizontal: 0),
            height: 40,
            width: 120,
          ),
          menuItemStyleData: const MenuItemStyleData(
            height: 40,
          ),
        ),
      ),
    );
  }
}
