import 'package:flutter/material.dart';

class DisplayRating extends StatelessWidget {
  final int value;
  const DisplayRating({super.key, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        return Icon(
          index < value ? Icons.star : Icons.star_border,
          color: Color(0xffF5CE00),
          size: 18,
        );
      }),
    );
    ;
  }
}
