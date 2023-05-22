import 'package:flikcar/common_widgets/heading1.dart';
import 'package:flutter/material.dart';

class CarNoTextField extends StatelessWidget {
  const CarNoTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Heading1(title1: "Enter your car number", title2: ""),
        const SizedBox(height: 15),
        TextFormField(
          decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.only(left: 12, right: 12, top: 6, bottom: 6),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            counterStyle: const TextStyle(color: Colors.transparent),
            hintText: "Eg. Dl11AD3345",
          ),
          maxLength: 20,
        ),
      ],
    );
  }
}
