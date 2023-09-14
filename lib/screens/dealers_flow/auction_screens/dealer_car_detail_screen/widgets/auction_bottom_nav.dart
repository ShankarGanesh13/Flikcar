import 'package:flikcar/models/auction_car_model.dart';
import 'package:flikcar/screens/buy_car_flow/car_detailed_view/widgets/nav_button.dart';
import 'package:flikcar/services/auction_services.dart';
import 'package:flikcar/utils/colors.dart';
import 'package:flikcar/utils/fonts.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AuctionBottomNav extends StatelessWidget {
  String currentBid;
  AuctionCar car;
  AuctionBottomNav({super.key, required this.currentBid, required this.car});

  String bidAmount = "";

  @override
  Widget build(BuildContext context) {
    bidAmount = context.watch<AuctionService>().bidAmount;

    return checkTime(context);
  }

  Widget checkLive(context) {
    if (DateTime.parse(car.startAuction).isAfter(DateTime.now())) {
      return SafeArea(
          child: Container(
        width: MediaQuery.of(context).size.width,
        color: AppColors.s1,
        height: 50,
        child: Center(
          child: Text(
            "Auction Starting Soon...",
            style: AppFonts.w500white14,
          ),
        ),
      ));
    }
    if (!DateTime.parse(car.startAuction).isAfter(DateTime.now())) {
      return SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding:
              const EdgeInsets.only(left: 15, right: 15, bottom: 10, top: 5),
          color: AppColors.s1,
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            bidButton(
                icon: Icons.remove,
                function: () {
                  Provider.of<AuctionService>(context, listen: false)
                      .reduceBidAmount(currentBid);
                }),
            Text(
              "  ₹ $bidAmount  ",
              style: AppFonts.w700white16,
            ),
            bidButton(
                icon: Icons.add,
                function: () {
                  Provider.of<AuctionService>(context, listen: false)
                      .increaseBidAmount();
                }),
            const Spacer(),
            BuyNavButton(
              icon: Icons.chevron_right,
              title: "Place Bid",
              function: () {
                Provider.of<AuctionService>(context, listen: false).placeBid(
                    carId: car.id.toString(),
                    amount: currentBid,
                    car: car,
                    context: context);
              },
            )
          ]),
        ),
      );
    }

    return const SizedBox();
  }

  Widget checkTime(context) {
    if (DateTime.parse(car.endAuction).isBefore(DateTime.now())) {
      return SafeArea(
          child: Container(
        width: MediaQuery.of(context).size.width,
        color: AppColors.s1,
        height: 50,
        child: Center(
          child: Text(
            "Auction Has Ended",
            style: AppFonts.w500white14,
          ),
        ),
      ));
    } else {
      return checkLive(context);
    }
  }

  // Widget checkLive() {
  //   DateTime now = DateTime.now();
  //   if (DateTime.parse(car.endAuction).isAfter(now) &&
  //       DateTime.parse(car.startAuction).isBefore(now)) {
  //     return OngoingTimer(
  //       car: car,
  //     );
  //   } else {
  //     return UpcomingTimer(
  //       car: car,
  //     );
  //   }
  // }

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
