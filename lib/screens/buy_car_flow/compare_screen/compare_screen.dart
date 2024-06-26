import 'package:flikcar/common_widgets/custom_appbar.dart';
import 'package:flikcar/models/buyer_car_model.dart';
import 'package:flikcar/screens/buy_car_flow/compare_screen/widgets/compare_details_card.dart';
import 'package:flikcar/screens/buy_car_flow/compare_screen/widgets/condition_list.dart';
import 'package:flikcar/screens/buy_car_flow/compare_screen/widgets/overview_details.dart';
import 'package:flikcar/screens/buy_car_flow/compare_screen/widgets/overview_list.dart';
import 'package:flikcar/screens/home_screen/home_screen.dart';
import 'package:flikcar/utils/fonts.dart';
import 'package:flutter/material.dart';

class CompareScreen extends StatefulWidget {
  final BuyerCar car1;
  final BuyerCar car2;
  const CompareScreen({super.key, required this.car1, required this.car2});

  @override
  State<CompareScreen> createState() => _CompareScreenState();
}

class _CompareScreenState extends State<CompareScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar.getAppBar(
          function: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const HomeScreen(index: 0)));
          },
        ),
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
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    Icons.chevron_left,
                    color: Color(0xff45C08D),
                  ),
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
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndex = 0;
                    });
                  },
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width / 2,
                    height: 60,
                    child: Center(
                        child: Text("Overview",
                            style: selectedIndex == 0
                                ? AppFonts.w700p216
                                : AppFonts.w700dark216)),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndex = 1;
                    });
                  },
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width / 2,
                    height: 60,
                    child: Center(
                        child: Text(
                      "Condition",
                      style: selectedIndex == 1
                          ? AppFonts.w700p216
                          : AppFonts.w700dark216,
                    )),
                  ),
                )
              ],
            ),
            selectedIndex == 0
                ? OverviewList(
                    car1: widget.car1,
                    car2: widget.car2,
                  )
                : ConditionList(
                    car1: widget.car1,
                    car2: widget.car2,
                  )
          ],
        ));
  }
}
