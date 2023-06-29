import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flikcar/utils/colors.dart';
import 'package:flikcar/utils/fonts.dart';
import 'package:flutter/material.dart';

class BoolDropdownTextField extends StatelessWidget {
  final String selectedValue;
  final String title;
  const BoolDropdownTextField(
      {super.key, required this.title, required this.selectedValue});

  static final List<String> items = ["Yes", "No"];
  final String hint = "Select a value";
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppFonts.w500black12,
        ),
        const SizedBox(
          height: 10,
        ),
        DropdownButtonFormField2<String>(
          isExpanded: true,
          decoration: InputDecoration.collapsed(
            hintText: "",
            border: OutlineInputBorder(
                borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                borderSide: BorderSide(color: AppColors.p1)),
          ),
          hint: Text(
            hint,
            style: AppFonts.w500dark212,
          ),
          items: items
              .map((item) => DropdownMenuItem<String>(
                    value: item,
                    child: Text(item, style: AppFonts.w500black12),
                  ))
              .toList(),
          validator: (value) {
            if (value == null) {
              return hint;
            }
            return null;
          },
          onChanged: (value) {
            //Do something when selected item is changed.
          },
          onSaved: (value) {
            //    selectedValue = value.toString();
          },
          buttonStyleData: const ButtonStyleData(
            padding: EdgeInsets.only(
              left: 0,
              right: 5,
            ),
            height: 30,
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
            padding: EdgeInsets.all(0),
          ),
        ),
        const SizedBox(
          height: 20,
        )
      ],
    );
  }
}
