import 'package:flikcar/common_widgets/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flikcar/models/auction_car_model.dart';
import 'package:flikcar/screens/buy_car_flow/car_detailed_view/widgets/nav_button.dart';
import 'package:flikcar/services/auction_services.dart';
import 'package:flikcar/utils/colors.dart';
import 'package:flikcar/utils/fonts.dart';

class AuctionBottomNav extends StatefulWidget {
  final String currentBid;
  final AuctionCar car;

  AuctionBottomNav({Key? key, required this.currentBid, required this.car})
      : super(key: key);

  @override
  State<AuctionBottomNav> createState() => _AuctionBottomNavState();
}

class _AuctionBottomNavState extends State<AuctionBottomNav> {
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    //  final bidAmount = context.watch<AuctionService>().bidAmount;

    if (DateTime.parse(widget.car.startAuction).isAfter(DateTime.now())) {
      return buildAuctionStartingSoon(context);
    } else if (DateTime.parse(widget.car.endAuction).isBefore(DateTime.now())) {
      return buildAuctionEnded(context);
    } else {
      return buildAuctionLive(context);
    }
  }

  Widget buildAuctionStartingSoon(context) {
    return SafeArea(
      child: Container(
        width: MediaQuery.of(context).size.width,
        color: Colors.white,
        height: 50,
        child: Center(
          child: Text(
            "Auction Starting Soon...",
            style: AppFonts.w500white10,
          ),
        ),
      ),
    );
  }

  Widget buildAuctionLive(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.only(left: 0, right: 0, bottom: 10, top: 5),
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width / 2,
                height: 40,
                child: TextFormField(
                  controller: controller,
                  keyboardType: TextInputType.number,
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.only(
                      left: 12,
                      right: 12,
                      top: 0,
                      bottom: 0,
                    ),
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(2),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.red),
                      borderRadius: BorderRadius.circular(2),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(2),
                    ),
                    hintText: "Bid Amount",
                    hintStyle: AppFonts.w500dark214,
                    counterText: "",
                    counterStyle: const TextStyle(color: Colors.transparent),
                  ),
                  style: AppFonts.w500black16,
                  maxLength: 9,
                ),
              ),
              const Spacer(),
              BuyNavButton(
                icon: Icons.chevron_right,
                title: "Place Bid",
                function: () {
                  if (controller.text != "") {
                    if (int.parse(controller.text) >
                        (int.parse(widget.car.currentBidPrice) + 999)) {
                      Provider.of<AuctionService>(context, listen: false)
                          .placeBid(
                        carId: widget.car.id.toString(),
                        amount: controller.text,
                        car: widget.car,
                        context: context,
                      );
                      controller.clear();
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                          MySnackbar.showSnackBar(
                              context, "Increase Bid Amount"));
                    }
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                        MySnackbar.showSnackBar(context, "Add Bid Amount"));
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildAuctionEnded(context) {
    return SafeArea(
      child: Container(
        width: MediaQuery.of(context).size.width,
        color: Colors.white,
        height: 50,
        child: Center(
          child: Text(
            "Auction Has Ended",
            style: AppFonts.w500white14,
          ),
        ),
      ),
    );
  }
}






// import 'package:flikcar/models/auction_car_model.dart';
// import 'package:flikcar/screens/buy_car_flow/car_detailed_view/widgets/nav_button.dart';
// import 'package:flikcar/services/auction_services.dart';
// import 'package:flikcar/utils/colors.dart';
// import 'package:flikcar/utils/fonts.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// class AuctionBottomNav extends StatelessWidget {
//   String currentBid;
//   AuctionCar car;
//   AuctionBottomNav({super.key, required this.currentBid, required this.car});

//   String bidAmount = "";
//   TextEditingController controller = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     bidAmount = context.watch<AuctionService>().bidAmount;

//     return checkTime(context);
//   }

//   Widget checkLive(context) {
//     if (DateTime.parse(car.startAuction).isAfter(DateTime.now())) {
//       return SafeArea(
//           child: Container(
//         width: MediaQuery.of(context).size.width,
//         color: AppColors.s1,
//         height: 50,
//         child: Center(
//           child: Text(
//             "Auction Starting Soon...",
//             style: AppFonts.w500white14,
//           ),
//         ),
//       ));
//     }
//     if (!DateTime.parse(car.startAuction).isAfter(DateTime.now())) {
//       return SafeArea(
//         child: Container(
//           width: MediaQuery.of(context).size.width,
//           padding:
//               const EdgeInsets.only(left: 15, right: 15, bottom: 10, top: 5),
//           color: AppColors.s1,
//           child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
//             SizedBox(
//               width: MediaQuery.of(context).size.width / 2,
//               height: 40,
//               child: TextFormField(
//                 controller: controller,
//                 keyboardType: TextInputType.number,
//                 cursorColor: Colors.white,
//                 decoration: InputDecoration(
//                   contentPadding: const EdgeInsets.only(
//                       left: 12, right: 12, top: 0, bottom: 0),
//                   border: OutlineInputBorder(
//                     borderSide: const BorderSide(color: Colors.white),
//                     borderRadius: BorderRadius.circular(2),
//                   ),
//                   errorBorder: OutlineInputBorder(
//                     borderSide: const BorderSide(color: Colors.white),
//                     borderRadius: BorderRadius.circular(2),
//                   ),
//                   focusedBorder: OutlineInputBorder(
//                     borderSide: const BorderSide(color: Colors.white),
//                     borderRadius: BorderRadius.circular(2),
//                   ),
//                   hintText: "Bid Amount",
//                   hintStyle: AppFonts.w500white14,
//                   counterText: "",
//                   counterStyle: const TextStyle(color: Colors.transparent),
//                 ),
//                 style: AppFonts.w500white16,
//                 maxLength: 9,
//                 onChanged: (value) {
//                   print(value);
//                 },
//               ),
//             ),
//             BuyNavButton(
//               icon: Icons.chevron_right,
//               title: "Place Bid",
//               function: () {
//                 Provider.of<AuctionService>(context, listen: false).placeBid(
//                     carId: car.id.toString(),
//                     amount: currentBid,
//                     car: car,
//                     context: context);
//               },
//             )
//           ]),
//         ),
//       );
//     }

//     return const SizedBox();
//   }

//   Widget checkTime(context) {
//     if (DateTime.parse(car.endAuction).isBefore(DateTime.now())) {
//       return SafeArea(
//           child: Container(
//         width: MediaQuery.of(context).size.width,
//         color: AppColors.s1,
//         height: 50,
//         child: Center(
//           child: Text(
//             "Auction Has Ended",
//             style: AppFonts.w500white14,
//           ),
//         ),
//       ));
//     } else {
//       return checkLive(context);
//     }
//   }

//   // Widget checkLive() {
//   //   DateTime now = DateTime.now();
//   //   if (DateTime.parse(car.endAuction).isAfter(now) &&
//   //       DateTime.parse(car.startAuction).isBefore(now)) {
//   //     return OngoingTimer(
//   //       car: car,
//   //     );
//   //   } else {
//   //     return UpcomingTimer(
//   //       car: car,
//   //     );
//   //   }
//   // }

//   Widget bidButton({required IconData icon, required Function() function}) {
//     return GestureDetector(
//       onTap: function,
//       child: Container(
//         height: 40,
//         width: 40,
//         decoration: BoxDecoration(
//             color: const Color(0xffffffff),
//             borderRadius: BorderRadius.circular(4)),
//         child: Icon(
//           icon,
//           size: 24,
//           weight: 900,
//           color: const Color(0xff606060),
//         ),
//       ),
//     );
//   }
// }
