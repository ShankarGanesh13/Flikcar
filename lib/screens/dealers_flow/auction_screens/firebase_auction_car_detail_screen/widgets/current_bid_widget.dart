import 'package:flikcar/common_widgets/loading_screen.dart';
import 'package:flikcar/common_widgets/loading_widget.dart';
import 'package:flikcar/firebase_models/firebase_auction.dart';
import 'package:flikcar/firebase_models/firebase_car_details.dart';
import 'package:flikcar/models/auction_car_model.dart';
import 'package:flikcar/screens/buy_car_flow/car_detailed_view/widgets/nav_button.dart';
import 'package:flikcar/screens/dealers_flow/auction_screens/firebase_auction_car_detail_screen/widgets/bid_textfield.dart';
import 'package:flikcar/services/auction_services.dart';
import 'package:flikcar/services/firebase_auction_service/firebase_auction_service.dart';
import 'package:flikcar/utils/colors.dart';
import 'package:flikcar/utils/fonts.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class FirebaseCurrentBidWidget extends StatefulWidget {
  final FirebaseCarDetails car;
  FirebaseCurrentBidWidget({super.key, required this.car});

  @override
  State<FirebaseCurrentBidWidget> createState() =>
      _FirebaseCurrentBidWidgetState();
}

class _FirebaseCurrentBidWidgetState extends State<FirebaseCurrentBidWidget> {
  final String? currentbidPrice = "";

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        StreamBuilder<FirebaseAuction>(
            stream:
                FirebaseAuctionService().getAuctionCarByIdStream(carId: "1"),
            builder: (context, snapshot) {
              // print("getAuctionCarByIdStream stream builder");
              if (snapshot.data != null) {
                return Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        checkAuctionEnded(
                            context: context, auction: snapshot.data!),
                        const Spacer(),
                        Text(
                          "Inspection Score:",
                          style: AppFonts.w500black14,
                        ),
                        const SizedBox(width: 8),
                        const Icon(
                          Icons.star,
                          size: 20,
                        ),
                        const SizedBox(width: 3),
                        Text(
                          "${widget.car.properties.inspectionScore} / 5",
                          style: AppFonts.w700black16,
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    FirebaseBidTextField(
                      car: snapshot.data!,
                    ),
                  ],
                );
              } else {
                return const LoadingWidget();
              }
            }),
      ],
    );
  }

  Widget checkAuctionEnded(
      {required BuildContext context, required FirebaseAuction auction}) {
    if (DateTime.fromMillisecondsSinceEpoch(auction.endTime)
        .isBefore(DateTime.now())) {
      return Text(
        "Final Bid\n₹${auction.bid!.price}",
        style: AppFonts.w700black20,
      );
    } else {
      return Text(
        "Curreny Bid\n${formatPrice(auction.bid!.price)}",
        // auction.bid.price == null
        //     ? "Curreny Bid\n₹${auction.bid!.price}"
        //     : "Current Bid\n₹${currentbidPrice}",
        style: AppFonts.w700black20,
      );
    }
  }

  String formatPrice(int price) {
    final currencyFormatter = NumberFormat.currency(
      locale: 'en_IN',
      symbol: '₹ ',
      decimalDigits: 0,
    );
    return currencyFormatter.format(price);
  }
}
