import 'package:flikcar/common_widgets/custom_appbar.dart';
import 'package:flikcar/common_widgets/error_screen.dart';
import 'package:flikcar/common_widgets/loading_screen.dart';
import 'package:flikcar/common_widgets/primary_button.dart';
import 'package:flikcar/firebase_models/firebase_auction_car_details.dart';
import 'package:flikcar/screens/dealers_flow/auction_screens/firebase_auction_car_detail_screen/widgets/dealer_car_details.dart';
import 'package:flikcar/screens/dealers_flow/auction_screens/firebase_auction_car_detail_screen/widgets/dealer_car_features.dart';
import 'package:flikcar/screens/dealers_flow/auction_screens/firebase_auction_car_detail_screen/widgets/dealer_car_image_viewer/dealer_car_image_viewer.dart';
import 'package:flikcar/screens/dealers_flow/auction_screens/firebase_auction_car_detail_screen/widgets/dealer_car_specification.dart';
import 'package:flikcar/screens/dealers_flow/auction_screens/firebase_auction_car_detail_screen/widgets/dealer_image_viewer.dart';
import 'package:flikcar/screens/dealers_flow/auction_screens/firebase_auction_car_detail_screen/widgets/inspection_report.dart';
import 'package:flikcar/screens/dealers_flow/dealer_flow.dart';
import 'package:flikcar/screens/dealers_flow/one_click_buy_screen/one_click_buy_details_screen/widgets/confirm_purchase.dart';
import 'package:flikcar/services/firebase_auction_service/firebase_auction_service.dart';
import 'package:flikcar/utils/colors.dart';
import 'package:flikcar/utils/fonts.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class OneClickBuyDetailScreen extends StatefulWidget {
  final String carId;
  final int carPrice;
  const OneClickBuyDetailScreen(
      {super.key, required this.carId, required this.carPrice});

  @override
  State<OneClickBuyDetailScreen> createState() =>
      _FirebaseAuctionCarDetailScreenState();
}

class _FirebaseAuctionCarDetailScreenState
    extends State<OneClickBuyDetailScreen> {
  @override
  void initState() {
    FirebaseAuctionService.getDealerDetails();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<FirebaseAuctionCarDetails?>(
        future:
            FirebaseAuctionService().getAuctionCarDetails(carId: widget.carId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const LoadingScreen();
          }
          if (snapshot.data != null) {
            return Scaffold(
                appBar: CustomAppBar.getAppBar(function: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const DealerFlow(
                        index: 0,
                      ),
                    ),
                    (route) => false,
                  );
                }),
                bottomNavigationBar: SafeArea(
                  child: Container(
                    color: AppColors.s1,
                    height: 60,
                    padding: const EdgeInsets.only(
                        top: 10, bottom: 10, left: 15, right: 15),
                    child: PrimaryButton(
                        title: "Book Now",
                        function: () {
                          _showModal(context);
                        },
                        borderColor: Colors.transparent,
                        backgroundColor: AppColors.p2,
                        textStyle: AppFonts.w500white14),
                  ),
                ),
                body: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          padding: const EdgeInsets.all(12),
                          width: MediaQuery.of(context).size.width,
                          decoration:
                              BoxDecoration(gradient: AppColors.gradient),
                          child: Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Icon(
                                  Icons.chevron_left,
                                  color: AppColors.p2,
                                ),
                              ),
                              const SizedBox(width: 10),
                              SizedBox(
                                width: MediaQuery.of(context).size.width / 1.5,
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
                              const Spacer(),
                              // const Icon(Icons.share),
                              // const SizedBox(
                              //   width: 12,
                              // ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              DealerCarImageViewer(
                                                  videos: snapshot.data!.videos,
                                                  images: snapshot
                                                      .data!.imageModel)));
                                },
                                child: Text(
                                  "View All \nImages",
                                  style: AppFonts.w500black12,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          )),
                      FirebaseDealerImageViewer(
                        carImages: snapshot.data!.imageModel,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "One Click Buy Price",
                              style: AppFonts.w700black20,
                            ),
                            const SizedBox(
                              height: 3,
                            ),
                            Text(
                              "₹ ${formatPrice(widget.carPrice)}",
                              style: AppFonts.w700black20,
                            ),
                          ],
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
                        height: 70,
                      ),
                    ],
                  ),
                ));
          } else {
            return const ErrorScreen();
          }
        });
  }

  String formatPrice(int price) {
    final currencyFormatter =
        NumberFormat.currency(locale: 'en_IN', symbol: '', decimalDigits: 0);
    return currencyFormatter.format(price);
  }

  void _showModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        // Build the content of the modal
        return ConfirmPurchase(
          carId: widget.carId,
          carPrice: widget.carPrice,
        );
      },
    );
  }
}
