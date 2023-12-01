import 'package:flikcar/common_widgets/custom_appbar.dart';
import 'package:flikcar/common_widgets/error_screen.dart';
import 'package:flikcar/common_widgets/loading_screen.dart';
import 'package:flikcar/firebase_models/firebase_car_details.dart';
import 'package:flikcar/screens/dealers_flow/auction_screens/dealer_car_list_screen/dealer_car_list_screen.dart';
import 'package:flikcar/screens/dealers_flow/auction_screens/firebase_auction_car_detail_screen/widgets/bid_textfield.dart';
import 'package:flikcar/screens/dealers_flow/auction_screens/firebase_auction_car_detail_screen/widgets/current_bid_widget.dart';
import 'package:flikcar/screens/dealers_flow/auction_screens/firebase_auction_car_detail_screen/widgets/dealer_car_details.dart';
import 'package:flikcar/screens/dealers_flow/auction_screens/firebase_auction_car_detail_screen/widgets/dealer_car_features.dart';
import 'package:flikcar/screens/dealers_flow/auction_screens/firebase_auction_car_detail_screen/widgets/dealer_car_specification.dart';
import 'package:flikcar/screens/dealers_flow/auction_screens/firebase_auction_car_detail_screen/widgets/dealer_image_viewer.dart';
import 'package:flikcar/screens/dealers_flow/auction_screens/firebase_auction_car_detail_screen/widgets/inspection_report.dart';
import 'package:flikcar/screens/dealers_flow/dealer_flow.dart';
import 'package:flikcar/services/firebase_auction_service/firebase_auction_service.dart';
import 'package:flikcar/utils/colors.dart';
import 'package:flikcar/utils/fonts.dart';
import 'package:flutter/material.dart';

class FirebaseAuctionCarDetailScreen extends StatefulWidget {
  final String carId;
  const FirebaseAuctionCarDetailScreen({super.key, required this.carId});

  @override
  State<FirebaseAuctionCarDetailScreen> createState() =>
      _FirebaseAuctionCarDetailScreenState();
}

class _FirebaseAuctionCarDetailScreenState
    extends State<FirebaseAuctionCarDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<FirebaseCarDetails?>(
        future:
            FirebaseAuctionService().getAuctionCarDetails(carId: widget.carId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const LoadingScreen();
          }
          if (snapshot.data != null) {
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
                          decoration:
                              BoxDecoration(gradient: AppColors.gradient),
                          child: Row(
                            children: [
                              const SizedBox(width: 10),
                              SizedBox(
                                width: MediaQuery.of(context).size.width / 1.2,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      snapshot.data!.properties.brand,
                                      style: AppFonts.w500dark214,
                                    ),
                                    Text(
                                      "${snapshot.data!.properties.model} ${snapshot.data!.properties.variant}",
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
                      FirebaseDealerImageViewer(
                        carImages: snapshot.data!.imageModel,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: FirebaseCurrentBidWidget(
                          car: snapshot.data!,
                        ),
                      ),

                      FirebaseDealerCarDetails(
                        car: snapshot.data!,
                      ),

                      FirebaseInspectionReport(car: snapshot.data!),

                      const SizedBox(
                        height: 10,
                      ),
                      FirebaseDealerCarFeatures(
                        car: snapshot.data!,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      FirebaseDealerCarSpecification(
                        car: snapshot.data!,
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
          } else {
            return const ErrorScreen();
          }
        });
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
          color: Color(0xff606060),
        ),
      ),
    );
  }
}
