import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flikcar/utils/colors.dart';
import 'package:flikcar/utils/fonts.dart';
import 'package:flutter/material.dart';

class DropDownTextField extends StatelessWidget {
  final String hint;
  final String error;
  final String selectedValue;
  final List<String> items;
  final String title;

  final ValueChanged<dynamic> onchanged;
  const DropDownTextField(
      {super.key,
      required this.title,
      required this.hint,
      required this.error,
      required this.items,
      required this.onchanged,
      required this.selectedValue});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppFonts.w700black16,
        ),
        const SizedBox(
          height: 10,
        ),
        DropdownButtonFormField2<String>(
          isExpanded: true,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(3),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            focusedBorder: OutlineInputBorder(
                borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                borderSide: BorderSide(color: AppColors.p1)),
          ),
          hint: Text(
            hint,
            style: AppFonts.w500dark214,
          ),
          value: selectedValue,
          items: items
              .map((item) => DropdownMenuItem<String>(
                    value: item,
                    child: Text(item, style: AppFonts.w500black14),
                  ))
              .toList(),
          validator: (value) {
            if (value == null) {
              return error;
            }
            return null;
          },
          onChanged: (value) {
            onchanged(value!);
          },
          buttonStyleData: const ButtonStyleData(
            padding: EdgeInsets.only(left: 10, right: 10),
            height: 40,
          ),
          iconStyleData: const IconStyleData(
            icon: Icon(
              Icons.arrow_drop_down,
              color: Colors.black45,
            ),
            iconSize: 20,
          ),
          dropdownStyleData: DropdownStyleData(
            padding: const EdgeInsets.only(left: 10, right: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          menuItemStyleData:
              const MenuItemStyleData(padding: EdgeInsets.all(0)),
        ),
      ],
    );
  }
}
