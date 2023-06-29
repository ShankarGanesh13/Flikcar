import 'package:flikcar/utils/fonts.dart';
import 'package:flutter/material.dart';

class ListingTextField extends StatelessWidget {
  final String hint;
  final int maxlength;
  final String title;
  const ListingTextField(
      {super.key,
      required this.hint,
      required this.maxlength,
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
            maxLength: maxlength,
          ),
        ),
      ],
    );
  }
}
