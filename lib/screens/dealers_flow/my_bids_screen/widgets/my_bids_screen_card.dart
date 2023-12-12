import 'dart:async';

import 'package:favorite_button/favorite_button.dart';
import 'package:flikcar/common_widgets/loading_widget.dart';
import 'package:flikcar/common_widgets/primary_button.dart';
import 'package:flikcar/firebase_models/firebase_auction.dart';
import 'package:flikcar/firebase_models/firebase_my_bids.dart';
import 'package:flikcar/models/auction_car_model.dart';
import 'package:flikcar/screens/dealers_flow/auction_screens/dealer_car_list_screen/widget/ongoing_timer.dart';
import 'package:flikcar/screens/dealers_flow/auction_screens/dealer_car_list_screen/widget/timer_text.dart';
import 'package:flikcar/screens/dealers_flow/auction_screens/firebase_auction_car_detail_screen/firebase_auction_car_detail_screen.dart';
import 'package:flikcar/services/auction_services.dart';
import 'package:flikcar/services/firebase_auction_service/firebase_auction_service.dart';
import 'package:flikcar/utils/fonts.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class MyBidsScreenCard extends StatelessWidget {
  final FirebaseAuction car;
  const MyBidsScreenCard({super.key, required this.car});
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
        // Navigator.push(
        //     context,
        //     MaterialPageRoute(
        //         builder: (context) => DealerCarDetailScreen(
        //               car: car,
        //             )));

        // Provider.of<AuctionService>(context, listen: false).joinAuctionRoom(
        //     carId: car.id.toString(), car: car, context: context);
      },
      child: Container(
        height: 380,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.only(bottom: 8),
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
                height: 181,
                child: Image.network(
                  car.carDetails.imagePath,
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
                  top: 10.0, left: 15, right: 15, bottom: 10),
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
                  const SizedBox(height: 3),
                  Text(
                    "${car.carDetails.model} ${car.carDetails.variant}",
                    style: AppFonts.w700s116,
                    maxLines: 1,
                  ),
                  const SizedBox(height: 4),
                  Wrap(
                    spacing: 4,
                    children: List.generate(
                      5,
                      (index) => Container(
                        padding: const EdgeInsets.only(
                            left: 0, right: 5, top: 5, bottom: 0),
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
                    car.bid != null
                        ? "Current Bid ₹${formatPrice(car.bid!.price)}"
                        : "Current Bid ₹${formatPrice(car.startPrice)}",
                    style: AppFonts.w700black20,
                  ),
                  //  checkAuctionEnded(),
                  // const SizedBox(height: 4),
                  // Text(
                  //   "Base price ₹${car.carPrice}",
                  //   style: AppFonts.w500black14,
                  // ),
                  const SizedBox(height: 4),
                  StreamBuilder<FirebaseMyBids>(
                      stream:
                          FirebaseAuctionService().getMyBidPrice(carId: car.id),
                      builder: (context, snapshot) {
                        if (snapshot.data != null) {
                          return Text(
                            "Your last bid price ₹${formatPrice(snapshot.data!.price)}",
                            style: AppFonts.w500green14,
                          );
                        } else {
                          return Text(
                            "Your last bid price ₹ ",
                            style: AppFonts.w500green14,
                          );
                        }
                      }),
                ],
              ),
            ),
            const SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 15),
              child: Row(
                children: [
                  OngoingTimer(
                      startTime:
                          DateTime.fromMillisecondsSinceEpoch(car.startTime),
                      endTime:
                          DateTime.fromMillisecondsSinceEpoch(car.endTime)),
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
                                        carId: car.id)));

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

  String formatPrice(int price) {
    final currencyFormatter =
        NumberFormat.currency(locale: 'en_IN', symbol: '', decimalDigits: 0);
    return currencyFormatter.format(price);
  }
}
