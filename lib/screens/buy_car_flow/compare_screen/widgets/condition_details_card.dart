import 'package:flikcar/utils/fonts.dart';
import 'package:flutter/material.dart';

class ConditionDetailsCard extends StatelessWidget {
  final String title;
  final String value1;
  final String value2;
  final String indicator1;
  final String indicator2;
  const ConditionDetailsCard(
      {super.key,
      required this.title,
      required this.indicator1,
      required this.indicator2,
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
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  indicatorWidget(indicator: indicator1),
                  const SizedBox(height: 5),
                  Text(value1, style: AppFonts.w700black16),
                ],
              ),
              const Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  indicatorWidget(indicator: indicator2),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    value2,
                    style: AppFonts.w700black16,
                  ),
                ],
              )
            ],
          ),
        )
      ],
    );
  }

  Widget indicatorWidget({required String indicator}) {
    print(indicator);
    if (indicator == "good") {
      return const CircleAvatar(
        backgroundColor: Colors.green,
        radius: 8,
        child: Icon(
          Icons.check,
          size: 13,
          color: Colors.white,
        ),
      );
    }
    if (indicator == "bad") {
      return const Icon(
        Icons.error,
        size: 17,
        color: Colors.red,
      );
    }
    return SizedBox();
  }
}
