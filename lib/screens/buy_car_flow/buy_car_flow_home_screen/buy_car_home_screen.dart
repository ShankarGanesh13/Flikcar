import 'package:favorite_button/favorite_button.dart';
import 'package:flikcar/common_widgets/custom_appbar.dart';
import 'package:flikcar/common_widgets/primary_button.dart';
import 'package:flikcar/models/buyer_car_model.dart';
import 'package:flikcar/screens/buy_car_flow/buy_car_flow_home_screen/widgets/buyer_testimonial.dart';
import 'package:flikcar/screens/buy_car_flow/buy_car_flow_home_screen/widgets/homescreen_card.dart';
import 'package:flikcar/screens/buy_car_flow/buy_car_flow_home_screen/widgets/upcoming_test_drive_card.dart';
import 'package:flikcar/screens/buy_car_flow/filter_applied/filter_applied.dart';
import 'package:flikcar/screens/buy_car_flow/provider/buy_car_provider.dart';
import 'package:flikcar/screens/sell_car_flow/sell_home_screen/widgets/frequent_question.dart';
import 'package:flikcar/services/get_car_details.dart';
import 'package:flikcar/utils/colors.dart';
import 'package:flikcar/utils/fonts.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BuyCarHomeScreen extends StatefulWidget {
  const BuyCarHomeScreen({super.key});

  @override
  State<BuyCarHomeScreen> createState() => _BuyCarHomeScreenState();
}

class _BuyCarHomeScreenState extends State<BuyCarHomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    Provider.of<BuyCarProvider>(context, listen: false).getCustomerTestdrive();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<BuyerCar> allCars = context.watch<GetCarDetails>().allCars;
    return Scaffold(
      backgroundColor: const Color(0xff171717),
      appBar: CustomAppBar.getAppBarWithContainerSearch(
          back: false,
          context: context,
          function: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const FilterApplied()));
          }),
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
                        const Color(0xff171717).withOpacity(0.8),
                        const Color(0xff171717).withOpacity(0.8)
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
            padding: const EdgeInsets.only(bottom: 20),
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
                      function: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const FilterApplied()));
                      },
                      backgroundColor: AppColors.s1,
                      borderColor: Colors.transparent,
                      textStyle: AppFonts.w500white14,
                    ),
                    const SizedBox(height: 20),
                  ]),
                ),
                UpcomingTestDriveCard(),
                const SizedBox(height: 20),
                HomeScreenCard(
                  title: "Cars by body type",
                  filterButton: true,
                  filters: const ["Hatchback", "Sedan", "SUV", "MUV"],
                  cars: allCars,
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
                HomeScreenCard(
                  title: "Cars by fuel type",
                  filterButton: true,
                  filters: const [
                    "Petrol",
                    "Diesel",
                    "Electric",
                  ],
                  cars: allCars,
                ),
                HomeScreenCard(
                  title: "Cars by transmisson",
                  filterButton: true,
                  filters: const [
                    "Manual",
                    "Automatic",
                  ],
                  cars: allCars,
                ),
                BuyerTestimonials(),
                FrequentQuestions(),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
