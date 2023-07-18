// import 'package:flikcar/common_widgets/heading1.dart';
// import 'package:flikcar/screens/sell_car_flow/selling_process/provider/selling_process_provider.dart';
// import 'package:flikcar/utils/colors.dart';
// import 'package:flikcar/utils/fonts.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// class SelectLocation extends StatelessWidget {
//   final PageController controller;
//   const SelectLocation({super.key, required this.controller});

//   @override
//   Widget build(BuildContext context) {
//     int selectedIndex = context.watch<SellingProcessProvider>().locationIndex;
//     return SizedBox(
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           const Heading1(
//               title1: "Select the RTO location", title2: "of your car"),
//           const SizedBox(height: 15),
//           Wrap(
//             spacing: 40,
//             runSpacing: 15,
//             children: List.generate(
//               1,
//               (index) => InkWell(
//                 onTap: () {
//                   Provider.of<SellingProcessProvider>(context, listen: false)
//                       .setlocation(location: "Kolkata", selectedIndex: index);
//                   // setState(() {
//                   //   selectedIndex = index;
//                   // });
//                   print(index);
//                 },
//                 child: Container(
//                     padding: const EdgeInsets.only(top: 5, bottom: 5),
//                     height: 62,
//                     width: 86,
//                     decoration: BoxDecoration(
//                       color:
//                           selectedIndex == index ? AppColors.p2 : Colors.white,
//                       border: Border.all(
//                         color: AppColors.grey,
//                       ),
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     child: Center(
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           SizedBox(
//                             height: 30,
//                             width: 45,
//                             child: Image.asset(
//                               color: selectedIndex == index
//                                   ? Colors.white
//                                   : Colors.black,
//                               "assets/location/kolkata.png",
//                             ),
//                           ),
//                           const SizedBox(height: 4),
//                           Text(
//                             "Kolkata",
//                             style: selectedIndex == index
//                                 ? AppFonts.w500white10
//                                 : AppFonts.w500black10,
//                           ),
//                         ],
//                       ),
//                     )),
//               ),
//             ),
//           ),
//           const SizedBox(
//             height: 30,
//           ),
//           const Text(
//               "Currently we are available only in Kolkata, Stay Tuned for more updates"),
//           const SizedBox(
//             height: 20,
//           ),
//         ],
//       ),
//     );
//   }
// }
