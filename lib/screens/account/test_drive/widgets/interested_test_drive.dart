import 'package:flikcar/common_widgets/common_car_details.dart';
import 'package:flikcar/common_widgets/primary_button.dart';
import 'package:flikcar/utils/colors.dart';
import 'package:flikcar/utils/fonts.dart';
import 'package:flutter/material.dart';

class InterestedTestDrive extends StatelessWidget {
  const InterestedTestDrive({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.all(15),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
              boxShadow: const [
                BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, 0.25),
                  offset: Offset(5, 5),
                  blurRadius: 20,
                  spreadRadius: 5,
                ),
              ]),
          child: Column(
            children: [
              const CommonCarDetails(),
              Padding(
                padding: const EdgeInsets.only(
                    top: 9.0, left: 20, right: 20, bottom: 20),
                child: PrimaryButton(
                    title: "Book Test Drive",
                    function: () {},
                    borderColor: Colors.transparent,
                    backgroundColor: AppColors.p2,
                    textStyle: AppFonts.w500white14),
              )
            ],
          ),
        )
      ],
    );
  }
}
