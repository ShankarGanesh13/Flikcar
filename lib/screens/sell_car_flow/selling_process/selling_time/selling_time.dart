// import 'package:flikcar/common_widgets/heading1.dart';
// import 'package:flikcar/common_widgets/secondary_button.dart';
// import 'package:flikcar/screens/home_screen/home_screen.dart';
// import 'package:flikcar/screens/sell_car_flow/sell_home_screen/sell_car_home_screen.dart';
// import 'package:flikcar/screens/sell_car_flow/selling_process/provider/selling_process_provider.dart';
// import 'package:flikcar/screens/sell_car_flow/selling_process/splash_screen.dart/splash_screen.dart';
// import 'package:flikcar/utils/colors.dart';
// import 'package:flikcar/utils/fonts.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// class SellingTime extends StatelessWidget {
//   final PageController controller;

//   const SellingTime({super.key, required this.controller});

//   @override
//   Widget build(BuildContext context) {
//     int selectedIndex =
//         context.watch<SellingProcessProvider>().sellingTimeIndex;
//     List<String> ownership = [
//       "Immediately",
//       "Within a month",
//       "After a month",
//     ];

//     return SizedBox(
//       child: SingleChildScrollView(
//         child: Column(
//           children: [
//             const Heading1(title1: "When you want to", title2: "sell your car"),
//             const SizedBox(height: 25),
//             Wrap(
//               spacing: 40,
//               runSpacing: 15,
//               children: List.generate(
//                   ownership.length,
//                   (index) => InkWell(
//                         onTap: () {
//                           Provider.of<SellingProcessProvider>(context,
//                                   listen: false)
//                               .setSellingTime(
//                                   time: ownership[index], selectedIndex: index);
//                         },
//                         child: Container(
//                           width: MediaQuery.of(context).size.width,
//                           height: 47,
//                           decoration: BoxDecoration(
//                             color: selectedIndex != index
//                                 ? Colors.white
//                                 : AppColors.p2,
//                             borderRadius: BorderRadius.circular(5),
//                             border: Border.all(
//                               color: AppColors.grey,
//                             ),
//                           ),
//                           child: Center(
//                             child: Text(
//                               ownership[index],
//                               style: selectedIndex == index
//                                   ? AppFonts.w500white14
//                                   : AppFonts.w500black14,
//                             ),
//                           ),
//                         ),
//                       )),
//             ),
//             const SizedBox(
//               height: 30,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
