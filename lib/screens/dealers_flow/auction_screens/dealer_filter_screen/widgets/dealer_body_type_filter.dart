import 'package:flikcar/utils/colors.dart';
import 'package:flikcar/utils/fonts.dart';
import 'package:flutter/material.dart';

class DealerBodyTypeFilter extends StatefulWidget {
  const DealerBodyTypeFilter({super.key});

  @override
  State<DealerBodyTypeFilter> createState() => _DealerBodyTypeFilterState();
}

class _DealerBodyTypeFilterState extends State<DealerBodyTypeFilter> {
  List<String> bodyType = ["Sedan", "Hatchback", "SUV", "MUV"];
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Body Type",
          style: AppFonts.w500dark214,
        ),
        const SizedBox(height: 10),
        Text(
          bodyType[selectedIndex],
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
              4,
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
                        bodyType[index],
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
