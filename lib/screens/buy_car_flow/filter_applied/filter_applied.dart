import 'package:flikcar/common_widgets/custom_appbar.dart';
import 'package:flikcar/screens/buy_car_flow/filter_applied/widget/filter_applied_card.dart';
import 'package:flikcar/screens/buy_car_flow/filter_screen/filter_screen.dart';
import 'package:flikcar/utils/fonts.dart';
import 'package:flutter/material.dart';

class FilterApplied extends StatelessWidget {
  const FilterApplied({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar.getBuyCarAppBar(
            context: context,
            function: () {
              print("mmbro");
            }),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    menu(
                        image: "assets/car_details_icon/car_compare.png",
                        title: "Compare"),
                    Container(
                      width: 2,
                      height: 20,
                      color: const Color(0xffE0E0E0),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => FilterScreen()));
                      },
                      child: menu(
                          image: "assets/car_details_icon/filter.png",
                          title: "Filters"),
                    ),
                    Container(
                      width: 2,
                      height: 20,
                      color: const Color(0xffE0E0E0),
                    ),
                    menu(
                        image: "assets/car_details_icon/sort.png",
                        title: "Sort"),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 15,
                  ),
                  Text(
                    "303 ",
                    style: AppFonts.w700black16,
                  ),
                  Text(
                    "Flikcar Certified Cars Found",
                    style: AppFonts.w500black14,
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Column(
                  children: List.generate(
                5,
                (index) => FilterAppliedCard(),
              ))
            ],
          ),
        ));
  }

  Widget menu({required String image, required String title}) {
    return Row(
      children: [
        SizedBox(height: 15, width: 20, child: Image.asset(image)),
        const SizedBox(width: 8),
        Text(title, style: AppFonts.w700s140),
      ],
    );
  }
}
