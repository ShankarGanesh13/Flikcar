import 'package:flikcar/utils/colors.dart';
import 'package:flikcar/utils/fonts.dart';
import 'package:flutter/material.dart';

class OwnersFilter extends StatefulWidget {
  const OwnersFilter({super.key});

  @override
  State<OwnersFilter> createState() => _OwnersFilterState();
}

class _OwnersFilterState extends State<OwnersFilter> {
  List<String> owners = ["1st Owner", "2nd Owner", "3rd Owner"];
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Number of Owners",
          style: AppFonts.w500dark214,
        ),
        const SizedBox(height: 10),
        Text(
          owners[selectedIndex],
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
              3,
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
                        owners[index],
                        style: AppFonts.w500dark214,
                      )
                    ],
                  ),
                ),
              ),
            ))
      ],
    );
    ;
  }
}
