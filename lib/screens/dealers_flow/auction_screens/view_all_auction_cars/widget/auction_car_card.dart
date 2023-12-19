import 'dart:async';

import 'package:favorite_button/favorite_button.dart';
import 'package:flikcar/common_widgets/loading_widget.dart';
import 'package:flikcar/common_widgets/primary_button.dart';
import 'package:flikcar/firebase_models/firebase_auction.dart';
import 'package:flikcar/firebase_models/firebase_auction_car_details.dart';
import 'package:flikcar/screens/dealers_flow/auction_screens/view_all_auction_cars/widget/ongoing_timer.dart';
import 'package:flikcar/screens/dealers_flow/auction_screens/view_all_auction_cars/widget/upcoming_timer.dart';
import 'package:flikcar/screens/dealers_flow/auction_screens/firebase_auction_car_detail_screen/firebase_auction_car_detail_screen.dart';
import 'package:flikcar/services/firebase_auction_service/firebase_auction_service.dart';
import 'package:flikcar/utils/fonts.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class AuctionCarCard extends StatelessWidget {
  final FirebaseAuction car;
  const AuctionCarCard({super.key, required this.car});
  static List<String> features = ["Petrol", "13000kms", "2014", "Manual"];

  @override
  Widget build(BuildContext context) {
    features = [
      car.carDetails.fuelType,
      "${car.carDetails.kmsDriven}kms",
      car.carDetails.registrationYear.toString(),
      car.carDetails.transmission,
      car.carDetails.ownerType
    ];
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => FirebaseAuctionCarDetailScreen(
                      carId: car.id,
                    )));

        // Provider.of<AuctionService>(context, listen: false).joinAuctionRoom(
        //     carId: car.id.toString(), car: car, context: context);
      },
      child: Container(
        height: 375,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.only(bottom: 8),
        margin: const EdgeInsets.only(right: 15, bottom: 30, top: 5, left: 15),
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.25),
              offset: Offset(1, 1),
              blurRadius: 12,
              spreadRadius: 0,
            ),
          ],
          color: const Color(0xffF2F2F2),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 191,
                child: Image.network(
                  car.carDetails.imagePath.isNotEmpty
                      //? 'https://webservice.flikcar.com/public/${car.carDetails.imagePath}'
                      ? car.carDetails.imagePath
                      : "https://developers.google.com/static/maps/documentation/maps-static/images/error-image-generic.png",
                  fit: BoxFit.contain,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) {
                      return child;
                    } else {
                      return const LoadingWidget();
                    }
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15, right: 15, top: 15, bottom: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 23,
                    child: Row(
                      children: [
                        Text(car.carDetails.brand, style: AppFonts.w500dark214),
                        // const Spacer(),
                        // FavoriteButton(
                        //     iconColor: const Color(0xffE0E0E0),
                        //     iconDisabledColor: const Color(0xffE0E0E0),
                        //     iconSize: 24,
                        //     valueChanged: () {})
                      ],
                    ),
                  ),
                  const SizedBox(height: 4),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 1.2,
                    child: Text(
                      "${car.carDetails.model} ${car.carDetails.variant}",
                      style: AppFonts.w700s116,
                      maxLines: 1,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Wrap(
                    spacing: 6,
                    runSpacing: 0,
                    children: List.generate(
                      5,
                      (index) => Container(
                        padding: const EdgeInsets.only(
                            left: 0, right: 3, top: 5, bottom: 0),
                        decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(20)),
                        child: Text(
                          features[index],
                          style: AppFonts.w500black12,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    car.bid == null
                        ? "Current Bid ${formatPrice(car.startPrice)}"
                        : "Current Bid ${formatPrice(car.bid!.price)}",
                    style: AppFonts.w700black20,
                  ),
                  // const SizedBox(height: 5),
                  // Text(
                  //   "Base price ₹${car.carPrice}",
                  //   style: AppFonts.w500black14,
                  // ),
                ],
              ),
            ),
            const SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 15),
              child: Row(
                children: [
                  checkLiveNew(),
                  const Spacer(),
                  SizedBox(
                    width: 122,
                    height: 40,
                    child: PrimaryButton(
                      title: "Place Bid",
                      function: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    FirebaseAuctionCarDetailScreen(
                                      carId: car.id,
                                    )));

                        // Provider.of<AuctionService>(context, listen: false)
                        //     .joinAuctionRoom(
                        //         carId: car.id.toString(),
                        //         car: car,
                        //         context: context);
                      },
                      borderColor: Colors.black,
                      textStyle: AppFonts.w500black14,
                      backgroundColor: Colors.white,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget checkLiveNew() {
    DateTime now = DateTime.now();
    DateTime startTime = DateTime.fromMillisecondsSinceEpoch(car.startTime);
    DateTime endTime = DateTime.fromMillisecondsSinceEpoch(car.endTime);
    // print("***********startTime$startTime");
    // print("*****************endtime$endTime");
    // print("****************now$now");

    if (endTime.isBefore(now)) {
      // Auction has ended
      debugPrint("auction ended");
      return Text(
        "Auction has ended",
        style: AppFonts.w500red14,
      );
    } else if (startTime.isBefore(now) && endTime.isAfter(now)) {
      // Auction is ongoing
      debugPrint("ongoing");
      return OngoingTimer(
        endTime: endTime,
        startTime: startTime,
      );
    } else {
      debugPrint("upcoming");
      // Auction is upcoming
      return UpcomingTimer(
        startTime: startTime,
        endTime: endTime,
      );
    }
  }

  String formatPrice(int price) {
    final currencyFormatter = NumberFormat.currency(
      locale: 'en_IN',
      symbol: '₹',
      decimalDigits: 0,
    );
    return currencyFormatter.format(price);
  }
}
// I/flutter ( 6247): ***********startTime     2023-11-30 10:28:26.079
// I/flutter ( 6247): *****************endtime 2023-12-02 10:28:26.079
// I/flutter ( 6247): ****************now      2023-11-30 10:40:44.502479