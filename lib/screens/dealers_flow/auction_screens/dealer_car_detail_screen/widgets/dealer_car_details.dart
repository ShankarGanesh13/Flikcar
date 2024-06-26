import 'package:flikcar/common_widgets/snackbar.dart';
import 'package:flikcar/models/auction_car_model.dart';
import 'package:flikcar/screens/buy_car_flow/car_detailed_view/widgets/nav_button.dart';
import 'package:flikcar/screens/dealers_flow/auction_screens/dealer_car_detail_screen/widgets/bid_textfield.dart';
import 'package:flikcar/screens/dealers_flow/auction_screens/dealer_car_detail_screen/widgets/current_bid_widget.dart';
import 'package:flikcar/screens/dealers_flow/auction_screens/dealer_car_list_screen/widget/ongoing_timer2.dart';
import 'package:flikcar/screens/dealers_flow/auction_screens/dealer_car_list_screen/widget/timer_text.dart';
import 'package:flikcar/screens/dealers_flow/auction_screens/dealer_car_list_screen/widget/upcoming_timer2.dart';
import 'package:flikcar/services/auction_services.dart';
import 'package:flikcar/utils/colors.dart';
import 'package:flikcar/utils/fonts.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class DealerCarDetails extends StatelessWidget {
  final AuctionCar car;

  DealerCarDetails({super.key, required this.car});
  static List<String> icondata = [
    "assets/car_details_icon/location.png",
    "assets/car_details_icon/speedometer.png",
    "assets/car_details_icon/owner.png",
    "assets/car_details_icon/fuel_type.png",
    "assets/car_details_icon/calendar.png",
    "assets/car_details_icon/transmisson.png",
    "assets/car_details_icon/roadTax.png",
    "assets/car_details_icon/insurance.png",
    "assets/car_details_icon/noc.png",
    "assets/car_details_icon/location.png",
  ];

  final DateFormat formatter = DateFormat('yMMM');

  static List<String> data = [];
  //TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    data = [
      "City: Kolkata",
      "Km Driven: ${car.driveKms}",
      "Owners: ${car.ownertype}",
      "Fuel Type: ${car.fuel}",
      "Reg. Year: ${car.registrationYear}",
      "Transmission: ${car.transmission}",
      "Road Tax \nValidity: ${car.roadtaxValidity == "N/A" ? "N/A" : formatter.format(DateTime.parse(car.roadtaxValidity))}",
      "Insurance\nValidity: ${car.insuranceValidity == "N/A" ? "N/A" : formatter.format(DateTime.parse(car.insuranceValidity))}",
      "NOC: ${car.noc}",
      "RTO Location: ${car.rto}"
    ];
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CurrentBidWidget(car: car),
          // Row(
          //   crossAxisAlignment: CrossAxisAlignment.start,
          //   children: [
          //     Text(
          //       "Current Bid\n${car.currentBidPrice} ₹",
          //       style: AppFonts.w700black20,
          //     ),
          //     checkAuctionEnded(context),
          //     const Spacer(),
          //     Text(
          //       "Inspection Score:",
          //       style: AppFonts.w500black14,
          //     ),
          //     const SizedBox(width: 8),
          //     const Icon(
          //       Icons.star,
          //       size: 20,
          //     ),
          //     const SizedBox(width: 3),
          //     Text(
          //       "${car.technicianRating} / 5",
          //       style: AppFonts.w700black16,
          //     )
          //   ],
          // ),
          const SizedBox(height: 10),
          checkTime(),

          const SizedBox(height: 10),
          BidTextField(
            car: car,
          ),

          // const SizedBox(height: 10),

          Text(
            "Note* Bid Amount should be atleast ₹1000 more than the current bid price",
            style: AppFonts.w500black12,
          ),
          const SizedBox(height: 25),

          Align(
            alignment: Alignment.topLeft,
            child: Wrap(
              runAlignment: WrapAlignment.spaceEvenly,
              alignment: WrapAlignment.start,
              spacing: 15,
              runSpacing: 15,
              crossAxisAlignment: WrapCrossAlignment.start,
              children: List.generate(
                  10,
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
                                  icondata[index],
                                  color: Colors.white,
                                )),
                            const SizedBox(
                              width: 6,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 3.2,
                              child: Text(
                                data[index],
                                style: AppFonts.w500black10,
                              ),
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
      return OngoingTimer2(
        car: car,
      );
    } else {
      return UpcomingTimer2(
        car: car,
      );
    }
  }

  Widget checkAuctionEnded(BuildContext context) {
    if (DateTime.parse(car.endAuction).isBefore(DateTime.now())) {
      return Text(
        "Final Bid\n₹${car.currentBidPrice}",
        style: AppFonts.w700black20,
      );
    } else {
      return Text(
        car.currentBidPrice == "no data"
            ? "Curreny Bid\n₹${car.carPrice}"
            : "Current Bid\n₹${context.watch<AuctionService>().currentbidPrice}",
        style: AppFonts.w700black20,
      );
    }
  }
}
