import 'package:flikcar/common_widgets/custom_appbar.dart';
import 'package:flikcar/common_widgets/primary_button.dart';
import 'package:flikcar/common_widgets/secondary_button.dart';
import 'package:flikcar/screens/sell_car_flow/sell_home_screen/widgets/car_no_textfield.dart';
import 'package:flikcar/screens/sell_car_flow/sell_home_screen/widgets/frequent_question.dart';
import 'package:flikcar/screens/sell_car_flow/sell_home_screen/widgets/select_brand.dart';
import 'package:flikcar/screens/sell_car_flow/sell_home_screen/widgets/seller_testimonials.dart';
import 'package:flikcar/screens/sell_car_flow/selling_process/selling_process.dart';
import 'package:flutter/material.dart';

class SellCarHomeScreen extends StatelessWidget {
  const SellCarHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff9A2870),
      appBar: CustomAppBar.getAppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 230,
                child: Stack(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 230,
                      child: Image.asset(
                        "assets/sell_screen_background.png",
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
                              const Color(0xff100049).withOpacity(0.8),
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
                              "Sell your car at\nthe best price",
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
                        )),
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
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
                          const EdgeInsets.only(top: 30, left: 15.0, right: 15),
                      child: Column(children: [
                        const CarNoTextField(),
                        PrimaryButton(
                          title: "Get Car Price",
                          function: () {},
                        ),
                        const Padding(
                          padding: EdgeInsets.all(6.0),
                          child: Text("or,",
                              style: TextStyle(
                                  color: Color(0xff606060),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500)),
                        ),
                        const SelectBrand(),
                        const SizedBox(height: 20),
                        SecondaryButton(
                          title: "Start",
                          function: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SellingProcess(),
                              ),
                            );
                          },
                        ),
                        const SizedBox(height: 20),
                      ]),
                    ),
                    SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: 210,
                        child: Image.asset(
                          "assets/why_choose_flikcar.png",
                          fit: BoxFit.fill,
                        )),
                    SellerTestimonials(),
                    const SizedBox(height: 20),
                    FrequentQuestions(),
                    const SizedBox(height: 100),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}