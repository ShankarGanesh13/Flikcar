import 'package:flikcar/utils/colors.dart';
import 'package:flikcar/utils/fonts.dart';
import 'package:flutter/material.dart';

class DealerKilometersDrivenFilter extends StatefulWidget {
  const DealerKilometersDrivenFilter({super.key});
  static List<String> kilometersDriven = [
    "0 - 10000kms",
    "10000kms - 20000kms",
    "20000kms - 30000kms",
    "30000kms - 50000kms",
    "50000kms - 70000kms",
    "70000kms - 100000kms",
    "Above > 100000"
  ];

  @override
  State<DealerKilometersDrivenFilter> createState() =>
      _DealerKilometersDrivenFilterState();
}

class _DealerKilometersDrivenFilterState
    extends State<DealerKilometersDrivenFilter> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Kilometers Driven",
          style: AppFonts.w500dark214,
        ),
        const SizedBox(height: 10),
        Text(
          DealerKilometersDrivenFilter.kilometersDriven[selectedIndex],
          style: AppFonts.w700black16,
        ),
        const SizedBox(height: 30),
        Text(
          "Suggestions",
          style: AppFonts.w700black16,
        ),
        const SizedBox(height: 20),
        Wrap(
            direction: Axis.vertical,
            runSpacing: 20,
            spacing: 20,
            children: List.generate(
              7,
              (index) => SizedBox(
                width: 200,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                  child: Row(
                    children: [
                      Container(
                        height: 15,
                        width: 15,
                        decoration: BoxDecoration(
                            border: Border.all(color: Color(0xff161F31))),
                        child: Center(
                            child: Icon(
                          Icons.check,
                          size: 14,
                          color: selectedIndex == index
                              ? AppColors.s1
                              : Colors.transparent,
                          weight: 2,
                        )),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        DealerKilometersDrivenFilter.kilometersDriven[index],
                        style: AppFonts.w500dark214,
                      )
                    ],
                  ),
                ),
              ),
            ))
      ],
    );
  }
}
