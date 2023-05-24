import 'package:flikcar/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppFonts {
  static TextStyle getAppFont({
    required FontWeight fontWeight,
    required double fontSize,
    required Color color,
    required double height,
  }) {
    return GoogleFonts.inter(
      fontWeight: fontWeight,
      fontSize: fontSize,
      color: color,
      height: height,
    );
  }

  static final w700black20 = getAppFont(
    fontWeight: FontWeight.w700,
    fontSize: 20,
    color: TextColors.black,
    height: 1,
  );
  static final w700white32 = getAppFont(
    fontWeight: FontWeight.w700,
    fontSize: 32,
    color: Colors.white,
    height: 1,
  );
  static final w500white14 = getAppFont(
    fontWeight: FontWeight.w500,
    fontSize: 14,
    color: Colors.white,
    height: 1.6,
  );
  static final w500black14 = getAppFont(
    fontWeight: FontWeight.w500,
    fontSize: 14,
    color: Colors.black,
    height: 1.6,
  );
  static final w500dark214 = getAppFont(
    fontWeight: FontWeight.w500,
    fontSize: 14,
    color: const Color(0xff606060),
    height: 1.6,
  );
  static final w700black16 = getAppFont(
    fontWeight: FontWeight.w700,
    fontSize: 16,
    color: Colors.black,
    height: 1.2,
  );
  static final w500s114 = getAppFont(
    fontWeight: FontWeight.w500,
    fontSize: 14,
    color: const Color(0xff100049),
    height: 1.2,
  );
  static final w500p210 = getAppFont(
    fontWeight: FontWeight.w500,
    fontSize: 10,
    color: const Color(0xff9A2870),
    height: 1,
  );
  static final w500black10 = getAppFont(
    fontWeight: FontWeight.w500,
    fontSize: 10,
    color: Colors.black,
    height: 1,
  );
  static final w500white10 = getAppFont(
    fontWeight: FontWeight.w500,
    fontSize: 10,
    color: Colors.white,
    height: 1,
  );
  static final w700p216 = getAppFont(
    fontWeight: FontWeight.w700,
    fontSize: 16,
    color: const Color(0xff9A2870),
    height: 1.2,
  );
  static final w700s116 = getAppFont(
    fontWeight: FontWeight.w700,
    fontSize: 16,
    color: const Color(0xff100049),
    height: 1.4,
  );
  static final w700dark216 = getAppFont(
    fontWeight: FontWeight.w700,
    fontSize: 16,
    color: const Color(0xff606060),
    height: 1,
  );
  static final w700white16 = getAppFont(
    fontWeight: FontWeight.w700,
    fontSize: 16,
    color: Colors.white,
    height: 1,
  );
  static final w500p215 = getAppFont(
    fontWeight: FontWeight.w500,
    fontSize: 14,
    color: const Color(0xff9A2870),
    height: 1,
  );
}
