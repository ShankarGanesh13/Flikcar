import 'package:flikcar/utils/fonts.dart';
import 'package:flutter/material.dart';

class DocumentTextfield extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final String title;
  final int max;
  final TextInputType keyboard;
  final bool validator;
  final ValueChanged onChanged;

  const DocumentTextfield(
      {super.key,
      required this.controller,
      required this.hint,
      required this.max,
      required this.keyboard,
      required this.validator,
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
        const SizedBox(
          height: 10,
        ),
        TextFormField(
          controller: controller,
          keyboardType: keyboard,
          decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.only(left: 12, right: 12, top: 3, bottom: 3),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(3),
            ),
            counterText: "",
            counterStyle: const TextStyle(color: Colors.transparent),
            hintText: hint,
            hintStyle: AppFonts.w500dark214,
          ),
          maxLength: max,
          validator: (value) {
            if (validator == true) {
              if (value!.length < 3) {
                return "Enter a valid data";
              }
              return null;
            }
          },
          onChanged: (value) {
            onChanged(value);
          },
        ),
      ],
    );
  }
}
