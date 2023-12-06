import 'package:flikcar/utils/fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ListingTextField extends StatelessWidget {
  final String hint;
  final int maxlength;
  final String title;
  final bool validator;
  final TextInputType keyboardType;
  final TextEditingController controller;
  final ValueChanged onChanged;
  final List<TextInputFormatter>? inputType;
  const ListingTextField(
      {super.key,
      this.inputType,
      required this.hint,
      required this.validator,
      required this.keyboardType,
      required this.controller,
      required this.maxlength,
      required this.onChanged,
      required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppFonts.w700black16,
        ),
        Container(
          margin: const EdgeInsets.only(top: 10),
          width: MediaQuery.of(context).size.width,
          child: TextFormField(
            inputFormatters: inputType,
            keyboardType: keyboardType,
            controller: controller,
            decoration: InputDecoration(
                contentPadding: const EdgeInsets.only(
                    left: 25, right: 12, top: 4, bottom: 4),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                counterText: "",
                counterStyle: const TextStyle(color: Colors.transparent),
                hintText: hint,
                hintStyle: AppFonts.w500dark214),
            onChanged: (value) {
              onChanged(value);
            },
            maxLength: maxlength,
            validator: (value) {
              if (validator == true) {
                if (value == null) {
                  return "Enter valid data";
                }
                if (value == "") {
                  return "Enter valid data";
                }
              }
              return null;
            },
          ),
        ),
      ],
    );
  }
}
