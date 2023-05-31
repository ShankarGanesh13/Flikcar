import 'package:flikcar/common_widgets/custom_appbar.dart';
import 'package:flikcar/common_widgets/primary_button.dart';
import 'package:flikcar/screens/buy_car_flow/filter_screen/widgets/price_filter.dart';
import 'package:flikcar/utils/colors.dart';
import 'package:flikcar/utils/fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_xlider/flutter_xlider.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key});
  static List<String> filter = [
    "Make & Model",
    "Budget",
    "Year",
    "Kms Driven",
    "Fuel Type",
    "Body Type",
    "Transmission",
    "Color",
    "Owners"
  ];

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar.getAppBar(),
        bottomNavigationBar: Container(
          height: 60,
          decoration: const BoxDecoration(color: Colors.white, boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.25),
              offset: Offset(-1, 12),
              blurRadius: 15,
              spreadRadius: 15,
            ),
          ]),
          child: Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Row(children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "130",
                    style: AppFonts.w700black16,
                  ),
                  Text(
                    "cars found",
                    style: AppFonts.w500dark214,
                  )
                ],
              ),
              const Spacer(),
              SizedBox(
                width: 150,
                child: PrimaryButton(
                    title: "Show Result",
                    function: () {},
                    borderColor: Colors.transparent,
                    backgroundColor: AppColors.p2,
                    textStyle: AppFonts.w500white14),
              )
            ]),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                  height: 52,
                  padding: const EdgeInsets.all(15),
                  width: MediaQuery.of(context).size.width,
                  color: const Color.fromARGB(255, 241, 255, 249),
                  child: Row(
                    children: [
                      GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Icon(Icons.chevron_left, color: AppColors.p2)),
                      const SizedBox(width: 8),
                      Text(
                        "Filters",
                        style: AppFonts.w700black16,
                      ),
                      const Spacer(),
                      Text(
                        "CLEAR FILTERS",
                        style: AppFonts.w500p215,
                      )
                    ],
                  )),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width / 2.4,
                    // height: MediaQuery.of(context).size.height / 1.4,
                    color: const Color(0xffE0E0E0),
                    child: Column(
                      children: [
                        ListView.builder(
                            itemCount: FilterScreen.filter.length,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selectedIndex = index;
                                  });
                                },
                                child: Container(
                                  height: 57,
                                  color: selectedIndex == index
                                      ? const Color(0xffFFFFFF)
                                      : const Color(0xffE0E0E0),
                                  child: Row(children: [
                                    VerticalDivider(
                                      color: selectedIndex == index
                                          ? const Color(0xff45C08D)
                                          : Colors.transparent,
                                      thickness: 5,
                                      width: 0,
                                    ),
                                    const SizedBox(
                                      width: 15,
                                    ),
                                    Text(
                                      FilterScreen.filter[index],
                                      style: selectedIndex == index
                                          ? AppFonts.w700p216
                                          : AppFonts.w700black16,
                                    )
                                  ]),
                                ),
                              );
                            })
                      ],
                    ),
                  ),
                  Container(padding: EdgeInsets.all(12), child: PriceFilter())
                ],
              )
            ],
          ),
        ));
  }
}
