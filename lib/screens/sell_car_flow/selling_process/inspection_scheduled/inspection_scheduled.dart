import 'package:flikcar/common_widgets/custom_appbar.dart';
import 'package:flikcar/common_widgets/heading1.dart';
import 'package:flikcar/screens/sell_car_flow/sell_home_screen/widgets/frequent_question.dart';
import 'package:flikcar/screens/sell_car_flow/selling_process/inspection_scheduled/widgets/bottom_nav.dart';
import 'package:flikcar/screens/sell_car_flow/selling_process/inspection_scheduled/widgets/inspection_day.dart';
import 'package:flikcar/utils/colors.dart';
import 'package:flikcar/utils/fonts.dart';
import 'package:flutter/material.dart';

class InspectionScheduled extends StatelessWidget {
  const InspectionScheduled({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.getAppBar(),
      bottomNavigationBar: const CustomBottomNav(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Heading1(title1: "Inspection Scheduled", title2: ""),
                  const SizedBox(height: 10),
                  Text("Appointment id #11925310780",
                      style: AppFonts.w500dark214),
                  const SizedBox(
                    height: 15,
                  ),
                  custDetails(
                      context: context,
                      details: "Tue, 23 May, 09:00 AM - 10:00 AM",
                      data: Icons.calendar_month),
                  const SizedBox(
                    height: 15,
                  ),
                  custDetails(
                      context: context,
                      details:
                          "46/1A Chakraberia Road North Kolkata 700020 opposite of Arya Vidya Mandir School",
                      data: Icons.location_on),
                  const SizedBox(
                    height: 15,
                  ),
                  custDetails(
                      context: context,
                      details:
                          "LXI O [2016-2019], 40k-50k km, Petrol Manual Transmission, 2nd owner, After 2 weeks",
                      data: Icons.car_rental),
                  const SizedBox(height: 20),
                  Text("What happens on the inspection day?",
                      style: AppFonts.w700s116),
                ],
              ),
            ),
            const InspectionDay(),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    children: [
                      Text(
                        "Need help?",
                        style: AppFonts.w700s116,
                      ),
                      const Spacer(),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          shadowColor: Colors.transparent,
                          disabledBackgroundColor: Colors.transparent,
                          shape: RoundedRectangleBorder(
                            side: BorderSide(color: AppColors.p2),
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        onPressed: () {},
                        child: Row(
                          children: [
                            Icon(
                              Icons.headphones,
                              color: AppColors.p2,
                            ),
                            const SizedBox(
                              width: 3,
                            ),
                            Text(
                              "Get a Call Back",
                              style: AppFonts.w500p215,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                FrequentQuestions(),
                const SizedBox(
                  height: 30,
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget custDetails(
      {required BuildContext context,
      required String details,
      required IconData data}) {
    return Row(
      children: [
        Icon(data),
        const SizedBox(
          width: 10,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width / 1.2,
          child: Text(
            details,
            style: AppFonts.w500black14,
          ),
        )
      ],
    );
  }
}
