import 'package:flikcar/utils/fonts.dart';
import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final String title;
  final Function() function;
  const PrimaryButton({super.key, required this.title, required this.function});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 37,
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xff9A2870),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        onPressed: function,
        child: Text(
          title,
          style: AppFonts.w500white14,
        ),
      ),
    );
  }
}
