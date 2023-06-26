import 'package:favorite_button/favorite_button.dart';
import 'package:flikcar/common_widgets/custom_appbar.dart';
import 'package:flikcar/common_widgets/heading1.dart';
import 'package:flikcar/common_widgets/primary_button.dart';
import 'package:flikcar/screens/dealers_flow/auction_screens/dealer_home_screen/widgets/dealer_car_card.dart';
import 'package:flikcar/screens/dealers_flow/auction_screens/dealer_home_screen/widgets/dealer_header.dart';
import 'package:flikcar/utils/colors.dart';
import 'package:flikcar/utils/fonts.dart';
import 'package:flutter/material.dart';

class DealerAuctionHomeScreen extends StatelessWidget {
  const DealerAuctionHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar.getAppBarWithSearch(
          context: context, function: () {}, back: false),
      body: SingleChildScrollView(
        child: SizedBox(
          height: 1950,
          child: Stack(
            children: [
              const DealerHeader(),
              Positioned(
                top: 220,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(16),
                          topRight: Radius.circular(16))),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 30.0, left: 15, right: 15, bottom: 30),
                        child: PrimaryButton(
                            title: "View All",
                            function: () {},
                            borderColor: Colors.transparent,
                            backgroundColor: AppColors.s1,
                            textStyle: AppFonts.w500white14),
                      ),
                      const DealerCarCard(
                        filters: ["Sedan", "Hatchback", "MUV", "SUV"],
                        title: "Cars by body type",
                        filterButton: true,
                      ),
                      const DealerCarCard(
                        filters: [
                          "1-5 lakh",
                          "5-10 lakh",
                          "10-15 lakh",
                          "15-20 lakh",
                          "20-25 lakh"
                        ],
                        title: "Cars by budget",
                        filterButton: true,
                      ),
                      const DealerCarCard(
                        filters: [
                          "2012 & above",
                          "2014 & above",
                          "2016 & above",
                          "2018 & above",
                          "2020 & above"
                        ],
                        title: "Cars by year",
                        filterButton: true,
                      ),
                      const SizedBox(
                        height: 50,
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
