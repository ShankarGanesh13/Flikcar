import 'package:flikcar/utils/fonts.dart';
import 'package:flutter/material.dart';

class NavButton extends StatelessWidget {
  final String title;
  final bool backIcon;
  final Function() function;
  const NavButton(
      {super.key,
      required this.title,
      required this.backIcon,
      required this.function});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 33,
      width: 91,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xff9A2870),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            padding:
                const EdgeInsets.only(left: 15, right: 15, top: 5, bottom: 5)),
        onPressed: function,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            backIcon == true
                ? const Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  )
                : const SizedBox(),
            Text(
              title,
              style: AppFonts.w500white14,
            ),
            backIcon == false
                ? const Icon(
                    Icons.arrow_forward,
                    color: Colors.white,
                  )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}
