import 'package:flikcar/utils/colors.dart';
import 'package:flikcar/utils/fonts.dart';
import 'package:flutter/material.dart';

class BuyNavButton extends StatelessWidget {
  final String title;
  final Function() function;
  final IconData icon;
  const BuyNavButton(
      {super.key,
      required this.function,
      required this.icon,
      required this.title});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.p2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        padding: const EdgeInsets.only(left: 10, right: 10),
      ),
      onPressed: function,
      child: Row(
        children: [
          Text(
            title,
            style: AppFonts.w500white14,
          ),
          const SizedBox(width: 4),
          Icon(
            icon,
            color: Colors.white,
            size: 18,
          ),
        ],
      ),
    );
  }
}
