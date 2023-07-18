// import 'package:flikcar/common_widgets/heading1.dart';
// import 'package:flikcar/common_widgets/secondary_button.dart';
// import 'package:flikcar/screens/sell_car_flow/selling_process/provider/selling_process_provider.dart';
// import 'package:flikcar/screens/sell_car_flow/selling_process/widgets/my_text_field.dart';
// import 'package:flikcar/utils/colors.dart';
// import 'package:flikcar/utils/fonts.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// class KilometersDriven extends StatelessWidget {
//   final PageController controller;
//   const KilometersDriven({super.key, required this.controller});

//   static const List<String> kilometersDriven = [
//     "0km - 10000km",
//     "10000kms - 20000kms",
//     "20000kms - 30000kms",
//     "30000kms - 40000km",
//     "40000kms - 50000kms",
//     "50000kms - 60000kms",
//     "60000kms - 70000kms",
//     "70000kms - 80000kms",
//   ];

//   @override
//   Widget build(BuildContext context) {
//     int selectedIndex =
//         context.watch<SellingProcessProvider>().kilometersDrivenIndex;
//     return SizedBox(
//       child: SingleChildScrollView(
//         child: Column(
//           children: [
//             const Heading1(
//                 title1: "Select the Kilometers driven", title2: "by your car"),
//             const SizedBox(height: 20),
//             const MyTextField(hint: "Enter kilometers driven", maxlength: 6),
//             const SizedBox(height: 10),
//             Wrap(
//               spacing: 40,
//               runSpacing: 15,
//               children: List.generate(
//                 kilometersDriven.length,
//                 (index) => InkWell(
//                   onTap: () {
//                     Provider.of<SellingProcessProvider>(context, listen: false)
//                         .setKilometersDriven(
//                             kilometers: kilometersDriven[index],
//                             selectedIndex: index);
//                     print(index);
//                   },
//                   child: Container(
//                     width: MediaQuery.of(context).size.width,
//                     height: 47,
//                     decoration: BoxDecoration(
//                       color:
//                           selectedIndex != index ? Colors.white : AppColors.p2,
//                       borderRadius: BorderRadius.circular(5),
//                       border: Border.all(
//                         color: AppColors.grey,
//                       ),
//                     ),
//                     child: Center(
//                       child: Text(
//                         kilometersDriven[index],
//                         style: selectedIndex == index
//                             ? AppFonts.w500white14
//                             : AppFonts.w500black14,
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
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
