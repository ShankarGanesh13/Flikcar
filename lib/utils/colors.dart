import 'package:flutter/material.dart';

class AppColors {
  static Color black = Colors.black;
  static Color p1 = const Color(0xffB70050);
  static Color s1 = const Color(0xff161F31);
  static Color p2 = const Color(0xff45C08D);
  static Color dark2 = const Color(0xff606060);
  static Color grey = const Color(0xffE0E0E0);
  static LinearGradient gradient = const LinearGradient(
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
    colors: [
      Color.fromRGBO(22, 31, 49, 0.10),
      Color.fromRGBO(69, 192, 141, 0.10)
    ],
  );
}
