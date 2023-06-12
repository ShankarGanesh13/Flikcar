import 'package:flikcar/common_widgets/common_car_details.dart';
import 'package:flikcar/common_widgets/primary_button.dart';
import 'package:flikcar/utils/colors.dart';
import 'package:flikcar/utils/fonts.dart';
import 'package:flutter/material.dart';

class CancelledTestDrive extends StatelessWidget {
  const CancelledTestDrive({super.key});

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
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 10,
                  ),
                  const Icon(
                    Icons.location_on,
                    color: Color(0xff606060),
                    size: 20,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    "Your Location at 47 Lenin Sarani Kolkata 700013",
                    style: AppFonts.w500dark214,
                  )
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 10,
                  ),
                  const Icon(
                    Icons.calendar_month,
                    color: Color(0xff606060),
                    size: 20,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    "30 May , Tue, 17:00  ",
                    style: AppFonts.w500dark214,
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 9.0, left: 20, right: 20, bottom: 20),
                child: PrimaryButton(
                    title: "Book Test Drive",
                    function: () {},
                    borderColor: AppColors.p2,
                    backgroundColor: Colors.white,
                    textStyle: AppFonts.w500p215),
              )
            ],
          ),
        )
      ],
    );
  }
}
