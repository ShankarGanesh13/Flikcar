import 'package:flikcar/common_widgets/heading1.dart';
import 'package:flikcar/utils/fonts.dart';
import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class CustomDropDown extends StatelessWidget {
  final String title;
  final List<String> dropdownItems;
  final ValueChanged onChanged;
  final bool? validate;
  const CustomDropDown(
      {super.key,
      required this.title,
      this.validate,
      required this.onChanged,
      required this.dropdownItems});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Heading1(title1: "When you want to", title2: "sell your car"),
        const SizedBox(
          height: 8,
        ),
        DropdownButtonFormField2<String>(
          isExpanded: true,
          decoration: const InputDecoration.collapsed(
            hintText: "Select a value",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(8.0),
              ),
              borderSide: BorderSide(color: Colors.black),
            ),
          ),
          hint: Text(
            "Select a value",
            style: AppFonts.w500dark212,
          ),
          items: dropdownItems
              .map((item) => DropdownMenuItem<String>(
                    value: item,
                    child: Text(item, style: AppFonts.w500black14),
                  ))
              .toList(),
          validator: (value) {
            if (validate != null && validate == true) {
              if (value == null) {
                return "select a value";
              }
            }
            return null;
          },
          onChanged: (value) {
            onChanged(value);
          },
          buttonStyleData: const ButtonStyleData(
            padding: EdgeInsets.only(left: 0, right: 5, top: 6, bottom: 6),
            height: 45,
          ),
          iconStyleData: const IconStyleData(
            icon: Icon(
              Icons.arrow_drop_down,
              color: Colors.black45,
            ),
            iconSize: 24,
          ),
          dropdownStyleData: DropdownStyleData(
            padding: const EdgeInsets.only(left: 5, right: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          menuItemStyleData: const MenuItemStyleData(
            padding: EdgeInsets.all(6),
          ),
        ),
        const SizedBox(
          height: 25,
        )
      ],
    );
  }
}
