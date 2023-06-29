import 'package:flikcar/utils/fonts.dart';
import 'package:flutter/material.dart';

class SpecificationTextField extends StatelessWidget {
  final String title;
  final int maxLength;
  const SpecificationTextField(
      {super.key, required this.maxLength, required this.title});

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
          height: 30,
          child: TextFormField(
            decoration: InputDecoration(
                contentPadding:
                    const EdgeInsets.only(left: 8, right: 8, top: 4, bottom: 7),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                counterText: "",
                counterStyle: const TextStyle(color: Colors.transparent),
                hintText: "",
                hintStyle: AppFonts.w500dark214),
            maxLength: maxLength,
            style: AppFonts.w500black12,
          ),
        ),
        const SizedBox(
          height: 20,
        )
      ],
    );
  }
}
