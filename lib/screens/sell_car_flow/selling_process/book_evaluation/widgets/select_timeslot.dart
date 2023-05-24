import 'package:flikcar/screens/sell_car_flow/selling_process/book_evaluation/book_evaluation.dart';
import 'package:flikcar/screens/sell_car_flow/selling_process/provider/evaluation_provider.dart';
import 'package:flikcar/utils/fonts.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SelectTimeslot extends StatelessWidget {
  const SelectTimeslot({super.key});

  @override
  Widget build(BuildContext context) {
    int selectedIndex = context.watch<EvaluationProvider>().timeSlotIndex;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Select Time Slot",
          style: AppFonts.w700s116,
        ),
        const SizedBox(height: 10),
        Text(
            "Evaluaion will take 45 - 60mins & will be completed in given timeslot",
            style: AppFonts.w500dark214),
        const SizedBox(height: 15),
        Wrap(
          spacing: 30,
          runSpacing: 15,
          children: List.generate(
            6,
            (index) => InkWell(
              onTap: () {
                Provider.of<EvaluationProvider>(context, listen: false)
                    .setEvaluationTimeSlot(index: index, timeslot: "4pm - 5pm");
                print(index);
              },
              child: Container(
                padding: const EdgeInsets.only(
                    top: 5, bottom: 5, left: 15, right: 15),
                height: 40,
                decoration: BoxDecoration(
                    color: selectedIndex == index
                        ? const Color(0xff9A2870)
                        : Colors.white,
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                      color: selectedIndex == index
                          ? Colors.transparent
                          : const Color(0xffCDCDCD),
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
      ],
    );
  }
}
