import 'package:flutter/material.dart';

import '../utils/fonts.dart';

class Heading1 extends StatelessWidget {
  final String title1;
  final String title2;
  const Heading1({super.key, required this.title1, required this.title2});

  @override
  Widget build(BuildContext context) {
    return Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Container(
        margin: const EdgeInsets.only(right: 10),
        height: 19,
        width: 4,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomLeft,
            colors: [
              Color(0xffB70050).withOpacity(0.8),
              Color(0xff100049).withOpacity(0.8),
            ],
          ),
        ),
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title1,
            style: AppFonts.w700black20,
          ),
          const SizedBox(
            height: 3,
          ),
          title2 == ""
              ? const SizedBox()
              : Text(
                  title2,
                  style: AppFonts.w700black20,
                ),
        ],
      ),
    ]);
  }
}
