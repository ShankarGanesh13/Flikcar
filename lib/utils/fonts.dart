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
    color: Colors.black,
    height: 1.2,
  );
  static final w700black30 = getAppFont(
    fontWeight: FontWeight.w700,
    fontSize: 30,
    color: Colors.white,
    height: 1.2,
  );
  static final w700green16 = getAppFont(
    fontWeight: FontWeight.w700,
    fontSize: 16,
    color: const Color(0xff45C08D),
    height: 1.2,
  );
  static final w500green12 = getAppFont(
    fontWeight: FontWeight.w500,
    fontSize: 12,
    color: const Color(0xff45C08D),
    height: 1.2,
  );
  static final w500red12 = getAppFont(
    fontWeight: FontWeight.w500,
    fontSize: 12,
    color: const Color(0xffFF0000),
    height: 1.2,
  );
  static final w500dark212 = getAppFont(
    fontWeight: FontWeight.w500,
    fontSize: 12,
    color: AppColors.dark2,
    height: 1.2,
  );
  static final w700p214 = getAppFont(
    fontWeight: FontWeight.w700,
    fontSize: 14,
    color: AppColors.p2,
    height: 1.2,
  );
  static final w500s110 = getAppFont(
    fontWeight: FontWeight.w500,
    fontSize: 10,
    color: AppColors.s1,
    height: 1.2,
  );
  static final w700black14 = getAppFont(
    fontWeight: FontWeight.w700,
    fontSize: 14,
    color: Colors.black,
    height: 1.2,
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
  static final w500white16 = getAppFont(
    fontWeight: FontWeight.w500,
    fontSize: 16,
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
  static final w600black14 = getAppFont(
    fontWeight: FontWeight.w600,
    fontSize: 14,
    color: Colors.black,
    height: 1.2,
  );
  static final w500s114 = getAppFont(
    fontWeight: FontWeight.w500,
    fontSize: 14,
    color: const Color(0xff161F31),
    height: 1.2,
  );
  static final w500p210 = getAppFont(
    fontWeight: FontWeight.w500,
    fontSize: 10,
    color: AppColors.p2,
    height: 1,
  );
  static final w500black10 = getAppFont(
    fontWeight: FontWeight.w500,
    fontSize: 10,
    color: Colors.black,
    height: 1.2,
  );
  static final w500white10 = getAppFont(
    fontWeight: FontWeight.w500,
    fontSize: 10,
    color: Colors.white,
    height: 1,
  );
  static final w500black12 = getAppFont(
    fontWeight: FontWeight.w500,
    fontSize: 11,
    color: Colors.black,
    height: 1.15,
  );
  static final w500white12 = getAppFont(
    fontWeight: FontWeight.w500,
    fontSize: 11,
    color: Colors.white,
    height: 1,
  );
  static final w700p216 = getAppFont(
    fontWeight: FontWeight.w700,
    fontSize: 16,
    color: AppColors.p2,
    height: 1.2,
  );
  static final w700s116 = getAppFont(
    fontWeight: FontWeight.w700,
    fontSize: 16,
    color: const Color(0xff161F31),
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
    color: AppColors.p2,
    height: 1,
  );
  static final w700s140 = getAppFont(
    fontWeight: FontWeight.w700,
    fontSize: 14,
    color: const Color(0xff161F31),
    height: 1.2,
  );
  static final w700p220 = getAppFont(
    fontWeight: FontWeight.w700,
    fontSize: 16,
    color: AppColors.p2,
    height: 1,
  );

  static final w500black16 = getAppFont(
    fontWeight: FontWeight.w500,
    fontSize: 16,
    color: Colors.black,
    height: 1.3,
  );
  static final w500red14 = getAppFont(
    fontWeight: FontWeight.w500,
    fontSize: 14,
    color: const Color(0xffFF0000),
    height: 1.2,
  );
  static final w500green14 = getAppFont(
    fontWeight: FontWeight.w500,
    fontSize: 14,
    color: const Color(0xff00A407),
    height: 1.2,
  );
}
