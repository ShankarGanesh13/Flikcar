import 'package:flikcar/common_widgets/snackbar.dart';
import 'package:flikcar/utils/fonts.dart';
import 'package:flutter/material.dart';

class SpecificationTextField extends StatelessWidget {
  final String title;
  final int maxLength;
  final TextInputType keyboardType;
  final TextEditingController controller;
  final ValueChanged onChanged;
  final bool validator;
  const SpecificationTextField(
      {super.key,
      required this.maxLength,
      required this.keyboardType,
      required this.title,
      required this.validator,
      required this.onChanged,
      required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppFonts.w500black10,
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          height: 45,
          child: TextFormField(
            keyboardType: keyboardType,
            controller: controller,
            onChanged: (value) {
              onChanged(value);
            },
            decoration: InputDecoration(
                errorStyle: const TextStyle(fontSize: 10, height: 1),
                contentPadding:
                    const EdgeInsets.only(left: 8, right: 8, top: 0, bottom: 8),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                counterText: "222",
                counterStyle:
                    const TextStyle(color: Colors.transparent, fontSize: 10),
                hintText: "",
                hintStyle: AppFonts.w500dark214),
            maxLength: maxLength,
            style: AppFonts.w500black12,
            validator: (value) {
              if (validator == true) {
                if (value == null) {
                  return "Enter a valid data";
                }
                if (value == "") {
                  return "Enter a valid data";
                }
              } else {
                return null;
              }
            },
            maxLines: 1,
          ),
        ),
        const SizedBox(
          height: 5,
        )
      ],
    );
  }
}
