// import 'package:flikcar/common_widgets/heading1.dart';
// import 'package:flikcar/models/auction_car_model.dart';
// import 'package:flikcar/utils/colors.dart';
// import 'package:flikcar/utils/fonts.dart';
// import 'package:flutter/material.dart';

// class DealerAuctionDetails extends StatelessWidget {
//   final AuctionCar car;
//   const DealerAuctionDetails({super.key, required this.car});

//   @override
//   Widget build(BuildContext context) {
//     return car.recentBid != null && car.recentBid!.isNotEmpty
//         ? Padding(
//             padding: const EdgeInsets.all(15.0),
//             child: Column(
//               children: [
//                 const Heading1(title1: "Recent Bids", title2: ""),
//                 const SizedBox(height: 10),
//                 Divider(
//                   color: AppColors.black,
//                 ),
//                 ListView.builder(
//                     itemCount: car.recentBid!.length,
//                     shrinkWrap: true,
//                     physics: const NeverScrollableScrollPhysics(),
//                     itemBuilder: (context, index) {
//                       return auctionDetails(
//                           name: car.recentBid![index].dealerName,
//                           amount: car.recentBid![index].price);
//                     })
//               ],
//             ),
//           )
//         : const SizedBox();
//   }

//   Widget auctionDetails({required String name, required String amount}) {
//     return Column(
//       children: [
//         Padding(
//           padding:
//               const EdgeInsets.only(left: 15.0, right: 15, top: 5, bottom: 5),
//           child: Row(
//             children: [
//               Text(
//                 name,
//                 style: AppFonts.w600black14,
//               ),
//               const Spacer(),
//               Text(
//                 "₹ $amount",
//                 style: AppFonts.w500black14,
//               )
//             ],
//           ),
//         ),
//         Divider(
//           color: AppColors.black,
//         ),
//       ],
//     );
//   }
// }
