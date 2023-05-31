import 'package:flikcar/utils/colors.dart';
import 'package:flutter/material.dart';

class IconElevatedButton extends StatelessWidget {
  final String title;
  final Function() function;
  final Color borderColor;
  final TextStyle textStyle;
  final Color backgroundColor;
  final IconData icon;
  const IconElevatedButton(
      {super.key,
      required this.title,
      required this.function,
      required this.borderColor,
      required this.backgroundColor,
      required this.icon,
      required this.textStyle});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          side: BorderSide(color: borderColor),
          backgroundColor: backgroundColor,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        onPressed: function,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: AppColors.p2),
            const SizedBox(width: 5),
            Text(
              title,
              style: textStyle,
            ),
          ],
        ),
      ),
    );
    ;
  }
}
