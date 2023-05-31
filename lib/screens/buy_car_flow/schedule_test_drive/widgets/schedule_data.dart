import 'package:flikcar/utils/colors.dart';
import 'package:flikcar/utils/fonts.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ScheduleDate extends StatelessWidget {
  const ScheduleDate({super.key});
  final int selectedIndex = 0;
  static final date = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
        "Select Date",
        style: AppFonts.w700s116,
      ),
      const SizedBox(height: 15),
      Wrap(
        spacing: 25,
        runSpacing: 15,
        children: List.generate(
          8,
          (index) => InkWell(
            onTap: () {
              print(index);
            },
            child: Container(
              height: 65,
              width: 70,
              decoration: BoxDecoration(
                color: selectedIndex == index ? AppColors.p2 : Colors.white,
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                  color: selectedIndex == index
                      ? Colors.transparent
                      : AppColors.grey,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                      DateFormat('EEE').format(date.add(Duration(days: index))),
                      style: selectedIndex == index
                          ? AppFonts.w700white16
                          : AppFonts.w700dark216),
                  Text(
                    " ${DateFormat('d').format(date.add(Duration(days: index)))} ${DateFormat('MMM').format(date.add(Duration(days: index)))}",
                    style: selectedIndex == index
                        ? AppFonts.w500white14
                        : AppFonts.w500dark214,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    ]);
  }
}
