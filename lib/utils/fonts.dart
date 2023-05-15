import 'package:flikcar/utils/colors.dart';
import 'package:flutter/material.dart';

class AppFonts {
  static TextStyle getAppFont({
    required FontWeight fontWeight,
    required double fontSize,
    required Color color,
  }) {
    return TextStyle(
      fontWeight: fontWeight,
      fontSize: fontSize,
      color: color,
    );
  }
  static final w600black16 = getAppFont(
    fontWeight: FontWeight.w600,
    fontSize: 16,
    color: TextColors.black,
  );
  
  }