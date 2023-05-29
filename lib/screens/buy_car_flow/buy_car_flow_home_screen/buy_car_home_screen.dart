import 'package:favorite_button/favorite_button.dart';
import 'package:flikcar/common_widgets/custom_appbar.dart';
import 'package:flikcar/common_widgets/heading1.dart';
import 'package:flikcar/common_widgets/primary_button.dart';
import 'package:flikcar/screens/buy_car_flow/buy_car_flow_home_screen/widgets/buyer_testimonial.dart';
import 'package:flikcar/screens/buy_car_flow/buy_car_flow_home_screen/widgets/homescreen_card.dart';
import 'package:flikcar/screens/sell_car_flow/sell_home_screen/widgets/frequent_question.dart';
import 'package:flikcar/screens/sell_car_flow/sell_home_screen/widgets/seller_testimonials.dart';
import 'package:flikcar/utils/colors.dart';
import 'package:flutter/material.dart';

class BuyCarHomeScreen extends StatelessWidget {
  const BuyCarHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.p2,
      appBar: CustomAppBar.getBuyCarAppBar(context),
      body: SingleChildScrollView(
        child: Column(children: [
          Stack(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 230,
                child: Image.asset(
                  "assets/buy_car_background.png",
                  fit: BoxFit.fill,
                ),
              ),
              Positioned(
                child: Container(
                  height: 230,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [
                        const Color(0xff100049).withOpacity(0.4),
                        const Color(0xffB70050).withOpacity(0.8)
                      ],
                    ),
                  ),
                ),
              ),
              const Positioned(
                top: 30,
                left: 15,
                child: Column(
                  children: [
                    Text(
                      "Buy car at\nthe best price",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 32,
                          fontWeight: FontWeight.w700),
                    ),
                    Text(
                      "Lorem ipsum dolor sit amet,\nconsectetur adipiscing elit. Nulla .",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                    )
                  ],
                ),
              ),
            ],
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.only(bottom: 20),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
            ),
            child: Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.only(top: 15.0, left: 15, right: 15),
                  child: Column(children: [
                    PrimaryButton(
                      title: "View All Cars",
                      function: () {},
                    ),
                    const SizedBox(height: 20),
                  ]),
                ),
                const HomeScreenCard(
                  title: "Recently Viewed",
                  filterButton: false,
                  filters: [],
                ),
                const HomeScreenCard(
                  title: "Featured Cars",
                  filterButton: false,
                  filters: [],
                ),
                const HomeScreenCard(
                  title: "Cars by body type",
                  filterButton: true,
                  filters: ["Hatchback", "Sedan", "SUV", "MUV"],
                ),
                const HomeScreenCard(
                  title: "Cars by budget",
                  filterButton: true,
                  filters: [
                    "1-5 lakh",
                    "5-10 lakh",
                    "10-15 lakh",
                    "15-20 lakh",
                    "20-25 lakh"
                  ],
                ),
                Image.asset(
                  "assets/confused_banner.png",
                  fit: BoxFit.fill,
                  height: 186,
                  width: MediaQuery.of(context).size.width,
                ),
                const SizedBox(
                  height: 30,
                ),
                const HomeScreenCard(
                  title: "Cars by fuel type",
                  filterButton: true,
                  filters: [
                    "Petrol",
                    "Diesel",
                    "Electric",
                    "CNG",
                    "CNG+Petrol"
                  ],
                ),
                const HomeScreenCard(
                  title: "Cars by transmisson",
                  filterButton: true,
                  filters: [
                    "Manual",
                    "Automatic",
                  ],
                ),
                const HomeScreenCard(
                  title: "Cars by year",
                  filterButton: true,
                  filters: [
                    "2012 & above",
                    "2014 & above",
                    "2016 & above",
                    "2018 & above",
                    "2020 & above"
                  ],
                ),
                BuyerTestimonials(),
                FrequentQuestions(),
              ],
            ),
          )
        ]),
      ),
    );
  }
}
