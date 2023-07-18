import 'package:favorite_button/favorite_button.dart';
import 'package:flikcar/common_widgets/custom_appbar.dart';
import 'package:flikcar/common_widgets/heading1.dart';
import 'package:flikcar/common_widgets/primary_button.dart';
import 'package:flikcar/screens/dealers_flow/auction_screens/dealer_auction_home_screen/widgets/dealer_car_card.dart';
import 'package:flikcar/screens/dealers_flow/auction_screens/dealer_auction_home_screen/widgets/dealer_header.dart';
import 'package:flikcar/screens/dealers_flow/auction_screens/dealer_car_list_screen/dealer_car_list_screen.dart';
import 'package:flikcar/screens/dealers_flow/auction_screens/dealer_car_list_screen/widget/dealer_car_list_card.dart';
import 'package:flikcar/screens/sell_car_flow/sell_home_screen/widgets/frequent_question.dart';
import 'package:flikcar/services/get_brand_model_varient.dart';
import 'package:flikcar/utils/colors.dart';
import 'package:flikcar/utils/fonts.dart';
import 'package:flutter/material.dart';

class DealerAuctionHomeScreen extends StatelessWidget {
  const DealerAuctionHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar.getAppBarWithContainerSearch(
          context: context,
          function: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const DealerCarListScreen()));
          },
          back: false),
      body: SingleChildScrollView(
        child: SizedBox(
          height: 3000,
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
                            function: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const DealerCarListScreen()));
                              // GetBrandModelVarient().getBrandModelVarient();
                            },
                            borderColor: Colors.transparent,
                            backgroundColor: AppColors.s1,
                            textStyle: AppFonts.w500white14),
                      ),
                      // const DealerCarCard(
                      //   filters: ["Sedan", "Hatchback", "MUV", "SUV"],
                      //   title: "Cars by body type",
                      //   filterButton: true,
                      // ),
                      // const DealerCarCard(
                      //   filters: [
                      //     "1-5 lakh",
                      //     "5-10 lakh",
                      //     "10-15 lakh",
                      //     "15-20 lakh",
                      //     "20-25 lakh"
                      //   ],
                      //   title: "Cars by budget",
                      //   filterButton: true,
                      // ),
                      // const DealerCarCard(
                      //   filters: [
                      //     "2012 & above",
                      //     "2014 & above",
                      //     "2016 & above",
                      //     "2018 & above",
                      //     "2020 & above"
                      //   ],
                      //   title: "Cars by year",
                      //   filterButton: true,
                      // ),
                      Column(
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(15.0),
                            child: Heading1(
                                title1: "Ongoing Auctions", title2: ""),
                          ),
                          ListView.builder(
                              itemCount: 5,
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, snapshot) {
                                return const DealerCarListCard();
                              }),
                        ],
                      ),
                      FrequentQuestions(),
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
