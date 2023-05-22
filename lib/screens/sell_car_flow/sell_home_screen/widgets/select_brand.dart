import 'package:flikcar/common_widgets/heading1.dart';
import 'package:flikcar/utils/fonts.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SelectBrand extends StatelessWidget {
  const SelectBrand({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Heading1(title1: "Start with your car brand", title2: ""),
        const SizedBox(height: 15),
        GridView.count(
          shrinkWrap: true,
          crossAxisCount: 3,
          mainAxisSpacing: 15,
          crossAxisSpacing: 30,
          childAspectRatio: 1.9 / 1.3,
          physics: NeverScrollableScrollPhysics(),
          children: List.generate(9, (index) {
            return Container(
                padding: EdgeInsets.only(top: 5, bottom: 5),
                height: 62,
                width: 86,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Color(0xff606060),
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 30,
                        width: 30,
                        child: Image.asset("assets/bmw_logo.png"),
                      ),
                      const SizedBox(height: 4),
                      const Text(
                        "BMW",
                        style: TextStyle(
                          color: Color(0xff171717),
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ));
          }),
        ),
      ],
    );
  }
}
