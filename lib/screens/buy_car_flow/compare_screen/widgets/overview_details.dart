import 'package:flikcar/utils/fonts.dart';
import 'package:flutter/material.dart';

class OverviewDetails extends StatelessWidget {
  final String title;
  final String value1;
  final String value2;
  const OverviewDetails(
      {super.key,
      required this.title,
      required this.value1,
      required this.value2});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 25,
          width: MediaQuery.of(context).size.width,
          color: Color(0xffE0E0E0),
          child: Row(
            children: [
              const SizedBox(width: 15),
              Text(title.toUpperCase(), style: AppFonts.w500dark214),
            ],
          ),
        ),
        Padding(
          padding:
              const EdgeInsets.only(left: 15.0, right: 15, top: 10, bottom: 20),
          child: Row(
            children: [
              Text(value1, style: AppFonts.w700black16),
              const Spacer(),
              Text(
                value2,
                style: AppFonts.w700black16,
              )
            ],
          ),
        )
      ],
    );
  }
}
