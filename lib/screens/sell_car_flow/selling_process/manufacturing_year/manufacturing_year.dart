import 'package:flikcar/common_widgets/heading1.dart';
import 'package:flikcar/common_widgets/secondary_button.dart';
import 'package:flikcar/screens/sell_car_flow/selling_process/provider/selling_process_provider.dart';
import 'package:flikcar/screens/sell_car_flow/selling_process/widgets/my_text_field.dart';
import 'package:flikcar/utils/colors.dart';
import 'package:flikcar/utils/fonts.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ManufacturingYear extends StatelessWidget {
  final PageController controller;
  const ManufacturingYear({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    int selectedIndex =
        context.watch<SellingProcessProvider>().manufacturingYearIndex;
    return SizedBox(
      child: SingleChildScrollView(
        child: Column(
          children: [
            const Heading1(
                title1: "Select your car", title2: "Manufacturing Year"),
            const SizedBox(height: 20),
            const MyTextField(hint: "Enter manufacturing year", maxlength: 4),
            const SizedBox(height: 10),
            Wrap(
              spacing: 40,
              runSpacing: 15,
              children: List.generate(
                  7,
                  (index) => InkWell(
                        onTap: () {
                          Provider.of<SellingProcessProvider>(context,
                                  listen: false)
                              .setManufacturingYear(
                                  year: "2023", selectedIndex: index);

                          print(index);
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 47,
                          decoration: BoxDecoration(
                              color: selectedIndex != index
                                  ? Colors.white
                                  : AppColors.p2,
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(
                                color: AppColors.grey,
                              )),
                          child: Center(
                              child: Text(
                            "2023",
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
