import 'package:flikcar/screens/home_screen/home_screen.dart';
import 'package:flikcar/screens/sell_car_flow/selling_process/book_evaluation/book_evaluation.dart';
import 'package:flikcar/screens/sell_car_flow/selling_process/cancel_reason/cancel_reason.dart';
import 'package:flikcar/utils/colors.dart';
import 'package:flikcar/utils/fonts.dart';
import 'package:flutter/material.dart';

class CustomBottomNav extends StatelessWidget {
  const CustomBottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 67,
      color: AppColors.s1,
      width: MediaQuery.of(context).size.width,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        navButton(
            title: "Cancel",
            function: () {
              print("cancel");
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CancelReason(),
                ),
              );
            },
            color: AppColors.s1,
            icon: Icons.close),
        navButton(
            title: "Reschedule",
            function: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BookEvaluation(),
                ),
              );
            },
            color: AppColors.p2,
            icon: Icons.watch_later_outlined),
        navButton(
            title: "Finish",
            function: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => const HomeScreen(
                    index: 1,
                  ),
                ),
                (route) => false,
              );
            },
            color: AppColors.p2,
            icon: Icons.flag),
      ]),
    );
  }

  Widget navButton({
    required Color color,
    required Function() function,
    required String title,
    required IconData icon,
  }) {
    return SizedBox(
      height: 33,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            splashFactory: NoSplash.splashFactory,
            shadowColor: Colors.transparent,
            backgroundColor: color,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            padding:
                const EdgeInsets.only(left: 15, right: 15, top: 5, bottom: 5)),
        onPressed: function,
        child: Row(
          children: [
            Text(
              title,
              style: AppFonts.w500white14,
            ),
            const SizedBox(
              width: 3,
            ),
            Icon(
              icon,
              color: Colors.white,
              size: 18,
            )
          ],
        ),
      ),
    );
  }
}
