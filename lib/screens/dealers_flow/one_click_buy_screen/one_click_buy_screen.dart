import 'package:flikcar/common_widgets/custom_appbar.dart';
import 'package:flikcar/common_widgets/heading1.dart';
import 'package:flikcar/screens/dealers_flow/one_click_buy_screen/widgets/ocb_header.dart';
import 'package:flikcar/utils/fonts.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class OneClickBuyScreen extends StatelessWidget {
  const OneClickBuyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.getAppBar(function: () {}),
      body: Column(children: [
        const OcbHeader(),
        Container(
          color: const Color.fromARGB(255, 83, 83, 83),
          child: Container(
            padding:
                const EdgeInsets.only(left: 15, right: 15, top: 30, bottom: 30),
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                )),
            child: Column(children: [
              const Heading1(title1: "One Click Buy", title2: ""),
              const SizedBox(
                height: 100,
              ),
              Text(
                "No cars to show",
                style: AppFonts.w500black14,
              )
            ]),
          ),
        )
      ]),
    );
  }
}
