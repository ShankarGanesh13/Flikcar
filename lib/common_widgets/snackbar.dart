import 'package:flikcar/utils/colors.dart';
import 'package:flikcar/utils/fonts.dart';
import 'package:flutter/material.dart';

class MySnackbar {
  static SnackBar showSnackBar(context, String message) {
    return SnackBar(
      backgroundColor: AppColors.p2,
      content: Text(
        message,
        style: AppFonts.w500white14,
      ),
      action: SnackBarAction(
        label: 'Dismiss',
        textColor: Colors.white,
        onPressed: () {},
      ),
    );
  }
}
