import 'package:flikcar/utils/colors.dart';
import 'package:flikcar/utils/fonts.dart';
import 'package:flutter/material.dart';

class CustomCheckbox extends StatefulWidget {
  String title;

  ValueChanged<bool> isSelected;
  CustomCheckbox({super.key, required this.isSelected, required this.title});

  @override
  State<CustomCheckbox> createState() => _CustomCheckboxState();
}

class _CustomCheckboxState extends State<CustomCheckbox> {
  bool value = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (value == true) {
          value = false;

          setState(() {});
        }
        if (value == false) {
          value = true;

          setState(() {});
        }
        widget.isSelected(value);
      },
      child: Container(
        child: Row(
          children: [
            Container(
              margin: const EdgeInsets.only(right: 8),
              height: 15,
              width: 15,
              decoration: BoxDecoration(
                  border: Border.all(
                color: const Color(0xff161F31),
              )),
              child: Center(
                child: Icon(
                  Icons.check,
                  size: 14,
                  color: value == true ? AppColors.s1 : Colors.transparent,
                  weight: 2,
                ),
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            Text(widget.title, style: AppFonts.w500dark214),
          ],
        ),
      ),
    );
  }
}
