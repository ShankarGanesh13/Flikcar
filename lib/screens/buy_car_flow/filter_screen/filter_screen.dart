import 'package:flikcar/common_widgets/custom_appbar.dart';
import 'package:flikcar/common_widgets/primary_button.dart';
import 'package:flikcar/screens/buy_car_flow/filter_screen/widgets/body_type_filter.dart';
import 'package:flikcar/screens/buy_car_flow/filter_screen/widgets/colors_filter.dart';
import 'package:flikcar/screens/buy_car_flow/filter_screen/widgets/fuel_type_filter.dart';
import 'package:flikcar/screens/buy_car_flow/filter_screen/widgets/kilometers_driven_filter.dart';
import 'package:flikcar/screens/buy_car_flow/filter_screen/widgets/make_model_filter.dart';
import 'package:flikcar/screens/buy_car_flow/filter_screen/widgets/owners_filter.dart';
import 'package:flikcar/screens/buy_car_flow/filter_screen/widgets/price_filter.dart';
import 'package:flikcar/screens/buy_car_flow/filter_screen/widgets/transmisson_filter.dart';
import 'package:flikcar/screens/buy_car_flow/filter_screen/widgets/year_filter.dart';
import 'package:flikcar/screens/sell_car_flow/selling_process/kilometers_driven/kilometers_driven.dart';
import 'package:flikcar/services/get_car_details.dart';
import 'package:flikcar/services/search_service.dart';
import 'package:flikcar/utils/colors.dart';
import 'package:flikcar/utils/fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_xlider/flutter_xlider.dart';
import 'package:provider/provider.dart';

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
    "Owners",
  ];

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  int selectedIndex = 0;
  static List<Widget> filterWidgets = [
    const MakeModelFilters(),
    const PriceFilter(),
    const YearFilter(),
    const KilometersDrivenFilter(),
    const FuelTypeFilter(),
    const BodyTypeFilter(),
    const TransmissionFilter(),
    const OwnersFilter(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar.getAppBar(),
        bottomNavigationBar: SafeArea(
          child: Container(
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
              child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                // Column(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   crossAxisAlignment: CrossAxisAlignment.start,
                //   children: [
                //     Text(
                //       "130",
                //       style: AppFonts.w700black16,
                //     ),
                //     Text(
                //       "cars found",
                //       style: AppFonts.w500dark214,
                //     )
                //   ],
                // ),
                //  const Spacer(),
                SizedBox(
                  width: 150,
                  child: PrimaryButton(
                      title: "Show Result",
                      function: () {
                        Provider.of<SearchService>(context, listen: false)
                            .showFilterResult();
                        Provider.of<SearchService>(context, listen: false)
                            .getAppliedFilters();
                        Navigator.pop(context);
                      },
                      borderColor: Colors.transparent,
                      backgroundColor: AppColors.p2,
                      textStyle: AppFonts.w500white14),
                )
              ]),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                  height: 52,
                  padding: const EdgeInsets.all(15),
                  width: MediaQuery.of(context).size.width,
                  //color: const Color.fromARGB(255, 241, 255, 249),
                  decoration: BoxDecoration(gradient: AppColors.gradient),
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
                      GestureDetector(
                        onTap: () {
                          Provider.of<SearchService>(context, listen: false)
                              .clearAllFilter();
                          Navigator.pop(context);
                        },
                        child: Text(
                          "CLEAR FILTERS",
                          style: AppFonts.w500p215,
                        ),
                      )
                    ],
                  )),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width / 2.5,
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
                                  print(selectedIndex);
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
                  Container(
                      padding: const EdgeInsets.all(0),
                      child: filterWidgets[selectedIndex])
                ],
              )
            ],
          ),
        ));
  }
}
