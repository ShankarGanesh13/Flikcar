import 'package:flikcar/common_widgets/custom_appbar.dart';
import 'package:flikcar/common_widgets/primary_button.dart';
import 'package:flikcar/screens/buy_car_flow/car_detailed_view/car_detailed_view.dart';
import 'package:flikcar/screens/buy_car_flow/compare_screen/compare_screen.dart';
import 'package:flikcar/screens/buy_car_flow/filter_applied/widget/filter_applied_card.dart';
import 'package:flikcar/screens/buy_car_flow/filter_screen/filter_screen.dart';
import 'package:flikcar/screens/buy_car_flow/provider/buy_car_provider.dart';
import 'package:flikcar/utils/colors.dart';
import 'package:flikcar/utils/fonts.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FilterApplied extends StatelessWidget {
  const FilterApplied({super.key});

  @override
  Widget build(BuildContext context) {
    bool compare = context.watch<BuyCarProvider>().compare;

    return Scaffold(
        appBar: CustomAppBar.getAppBarWithSearch(
            context: context,
            back: true,
            function: () {
              print("mmbro");
            }),
        bottomNavigationBar: compare
            ? Container(
                padding: const EdgeInsets.only(
                    top: 8, bottom: 8, left: 20, right: 20),
                height: 52,
                width: MediaQuery.of(context).size.width,
                color: const Color(0xff161F31),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 3,
                      child: PrimaryButton(
                          title: "Back",
                          backgroundColor: AppColors.p2,
                          borderColor: Colors.transparent,
                          function: () {
                            Provider.of<BuyCarProvider>(context, listen: false)
                                .compareCars();
                          },
                          textStyle: AppFonts.w500white14),
                    ),
                    const SizedBox(width: 20),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 3,
                      child: PrimaryButton(
                          title: "Compare",
                          backgroundColor: AppColors.p2,
                          borderColor: Colors.transparent,
                          function: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const CompareScreen(),
                                ));
                          },
                          textStyle: AppFonts.w500white14),
                    ),
                  ],
                ),
              )
            : const SizedBox(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Provider.of<BuyCarProvider>(context, listen: false)
                            .compareCars();
                      },
                      child: menu(
                          image: "assets/car_details_icon/car_compare.png",
                          title: "Compare",
                          color: compare == true
                              ? const Color(0xff45C08D)
                              : const Color(0xff161F31),
                          style: compare == true
                              ? AppFonts.w700p216
                              : AppFonts.w700s116),
                    ),
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
                              builder: (context) => const FilterScreen(),
                            ));
                      },
                      child: menu(
                          image: "assets/car_details_icon/filter.png",
                          title: "Filters",
                          color: const Color(0xff161F31),
                          style: AppFonts.w700s116),
                    ),
                    Container(
                      width: 2,
                      height: 20,
                      color: const Color(0xffE0E0E0),
                    ),
                    menu(
                        image: "assets/car_details_icon/sort.png",
                        title: "Sort",
                        color: const Color(0xff161F31),
                        style: AppFonts.w700s116),
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
                (index) => GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const CarDetailedView()));
                  },
                  child: FilterAppliedCard(
                    compare: compare,
                  ),
                ),
              ))
            ],
          ),
        ));
  }

  Widget menu(
      {required String image,
      required String title,
      required Color color,
      required TextStyle style}) {
    return Row(
      children: [
        SizedBox(
            height: 15, width: 20, child: Image.asset(image, color: color)),
        const SizedBox(width: 8),
        Text(title, style: style),
      ],
    );
  }
}
