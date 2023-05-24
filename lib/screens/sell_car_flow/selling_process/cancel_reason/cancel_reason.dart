import 'package:flikcar/common_widgets/custom_appbar.dart';
import 'package:flikcar/common_widgets/primary_button.dart';
import 'package:flikcar/utils/fonts.dart';
import 'package:flutter/material.dart';

class CancelReason extends StatelessWidget {
  CancelReason({super.key});
  List<String> reason = [
    "Inspect/Sold at Flikcar",
    "Documents not available",
    "Inspect / Sold elsewhere",
    "Don’t want to sell now",
    "Looking to buy a car",
    "My reason is not listed"
  ];
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.getAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(children: [
          Text("Please let us know your reason for cancelling the inspection.",
              style: AppFonts.w700s116),
          const SizedBox(height: 15),
          Wrap(
            spacing: 40,
            runSpacing: 15,
            children: List.generate(
                reason.length,
                (index) => InkWell(
                      onTap: () {},
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 47,
                        decoration: BoxDecoration(
                          color: selectedIndex != index
                              ? Colors.white
                              : const Color(0xff9A2870),
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                            color: const Color(0xffCDCDCD),
                          ),
                        ),
                        child: Center(
                            child: Text(
                          reason[index],
                          style: selectedIndex == index
                              ? AppFonts.w500white14
                              : AppFonts.w500black14,
                        )),
                      ),
                    )),
          ),
          const Spacer(),
          PrimaryButton(title: "Cancel Evaluation", function: () {})
        ]),
      ),
    );
  }
}
