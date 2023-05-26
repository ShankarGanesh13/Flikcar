import 'package:flikcar/screens/sell_car_flow/selling_process/provider/evaluation_provider.dart';
import 'package:flikcar/utils/fonts.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class SelectDate extends StatelessWidget {
  SelectDate({super.key});

  final DateTime date = DateTime.now();

  @override
  Widget build(BuildContext context) {
    int selectedIndex = context.watch<EvaluationProvider>().dateTimeIndex;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
                Provider.of<EvaluationProvider>(context, listen: false)
                    .setEvaluationDateTime(
                        date: date.add(
                          Duration(
                            days: index,
                          ),
                        ),
                        index: index);

                print(index);
              },
              child: Container(
                height: 65,
                width: 70,
                decoration: BoxDecoration(
                  color: selectedIndex == index
                      ? const Color(0xff9A2870)
                      : Colors.white,
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(
                    color: selectedIndex == index
                        ? Colors.transparent
                        : const Color(0xff606060),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                        DateFormat('EEE')
                            .format(date.add(Duration(days: index))),
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
      ],
    );
  }
}
