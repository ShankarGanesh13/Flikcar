import 'package:flikcar/utils/colors.dart';
import 'package:flikcar/utils/fonts.dart';
import 'package:flutter/material.dart';

class ColorFilter extends StatefulWidget {
  const ColorFilter({super.key});

  @override
  State<ColorFilter> createState() => _ColorFilterState();
}

class _ColorFilterState extends State<ColorFilter> {
  List<String> colorName = [
    "Red",
    "Blue",
    "Brown",
    "Black",
    "White",
    "Grey",
    "Silver"
  ];
  List<Color> color = [
    Colors.red,
    Colors.blue,
    Colors.brown,
    Colors.black,
    Colors.white,
    Colors.grey,
    Color(0xffC0C0C0)
  ];
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Select Color",
          style: AppFonts.w500dark214,
        ),
        const SizedBox(height: 10),
        Text(
          colorName[selectedIndex],
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
                      Container(
                        height: 19,
                        width: 33,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: color[index]),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        colorName[index],
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
