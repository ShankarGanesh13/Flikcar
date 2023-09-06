import 'dart:async';

import 'package:favorite_button/favorite_button.dart';
import 'package:flikcar/common_widgets/loading_widget.dart';
import 'package:flikcar/common_widgets/primary_button.dart';
import 'package:flikcar/models/auction_car_model.dart';
import 'package:flikcar/screens/dealers_flow/auction_screens/dealer_car_detail_screen/dealer_car_detail_screen.dart';
import 'package:flikcar/screens/dealers_flow/auction_screens/dealer_car_list_screen/widget/ongoing_timer.dart';
import 'package:flikcar/screens/dealers_flow/auction_screens/dealer_car_list_screen/widget/timer_text.dart';
import 'package:flikcar/screens/dealers_flow/auction_screens/dealer_car_list_screen/widget/upcoming_timer.dart';
import 'package:flikcar/services/auction_services.dart';
import 'package:flikcar/utils/fonts.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DealerCarListCard extends StatelessWidget {
  final AuctionCar car;
  const DealerCarListCard({super.key, required this.car});
  static List<String> features = ["Petrol", "13000kms", "2014", "Manual"];

  @override
  Widget build(BuildContext context) {
    features = [
      car.fuel,
      "${car.driveKms}kms",
      car.registrationYear,
      car.transmission,
      car.ownertype
    ];
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DealerCarDetailScreen(
                      carr: car,
                    )));

        Provider.of<AuctionService>(context, listen: false).joinAuctionRoom(
            carId: car.id.toString(), car: car, context: context);
      },
      child: Container(
        height: 390,
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
                  car.carImages.isNotEmpty
                      ? 'https://webservice.flikcar.com:8000/public/${car.carImages[0].imageUrl}'
                      : "https://developers.google.com/static/maps/documentation/maps-static/images/error-image-generic.png",
                  fit: BoxFit.cover,
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
                        Text(car.brand, style: AppFonts.w500dark214),
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
                      "${car.model} ${car.variant}",
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
                    car.currentBidPrice == "no data"
                        ? "Curreny Bid ₹${car.carPrice}"
                        : "Current Bid ₹${car.currentBidPrice}",
                    style: AppFonts.w700black20,
                  ),
                  const SizedBox(height: 5),
                  Text(
                    "Base price ₹${car.carPrice}",
                    style: AppFonts.w500black14,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 15),
              child: Row(
                children: [
                  checkTime(),
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
                                    DealerCarDetailScreen(carr: car)));
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

  Widget checkTime() {
    if (DateTime.parse(car.endAuction).isBefore(DateTime.now())) {
      return Text(
        "Auction has ended",
        style: AppFonts.w500red14,
      );
    } else {
      return checkLive();
    }
  }

  Widget checkLive() {
    DateTime now = DateTime.now();
    if (DateTime.parse(car.endAuction).isAfter(now) &&
        DateTime.parse(car.startAuction).isBefore(now)) {
      return OngoingTimer(
        car: car,
      );
    } else {
      return UpcomingTimer(
        car: car,
      );
    }
  }
}
