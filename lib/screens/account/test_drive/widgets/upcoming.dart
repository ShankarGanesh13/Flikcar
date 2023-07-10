import 'package:favorite_button/favorite_button.dart';
import 'package:flikcar/common_widgets/common_car_details.dart';
import 'package:flikcar/common_widgets/primary_button.dart';
import 'package:flikcar/utils/colors.dart';
import 'package:flikcar/utils/fonts.dart';
import 'package:flutter/material.dart';

class UpcomingTestDrive extends StatelessWidget {
  const UpcomingTestDrive({super.key});

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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CommonCarDetails(),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.location_on,
                          color: Color(0xff606060),
                          size: 20,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 1.4,
                          child: Text(
                            "Your Location at 47 Lenin Sarani Kolkata 700013 ",
                            maxLines: 1,
                            style: AppFonts.w500dark214,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
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
                      height: 20,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 1.2,
                      child: PrimaryButton(
                          title: "View Test Drive Details",
                          function: () {},
                          borderColor: Colors.transparent,
                          backgroundColor: Color(0xff45C08D),
                          textStyle: AppFonts.w500white14),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 1.2,
                      child: PrimaryButton(
                        backgroundColor: Colors.white,
                        borderColor: AppColors.p2,
                        textStyle: AppFonts.w500p215,
                        title: "Contact Dealer",
                        function: () {},
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
