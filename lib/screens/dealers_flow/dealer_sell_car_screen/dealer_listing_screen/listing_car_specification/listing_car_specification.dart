import 'package:flikcar/common_widgets/snackbar.dart';
import 'package:flikcar/screens/dealers_flow/dealer_flow.dart';
import 'package:flikcar/screens/dealers_flow/dealer_sell_car_screen/dealer_listing_screen/listing_car_features/listing_car_features.dart';
import 'package:flikcar/screens/dealers_flow/dealer_sell_car_screen/dealer_listing_screen/listing_car_specification/widgets/dimension_capacity.dart';
import 'package:flikcar/screens/dealers_flow/dealer_sell_car_screen/dealer_listing_screen/listing_car_specification/widgets/engine_transmisson.dart';
import 'package:flikcar/screens/dealers_flow/dealer_sell_car_screen/dealer_listing_screen/listing_car_specification/widgets/fuel_performance.dart';
import 'package:flikcar/screens/dealers_flow/dealer_sell_car_screen/dealer_listing_screen/listing_car_specification/widgets/suspension_braking.dart';
import 'package:flutter/material.dart';

import 'package:flikcar/common_widgets/custom_appbar.dart';
import 'package:flikcar/common_widgets/primary_button.dart';
import 'package:flikcar/utils/colors.dart';
import 'package:flikcar/utils/fonts.dart';
import 'package:flutter_xlider/flutter_xlider.dart';

class ListingCarSpecification extends StatefulWidget {
  const ListingCarSpecification({super.key});
  static List<String> filter = [
    "Dimension &\ncapacity",
    "Engine &\ntransmisson",
    "Fuel &\nperformance",
    "Suspension,\nsteering &\nbrakes",
  ];

  @override
  State<ListingCarSpecification> createState() =>
      _ListingCarSpecificationState();
}

class _ListingCarSpecificationState extends State<ListingCarSpecification> {
  int selectedIndex = 0;
  static List<Widget> filterWidgets = [
    DimensionCapacity(),
    EngineTransmisson(),
    FuelPerformance(),
    SuspensionBrakes(),
  ];
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar.getAppBar(
          function: () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => const DealerFlow(
                  index: 0,
                ),
              ),
              (route) => false,
            );
          },
        ),
        bottomNavigationBar: SafeArea(
          child: Container(
            height: 55,
            width: MediaQuery.of(context).size.width,
            padding:
                const EdgeInsets.only(left: 15, right: 15, bottom: 10, top: 8),
            decoration: const BoxDecoration(color: Colors.white, boxShadow: [
              BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.25),
                offset: Offset(0, -10),
                blurRadius: 18,
              )
            ]),
            child: PrimaryButton(
                backgroundColor: AppColors.s1,
                borderColor: Colors.transparent,
                function: () {
                  if (selectedIndex < 3) {
                    selectedIndex++;
                  } else {
                    if (_formKey.currentState!.validate()) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ListingCarFatures(),
                          ));
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                          MySnackbar.showSnackBar(context,
                              "Please ensure you enter all the required* data in all four sections"));
                    }
                  }
                  setState(() {});
                },
                textStyle: AppFonts.w500white14,
                title: "Next"),
          ),
        ),
        body: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                    height: 52,
                    padding: const EdgeInsets.all(15),
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(gradient: AppColors.gradient),
                    child: Row(
                      children: [
                        GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child:
                                Icon(Icons.chevron_left, color: AppColors.p2)),
                        const SizedBox(width: 8),
                        Text(
                          "Car Specification",
                          style: AppFonts.w700black16,
                        ),
                      ],
                    )),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width / 2.9,
                      // height: MediaQuery.of(context).size.height / 1.4,
                      color: const Color(0xffE0E0E0),
                      child: Column(
                        children: [
                          ListView.builder(
                              itemCount: ListingCarSpecification.filter.length,
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
                                    height: 67,
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
                                        ListingCarSpecification.filter[index],
                                        style: selectedIndex == index
                                            ? AppFonts.w700p214
                                            : AppFonts.w700black14,
                                      )
                                    ]),
                                  ),
                                );
                              }),
                        ],
                      ),
                    ),
                    Container(
                        height: MediaQuery.of(context).size.height / 1.35,
                        padding: const EdgeInsets.all(12),
                        width: MediaQuery.of(context).size.width / 1.6,
                        child: Center(child: filterWidgets[selectedIndex])),
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
