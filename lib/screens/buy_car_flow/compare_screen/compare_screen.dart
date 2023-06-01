import 'package:flikcar/common_widgets/custom_appbar.dart';
import 'package:flikcar/screens/buy_car_flow/compare_screen/widgets/compare_details_card.dart';
import 'package:flikcar/screens/buy_car_flow/compare_screen/widgets/condition_list.dart';
import 'package:flikcar/screens/buy_car_flow/compare_screen/widgets/overview_details.dart';
import 'package:flikcar/utils/fonts.dart';
import 'package:flutter/material.dart';

class CompareScreen extends StatelessWidget {
  const CompareScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar.getAppBar(),
        body: Column(
          children: [
            Container(
              height: 49,
              width: MediaQuery.of(context).size.width,
              color: const Color.fromARGB(255, 239, 255, 248),
              child: Row(children: [
                const SizedBox(
                  width: 10,
                ),
                const Icon(
                  Icons.chevron_left,
                  color: Color(0xff45C08D),
                ),
                const SizedBox(
                  width: 10,
                ),
                Text("Comparing 2 cars", style: AppFonts.w700black16)
              ]),
            ),
            const Padding(
              padding: EdgeInsets.all(15.0),
              child: Row(
                children: [
                  CompareDetailsCard(),
                  Spacer(),
                  CompareDetailsCard()
                ],
              ),
            ),
            const Divider(
              height: 0,
              thickness: 3,
              color: Color(0xffE0E0E0),
            ),
            Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width / 2,
                  height: 60,
                  child: Center(
                      child: Text("Overview", style: AppFonts.w700black16)),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 2,
                  height: 60,
                  child: Center(
                      child: Text(
                    "Condition",
                    style: AppFonts.w700dark216,
                  )),
                )
              ],
            ),
            ConditionList()
          ],
        ));
  }
}
