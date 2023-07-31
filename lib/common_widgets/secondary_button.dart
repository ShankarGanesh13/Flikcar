import 'package:flikcar/utils/colors.dart';
import 'package:flikcar/utils/fonts.dart';
import 'package:flutter/material.dart';

class SecondaryButton extends StatelessWidget {
  final String title;
  final Function() function;
  const SecondaryButton(
      {super.key, required this.title, required this.function});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 27,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.s1,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            padding: EdgeInsets.only(left: 10, right: 10)),
        onPressed: function,
        child: Text(
          title,
          style: AppFonts.w500white14,
        ),
      ),
    );
  }
}
