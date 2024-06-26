import 'package:flikcar/common_widgets/custom_appbar.dart';
import 'package:flikcar/common_widgets/primary_button.dart';
import 'package:flikcar/screens/dealers_flow/dealer_flow.dart';
import 'package:flikcar/screens/dealers_flow/dealer_sell_car_screen/dealer_listing_screen/listing_car_features/widgets/car_comfort.dart';
import 'package:flikcar/screens/dealers_flow/dealer_sell_car_screen/dealer_listing_screen/listing_car_features/widgets/car_entertainment.dart';
import 'package:flikcar/screens/dealers_flow/dealer_sell_car_screen/dealer_listing_screen/listing_car_features/widgets/car_exterior.dart';
import 'package:flikcar/screens/dealers_flow/dealer_sell_car_screen/dealer_listing_screen/listing_car_features/widgets/car_interior.dart';
import 'package:flikcar/screens/dealers_flow/dealer_sell_car_screen/dealer_listing_screen/listing_car_features/widgets/car_safety.dart';
import 'package:flikcar/screens/dealers_flow/dealer_sell_car_screen/dealer_listing_screen/listing_car_features/widgets/upload_button.dart';
import 'package:flikcar/screens/dealers_flow/dealer_sell_car_screen/dealer_listing_screen/listing_car_images/listing_car_images.dart';
import 'package:flikcar/services/dealer_upload_car.dart';
import 'package:flikcar/utils/colors.dart';
import 'package:flikcar/utils/fonts.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../listing_car_specification/widgets/dimension_capacity.dart';

class ListingCarFatures extends StatefulWidget {
  const ListingCarFatures({super.key});

  @override
  State<ListingCarFatures> createState() => _ListingCarFaturesState();
}

class _ListingCarFaturesState extends State<ListingCarFatures> {
  @override
  void initState() {
    // TODO: implement initState
    Provider.of<DealerUploadCar>(context, listen: false).getComfortFeatures();
    Provider.of<DealerUploadCar>(context, listen: false).getinteriorFeatures();
    Provider.of<DealerUploadCar>(context, listen: false).getExteriorFeatures();
    Provider.of<DealerUploadCar>(context, listen: false)
        .getEntertainmentFeatures();
    Provider.of<DealerUploadCar>(context, listen: false).getSafetyFeatures();
    super.initState();
  }

  static List<String> filter = [
    "Comfort",
    "Safety",
    "Interior",
    "Exterior",
    "Entertainment\n & \ncommunication"
  ];

  static List<Widget> filterWidgets = [
    const CarComfort(),
    const CarSafety(),
    const CarInterior(),
    const CarExterior(),
    const CarEntertainment(),
  ];
  @override
  Widget build(BuildContext context) {
    int selectedIndex = context.watch<DealerUploadCar>().featuresIndex;
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
              padding: const EdgeInsets.only(
                  left: 15, right: 15, bottom: 10, top: 8),
              decoration: const BoxDecoration(color: Colors.white, boxShadow: [
                BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, 0.25),
                  offset: Offset(0, -10),
                  blurRadius: 18,
                )
              ]),
              child: UploadButton(
                selectedIndex: selectedIndex,
              )

              //  PrimaryButton(
              //     backgroundColor: AppColors.s1,
              //     borderColor: Colors.transparent,
              //     function: () {
              //       if (selectedIndex < 4) {
              //         Provider.of<DealerUploadCar>(context, listen: false)
              //             .increaseFeatureIndex();
              //       } else {
              //         Provider.of<DealerUploadCar>(context, listen: false)
              //             .uploadCar(context);
              //         // Navigator.push(
              //         //     context,
              //         //     MaterialPageRoute(
              //         //       builder: (context) => const ListingCarImages(),
              //         //     ));
              //       }
              //     },
              //     textStyle: AppFonts.w500white14,
              //     title: selectedIndex < 4 ? "Next" : "Upload Car"),
              ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  height: 50,
                  padding: const EdgeInsets.all(15),
                  width: MediaQuery.of(context).size.width,
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
                        "Car Features",
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
                            itemCount: filter.length,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  Provider.of<DealerUploadCar>(context,
                                          listen: false)
                                      .changeFeatureIndex(index);
                                  print(selectedIndex);
                                },
                                child: Container(
                                  height: 60,
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
                                      filter[index],
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
                    child: filterWidgets[selectedIndex],
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
