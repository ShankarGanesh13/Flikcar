import 'package:flikcar/utils/fonts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SelectCondition extends StatelessWidget {
  SelectCondition({super.key});
  final int selectedIndex = 1;
  final List<String> condition = ["Fair", "Good", "Very Good", "Excellent"];
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          "Select your car’s condition",
          style: AppFonts.w500dark214,
        ),
        const SizedBox(height: 15),
        Wrap(
          spacing: 20,
          runSpacing: 15,
          children: List.generate(
            4,
            (index) => InkWell(
              onTap: () {
                print(index);
              },
              child: Container(
                padding: const EdgeInsets.only(
                  top: 8,
                  bottom: 8,
                ),
                width: MediaQuery.of(context).size.width / 2.3,
                decoration: BoxDecoration(
                  color: selectedIndex != index
                      ? Colors.white
                      : const Color(0xff9A2870),
                  border: Border.all(
                    color: Color(0xffCDCDCD),
                  ),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Center(
                  child: Text(
                    condition[index],
                    style: selectedIndex == index
                        ? AppFonts.w500white14
                        : AppFonts.w500black14,
                  ),
                ),
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
