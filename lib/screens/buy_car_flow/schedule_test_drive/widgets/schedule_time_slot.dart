import 'package:flikcar/screens/buy_car_flow/provider/buy_car_provider.dart';
import 'package:flikcar/utils/colors.dart';
import 'package:flikcar/utils/fonts.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ScheduleTimeSlot extends StatelessWidget {
  
  const ScheduleTimeSlot({super.key});

  @override
  Widget build(BuildContext context) {
    final int selectedIndex =
        context.watch<BuyCarProvider>().testDriveTimeSlotIndex;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Select Time Slot",
          style: AppFonts.w700s116,
        ),
        const SizedBox(height: 10),
        Align(
          alignment: Alignment.center,
          child: Wrap(
            spacing: 30,
            runSpacing: 15,
            children: List.generate(
              6,
              (index) => InkWell(
                onTap: () {
                  Provider.of<BuyCarProvider>(context, listen: false)
                      .getTestDriveTimeSlot(
                          timeslot: "4:00pm - 5:00pm", index: index);
                },
                child: Container(
                  padding: const EdgeInsets.only(
                      top: 5, bottom: 5, left: 15, right: 15),
                  height: 40,
                  width: MediaQuery.of(context).size.width / 2.4,
                  decoration: BoxDecoration(
                      color:
                          selectedIndex == index ? AppColors.p2 : Colors.white,
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                        color: selectedIndex == index
                            ? Colors.transparent
                            : AppColors.grey,
                      )),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("4:00pm - 5:00pm",
                          style: selectedIndex == index
                              ? AppFonts.w500white14
                              : AppFonts.w500black14),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
