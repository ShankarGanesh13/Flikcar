import 'package:dotted_line/dotted_line.dart';
import 'package:flikcar/utils/colors.dart';
import 'package:flikcar/utils/fonts.dart';
import 'package:flutter/material.dart';

class InspectionDay extends StatelessWidget {
  const InspectionDay({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                Container(
                  height: 37,
                  width: 43,
                  decoration: BoxDecoration(
                    color: AppColors.p2,
                    borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(20),
                        bottomRight: Radius.circular(20)),
                  ),
                  child: Center(
                    child: Text(
                      "1",
                      style: AppFonts.w700white16,
                    ),
                  ),
                ),
                const SizedBox(
                    height: 130,
                    child: DottedLine(
                      direction: Axis.vertical,
                      lineLength: double.infinity,
                      lineThickness: 1.0,
                      dashLength: 4.0,
                      dashColor: Colors.black,
                      dashRadius: 0.0,
                      dashGapLength: 4.0,
                      dashGapColor: Colors.transparent,
                      dashGapRadius: 0.0,
                    ))
              ],
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 8),
                Text("Car inspection", style: AppFonts.w700black16),
                const SizedBox(height: 8),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 1.2,
                  child: Text(
                    "Our car expert will be assigned One Hour before inspection.We generally take 45-60 mins to complete the evaluation within specified time slot.",
                    style: AppFonts.w500black14,
                  ),
                ),
                const SizedBox(height: 8),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 1.2,
                  child: Text(
                    "This will also include a 3 KM test drive.",
                    style: AppFonts.w500black14,
                  ),
                ),
              ],
            )
          ],
        ),
        ////////////////////////////////////////
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                Container(
                  height: 37,
                  width: 43,
                  decoration: BoxDecoration(
                    color: AppColors.p2,
                    borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(20),
                        bottomRight: Radius.circular(20)),
                  ),
                  child: Center(
                    child: Text(
                      "2",
                      style: AppFonts.w700white16,
                    ),
                  ),
                ),
                const SizedBox(
                    height: 130,
                    child: DottedLine(
                      direction: Axis.vertical,
                      lineLength: double.infinity,
                      lineThickness: 1.0,
                      dashLength: 4.0,
                      dashColor: Colors.black,
                      dashRadius: 0.0,
                      dashGapLength: 4.0,
                      dashGapColor: Colors.transparent,
                      dashGapRadius: 0.0,
                    ))
              ],
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 8),
                Text("Document Verification", style: AppFonts.w700black16),
                const SizedBox(height: 8),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 1.2,
                  child: Text(
                    "Please keep the documents ready for a smooth experience.",
                    style: AppFonts.w500black14,
                  ),
                ),
                const SizedBox(height: 8),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 1.2,
                  child: Text(
                    "\u2022 RC-Registration Certificate",
                    style: AppFonts.w500black14,
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 1.2,
                  child: Text(
                    "\u2022 Aadhar Card",
                    style: AppFonts.w500black14,
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 1.2,
                  child: Text(
                    "\u2022 Insurance Copy",
                    style: AppFonts.w500black14,
                  ),
                ),
              ],
            )
          ],
        ),
        ////////////////////////////////////////
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                Container(
                  height: 37,
                  width: 43,
                  decoration: BoxDecoration(
                    color: AppColors.p2,
                    borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(20),
                        bottomRight: Radius.circular(20)),
                  ),
                  child: Center(
                    child: Text(
                      "3",
                      style: AppFonts.w700white16,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 8),
                Text("Auction & Final Offer", style: AppFonts.w700black16),
                const SizedBox(height: 8),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 1.2,
                  child: Text(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. In rhoncus consectetur felis congue dignissim. ",
                    style: AppFonts.w500black14,
                  ),
                ),
                const SizedBox(height: 8),
              ],
            )
          ],
        ),
      ],
    );
  }
}
