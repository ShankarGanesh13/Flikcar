import 'package:flikcar/models/auction_car_model.dart';
import 'package:flikcar/screens/dealers_flow/auction_screens/dealer_car_list_screen/widget/timer_text.dart';
import 'package:flikcar/screens/dealers_flow/auction_screens/dealer_car_list_screen/widget/upcoming_timer_text.dart';
import 'package:flikcar/services/auction_services.dart';
import 'package:flikcar/utils/colors.dart';
import 'package:flikcar/utils/fonts.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DealerCarDetails extends StatefulWidget {
  final AuctionCar car;
  DealerCarDetails({super.key, required this.car});
  static List<String> icondata = [
    "assets/car_details_icon/location.png",
    "assets/car_details_icon/speedometer.png",
    "assets/car_details_icon/owner.png",
    "assets/car_details_icon/fuel_type.png",
    "assets/car_details_icon/engine.png",
    "assets/car_details_icon/transmisson.png"
  ];

  @override
  State<DealerCarDetails> createState() => _DealerCarDetailsState();
}

class _DealerCarDetailsState extends State<DealerCarDetails> {
  List<String> data = [];
  @override
  void initState() {
    // Provider.of<AuctionService>(context, listen: false)
    //     .getCurrentBidPrice(currentBid = widget.car.currentBidPrice);
    // TODO: implement initState
    super.initState();
  }

  String currentBid = "0";
  @override
  Widget build(BuildContext context) {
    currentBid = context.watch<AuctionService>().currentbidPrice;
    data = [
      "City: Kolkata",
      "Km Driven: ${widget.car.driveKms}",
      "Owners: ${widget.car.ownertype}",
      "Fuel Type: ${widget.car.fuel}",
      "Engine: ${widget.car.engine}cc",
      "Transmission: ${widget.car.transmission}"
    ];
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Current Bid\n${widget.car.currentBidPrice} ₹",
                style: AppFonts.w700black20,
              ),
              const Spacer(),
              Text(
                "Inspection Score:",
                style: AppFonts.w500black14,
              ),
              const SizedBox(width: 8),
              const Icon(Icons.star),
              const SizedBox(width: 3),
              Text(
                "9",
                style: AppFonts.w700black20,
              )
            ],
          ),
          const SizedBox(height: 10),
          TimerText2(
            car: widget.car,
            text: "Auction ends in :",
          ),
          const SizedBox(height: 10),
          widget.car.lastBid != null
              ? Text(
                  "Last bid placed by ${widget.car.lastBid!.dealerName}",
                  style: AppFonts.w500green14,
                )
              : Text(
                  "No bids placed",
                  style: AppFonts.w500green14,
                ),
          const SizedBox(height: 10),
          Text(
            " Base Price ${widget.car.carPrice} ₹",
            style: AppFonts.w500black14,
          ),
          const SizedBox(height: 20),
          Align(
            alignment: Alignment.topLeft,
            child: Wrap(
              runAlignment: WrapAlignment.spaceEvenly,
              alignment: WrapAlignment.spaceEvenly,
              spacing: 15,
              runSpacing: 15,
              crossAxisAlignment: WrapCrossAlignment.start,
              children: List.generate(
                  6,
                  (index) => SizedBox(
                        width: MediaQuery.of(context).size.width / 2.35,
                        child: Row(
                          children: [
                            Container(
                                padding: const EdgeInsets.all(5),
                                margin: const EdgeInsets.only(left: 5),
                                height: 26,
                                width: 30,
                                decoration: BoxDecoration(
                                  color: AppColors.p2,
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(5),
                                    bottomLeft: Radius.circular(5),
                                  ),
                                ),
                                child: Image.asset(
                                  DealerCarDetails.icondata[index],
                                )),
                            const SizedBox(
                              width: 6,
                            ),
                            Text(
                              data[index],
                              style: AppFonts.w500black10,
                            )
                          ],
                        ),
                      )),
            ),
          )
        ],
      ),
    );
  }
}
