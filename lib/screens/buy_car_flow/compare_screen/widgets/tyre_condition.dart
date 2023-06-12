import 'package:flikcar/utils/fonts.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class TyreCondition extends StatelessWidget {
  final String title;
  const TyreCondition({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Container(
        height: 25,
        width: MediaQuery.of(context).size.width,
        color: Color(0xffE0E0E0),
        child: Row(
          children: [
            const SizedBox(width: 15),
            Text(title.toUpperCase(), style: AppFonts.w500dark214),
          ],
        ),
      ),
      tyre(
          tyre: "Front Left",
          condition1: "80",
          percent1: 0.8,
          condition2: "60",
          percent2: 0.6),
      const Divider(
        color: Color(0xffE0E0E0),
        thickness: 1,
      ),
      tyre(
          tyre: "Front Left",
          condition1: "80",
          percent1: 0.8,
          condition2: "60",
          percent2: 0.6),
      const Divider(
        color: Color(0xffE0E0E0),
        thickness: 1,
      ),
      tyre(
          tyre: "Front Left",
          condition1: "80",
          percent1: 0.8,
          condition2: "60",
          percent2: 0.6),
      const Divider(
        color: Color(0xffE0E0E0),
        thickness: 1,
      ),
      tyre(
          tyre: "Front Left",
          condition1: "80",
          percent1: 0.8,
          condition2: "60",
          percent2: 0.6),
      const Divider(
        color: Color(0xffE0E0E0),
        thickness: 1,
      ),
    ]);
  }

  Widget tyre(
      {required String tyre,
      required String condition1,
      required String condition2,
      required double percent1,
      required double percent2}) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: SizedBox(
        height: 70,
        child: ListView(
          physics: NeverScrollableScrollPhysics(),
          children: [
            Text(
              tyre,
              style: AppFonts.w700black16,
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "~ $condition1%",
                  style: AppFonts.w500dark214,
                ),
                const SizedBox(
                  width: 8,
                ),
                CircularPercentIndicator(
                  radius: 15.0,
                  backgroundWidth: 4,
                  lineWidth: 5.0,
                  percent: percent1,
                  center: new Text(""),
                  progressColor: const Color(0xff45C08D),
                ),
                Spacer(),
                Text(
                  "~ $condition2%",
                  style: AppFonts.w500dark214,
                ),
                const SizedBox(
                  width: 8,
                ),
                CircularPercentIndicator(
                  radius: 15.0,
                  backgroundWidth: 4,
                  lineWidth: 5.0,
                  percent: percent2,
                  center: new Text(""),
                  progressColor: const Color(0xff45C08D),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
