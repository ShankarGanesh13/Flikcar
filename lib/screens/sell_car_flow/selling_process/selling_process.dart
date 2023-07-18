import 'package:flikcar/common_widgets/custom_appbar.dart';
//import 'package:flikcar/screens/sell_car_flow/selling_process/kilometers_driven/kilometers_driven.dart';
import 'package:flikcar/screens/sell_car_flow/selling_process/manufacturing_year/manufacturing_year.dart';
import 'package:flikcar/screens/sell_car_flow/selling_process/provider/selling_process_provider.dart';
import 'package:flikcar/screens/sell_car_flow/selling_process/select_brand/select_brand.dart';
import 'package:flikcar/screens/sell_car_flow/selling_process/select_car_model/select_car_model.dart';
// import 'package:flikcar/screens/sell_car_flow/selling_process/select_location/select_location.dart';
// import 'package:flikcar/screens/sell_car_flow/selling_process/select_ownership/select_ownership.dart';
// import 'package:flikcar/screens/sell_car_flow/selling_process/select_varient/select_varient.dart';
// import 'package:flikcar/screens/sell_car_flow/selling_process/selling_time/selling_time.dart';
import 'package:flikcar/screens/sell_car_flow/selling_process/widgets/nav_button.dart';
import 'package:flikcar/screens/sell_car_flow/selling_process/widgets/position_buttton.dart';
import 'package:flikcar/utils/colors.dart';
import 'package:flikcar/utils/fonts.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SellingProcess extends StatelessWidget {
  SellingProcess({super.key});
  final controller = PageController(
    initialPage: 0,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar.getAppBar(),
        bottomNavigationBar: Container(
            height: 60,
            color: AppColors.s1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                NavButton(
                  title: "Back",
                  backIcon: true,
                  function: () {
                    Provider.of<SellingProcessProvider>(context, listen: false)
                        .previousStep(controller: controller, context: context);
                  },
                ),
                const SizedBox(width: 20),
                NavButton(
                  title: context.watch<SellingProcessProvider>().counter == 3
                      ? "Finish"
                      : "Next",
                  backIcon: false,
                  function: () {
                    Provider.of<SellingProcessProvider>(context, listen: false)
                        .nextStep(controller: controller, context: context);
                  },
                )
              ],
            )),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                children: [
                  Text(
                    "Your Car Details",
                    style: AppFonts.w500dark214,
                  ),
                  const Spacer(),
                  Text(
                    "${context.watch<SellingProcessProvider>().counter}/3",
                    style: AppFonts.w500dark214,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: Align(
                alignment: Alignment.topLeft,
                child: Wrap(
                  alignment: WrapAlignment.start,
                  runAlignment: WrapAlignment.start,
                  spacing: 15,
                  runSpacing: 15,
                  children: List.generate(
                    context.watch<SellingProcessProvider>().list.length,
                    (index) => InkWell(
                      onTap: () {
                        print(index);
                      },
                      child:
                          context.watch<SellingProcessProvider>().list[index] ==
                                  ""
                              ? SizedBox()
                              : PositionButton(
                                  title: context
                                      .watch<SellingProcessProvider>()
                                      .list[index],
                                  function: () {},
                                ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(15),
                width: MediaQuery.of(context).size.width,
                child: PageView(
                  physics: const NeverScrollableScrollPhysics(),
                  controller: controller,
                  children: [
                    SelectBrandCard(
                      controller: controller,
                    ),
                    // SelectLocation(
                    //   controller: controller,
                    // ),
                    SelectCarModel(
                      controller: controller,
                    ),
                    ManufacturingYear(
                      controller: controller,
                    ),

                    // SelectVarient(
                    //   controller: controller,
                    // ),
                    // SelectOwnership(
                    //   controller: controller,
                    // ),
                    // KilometersDriven(controller: controller),
                    // SellingTime(controller: controller),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
