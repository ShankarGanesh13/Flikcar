import 'package:flikcar/screens/sell_car_flow/selling_process/provider/evaluation_provider.dart';
import 'package:flikcar/utils/colors.dart';
import 'package:flikcar/utils/fonts.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Plans extends StatelessWidget {
  Plans({super.key});
  final int selectedIndex = 1;
  final List<String> plans = [
    "Planning to buy a new car",
    "Planning to buy a used car",
    "Have already bought a car",
    "Not decided yet",
    "Not looking to buy a car",
  ];
  @override
  Widget build(BuildContext context) {
    int selectedIndex =
        context.watch<EvaluationProvider>().reasonForSellingIndex;
    return Column(
      children: [
        Text(
          "Are you planning to buy another car in place of this?",
          style: AppFonts.w700s116,
        ),
        const SizedBox(
          height: 10,
        ),
        Wrap(
          spacing: 40,
          runSpacing: 15,
          children: List.generate(
            plans.length,
            (index) => InkWell(
              onTap: () {
                Provider.of<EvaluationProvider>(context, listen: false)
                    .setReasonForSelling(reason: plans[index], index: index);
              },
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 47,
                decoration: BoxDecoration(
                  color: selectedIndex != index ? Colors.white : AppColors.p2,
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(
                    color: const Color(0xffE0E0E0),
                  ),
                ),
                child: Center(
                  child: Text(
                    plans[index],
                    style: selectedIndex == index
                        ? AppFonts.w500white14
                        : AppFonts.w500black14,
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
