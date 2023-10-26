import 'package:flikcar/common_widgets/custom_appbar.dart';
import 'package:flikcar/common_widgets/primary_button.dart';
import 'package:flikcar/models/auction_car_model.dart';
import 'package:flikcar/screens/buy_car_flow/car_detailed_view/widgets/nav_button.dart';
import 'package:flikcar/screens/dealers_flow/auction_screens/dealer_car_detail_screen/car_specifications/car_specifications.dart';
import 'package:flikcar/screens/dealers_flow/auction_screens/dealer_car_detail_screen/widgets/dealer_car_details.dart';
import 'package:flikcar/screens/dealers_flow/auction_screens/dealer_car_detail_screen/widgets/dealer_car_features.dart';
import 'package:flikcar/screens/dealers_flow/auction_screens/dealer_car_detail_screen/widgets/dealer_car_specification.dart';
import 'package:flikcar/screens/dealers_flow/auction_screens/dealer_car_detail_screen/widgets/dealer_image_viewer.dart';
import 'package:flikcar/screens/dealers_flow/auction_screens/dealer_car_detail_screen/widgets/inspection_report.dart';
import 'package:flikcar/screens/dealers_flow/auction_screens/dealer_car_list_screen/dealer_car_list_screen.dart';
import 'package:flikcar/screens/dealers_flow/dealer_flow.dart';
import 'package:flikcar/services/auction_services.dart';
import 'package:flikcar/utils/colors.dart';
import 'package:flikcar/utils/fonts.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DealerCarDetailScreen extends StatefulWidget {
  final AuctionCar car;
  const DealerCarDetailScreen({super.key, required this.car});

  @override
  State<DealerCarDetailScreen> createState() => _DealerCarDetailScreenState();
}

class _DealerCarDetailScreenState extends State<DealerCarDetailScreen> {
  // AuctionCar? updatedCar;

  @override
  Widget build(BuildContext context) {
    //   updatedCar = context.watch<AuctionService>().updatedCarData;
    // currentBid = context.watch<AuctionService>().bidAmount;

    return Scaffold(
        appBar: CustomAppBar.getAppBarWithContainerSearch(
            function2: () {
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
            context: context,
            function: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const DealerCarListScreen(),
                  ));
            },
            back: true),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                  padding: const EdgeInsets.all(12),
                  width: MediaQuery.of(context).size.width,
                  // color: const Color.fromARGB(255, 240, 255, 249),
                  decoration: BoxDecoration(gradient: AppColors.gradient),
                  child: Row(
                    children: [
                      const SizedBox(width: 10),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 1.2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.car.brand,
                              style: AppFonts.w500dark214,
                            ),
                            Text(
                              "${widget.car.model} ${widget.car.variant}",
                              style: AppFonts.w700black16,
                              maxLines: 1,
                            ),
                          ],
                        ),
                      ),
                      // const Spacer(),
                      // const Icon(Icons.share),
                      // const SizedBox(
                      //   width: 12,
                      // ),
                      // const Icon(Icons.flag),
                    ],
                  )),
              DealerImageViewer(
                car: widget.car,
              ),
              DealerCarDetails(
                car: widget.car,
              ),
              // const SizedBox(
              //   height: 10,
              // ),
              // DealerAuctionDetails(
              //   car: car ?? widget.car,
              // ),
              InspectionReport(car: widget.car),

              const SizedBox(
                height: 10,
              ),
              DealerCarFeatures(
                car: widget.car,
              ),
              const SizedBox(
                height: 15,
              ),
              DealerCarSpecification(
                car: widget.car,
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: PrimaryButton(
                    title: "View all specifications",
                    function: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  DealerCarSpecificationScreen(
                                    car: widget.car,
                                  )));
                    },
                    borderColor: Colors.white,
                    backgroundColor: AppColors.p2,
                    textStyle: AppFonts.w500white14),
              ),
              const SizedBox(
                height: 25,
              ),
              // const DealerCarCard(
              //   filters: [],
              //   title: "Auctions ending soon",
              //   filterButton: false,
              // ),
              // const SizedBox(
              //   height: 30,
              // ),
            ],
          ),
        ));
  }

  Widget bidButton({required IconData icon, required Function() function}) {
    return GestureDetector(
      onTap: function,
      child: Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
            color: const Color(0xffffffff),
            borderRadius: BorderRadius.circular(4)),
        child: Icon(
          icon,
          size: 24,
          weight: 900,
          color: const Color(0xff606060),
        ),
      ),
    );
  }
}
