import 'package:flikcar/common_widgets/custom_appbar.dart';
import 'package:flikcar/models/auction_car_model.dart';
import 'package:flikcar/models/buyer_car_model.dart';
import 'package:flikcar/screens/dealers_flow/auction_screens/dealer_car_detail_screen/car_specifications/widgets/dimension_capacity.dart';
import 'package:flikcar/screens/dealers_flow/auction_screens/dealer_car_detail_screen/car_specifications/widgets/engine_transmisson_specification.dart';
import 'package:flikcar/screens/dealers_flow/auction_screens/dealer_car_detail_screen/car_specifications/widgets/fuel_performance_specification.dart';
import 'package:flikcar/screens/dealers_flow/auction_screens/dealer_car_detail_screen/car_specifications/widgets/suspension_brake_specification.dart';

import 'package:flikcar/screens/dealers_flow/dealer_sell_car_screen/dealer_listing_screen/listing_car_specification/widgets/dimension_capacity.dart';
import 'package:flikcar/utils/colors.dart';
import 'package:flikcar/utils/fonts.dart';
import 'package:flutter/material.dart';

class DealerCarSpecificationScreen extends StatefulWidget {
  final AuctionCar car;
  const DealerCarSpecificationScreen({super.key, required this.car});

  @override
  State<DealerCarSpecificationScreen> createState() =>
      _DealerCarSpecificationScreenState();
}

class _DealerCarSpecificationScreenState
    extends State<DealerCarSpecificationScreen> {
  int selectedIndex = 0;
  List<String> specifications = [
    "Dimensions \n& capacity",
    "Engine & \ntransmission",
    "Fuel & \nperformance",
    "Suspension,\nsteering\n& brakes"
  ];

  @override
  Widget build(BuildContext context) {
    List<Widget> specificationsWidgets = [
      DimensionCapacitySpecification(
        car: widget.car,
      ),
      EngineTransmissonSpecification(
        car: widget.car,
      ),
      FuelPerformanceSpecification(
        car: widget.car,
      ),
      SuspensionBrakeSpecification(
        car: widget.car,
      )
    ];
    return Scaffold(
        appBar: CustomAppBar.getAppBar(),
        body: Column(children: [
          Container(
            height: 50,
            color: const Color.fromARGB(255, 227, 255, 228),
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.all(16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.chevron_left,
                    size: 20,
                    color: AppColors.p2,
                  ),
                ),
                const SizedBox(
                  width: 4,
                ),
                Text(
                  "Car Specification",
                  style: AppFonts.w700black16,
                ),
              ],
            ),
          ),
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
                        itemCount: specifications.length,
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
                                  specifications[index],
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
                height: MediaQuery.of(context).size.height / 1.3,
                padding: const EdgeInsets.all(12),
                child: specificationsWidgets[selectedIndex],
              )
            ],
          )
        ]));
  }
}
