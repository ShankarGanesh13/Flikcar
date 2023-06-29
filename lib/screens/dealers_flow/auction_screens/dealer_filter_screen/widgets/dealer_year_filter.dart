import 'package:flikcar/utils/colors.dart';
import 'package:flikcar/utils/fonts.dart';
import 'package:flutter/material.dart';

class DealerYearFilter extends StatefulWidget {
  const DealerYearFilter({super.key});

  @override
  State<DealerYearFilter> createState() => _DealerYearFilterState();
}

class _DealerYearFilterState extends State<DealerYearFilter> {
  int selectedIndex = 0;
  List<String> DealerYearFilter = [
    "2010 - 2012",
    "2013 - 2015",
    "2016 - 2018",
    "2019 - 2021",
    "2022 - 2023"
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Manufactured Year",
          style: AppFonts.w500dark214,
        ),
        const SizedBox(height: 10),
        Text(
          DealerYearFilter[selectedIndex],
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
              5,
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
                        DealerYearFilter[index],
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
