import 'package:flikcar/utils/fonts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PositionButton extends StatelessWidget {
  final String title;
  final Function() function;
  const PositionButton(
      {super.key, required this.title, required this.function});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 24,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            splashFactory: NoSplash.splashFactory,
            backgroundColor: Color(0xffF2E1ED),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            padding: EdgeInsets.only(left: 10, right: 10)),
        onPressed: () {},
        child: Text(
          title,
          style: AppFonts.w500p210,
        ),
      ),
    );
  }
}
