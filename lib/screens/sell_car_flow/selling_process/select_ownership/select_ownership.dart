import 'package:flikcar/common_widgets/heading1.dart';
import 'package:flikcar/common_widgets/secondary_button.dart';
import 'package:flikcar/screens/sell_car_flow/selling_process/provider/selling_process_provider.dart';
import 'package:flikcar/utils/fonts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SelectOwnership extends StatelessWidget {
  final PageController controller;

  const SelectOwnership({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    int selectedIndex =
        context.watch<SellingProcessProvider>().carOwnershipIndex;
    List<String> ownership = [
      "1st Owner",
      "2nd Owner",
      "3rd Owner",
      "I am a Car Dealer"
    ];

    return SizedBox(
      child: SingleChildScrollView(
        child: Column(
          children: [
            const Heading1(
                title1: "Select the Ownership History", title2: "of your car"),
            const SizedBox(height: 25),
            Wrap(
              spacing: 40,
              runSpacing: 15,
              children: List.generate(
                  ownership.length,
                  (index) => InkWell(
                        onTap: () {
                          Provider.of<SellingProcessProvider>(context,
                                  listen: false)
                              .setCarOwnership(
                                  ownership: ownership[index],
                                  selectedIndex: index);
                          // setState(() {
                          //   selectedIndex = index;
                          // });
                          print(index);
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 47,
                          decoration: BoxDecoration(
                            color: selectedIndex != index
                                ? Colors.white
                                : const Color(0xff9A2870),
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                              color: Color(0xffCDCDCD),
                            ),
                          ),
                          child: Center(
                              child: Text(
                            ownership[index],
                            style: selectedIndex == index
                                ? AppFonts.w500white14
                                : AppFonts.w500black14,
                          )),
                        ),
                      )),
            ),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
