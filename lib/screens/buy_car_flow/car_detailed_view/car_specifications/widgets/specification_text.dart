import 'package:flikcar/utils/fonts.dart';
import 'package:flutter/material.dart';

class SpecificationText extends StatelessWidget {
  final String title;
  final String subtitle;
  const SpecificationText(
      {super.key, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppFonts.w500dark212,
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          subtitle,
          style: AppFonts.w700black14,
        ),
        const SizedBox(
          height: 20,
        )
      ],
    );
  }
}
