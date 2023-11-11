import 'package:flikcar/models/auction_car_model.dart';
import 'package:flikcar/services/auction_services.dart';
import 'package:flikcar/utils/fonts.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CurrentBidWidget extends StatefulWidget {
  final AuctionCar car;
  const CurrentBidWidget({super.key, required this.car});

  @override
  State<CurrentBidWidget> createState() => _CurrentBidWidgetState();
}

class _CurrentBidWidgetState extends State<CurrentBidWidget> {
  String? currentbidPrice = "";

  @override
  Widget build(BuildContext context) {
    currentbidPrice = context.watch<AuctionService>().currentbidPrice;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        checkAuctionEnded(context),
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
          "${widget.car.technicianRating} / 5",
          style: AppFonts.w700black16,
        )
      ],
    );
  }

  Widget checkAuctionEnded(BuildContext context) {
    if (DateTime.parse(widget.car.endAuction).isBefore(DateTime.now())) {
      return Text(
        "Final Bid\n₹${widget.car.currentBidPrice}",
        style: AppFonts.w700black20,
      );
    } else {
      return Text(
        currentbidPrice == ""
            ? "Curreny Bid\n₹${widget.car.carPrice}"
            : "Current Bid\n₹${currentbidPrice}",
        style: AppFonts.w700black20,
      );
    }
  }
}
