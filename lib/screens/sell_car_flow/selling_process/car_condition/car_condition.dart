import 'package:flikcar/common_widgets/custom_appbar.dart';
import 'package:flikcar/common_widgets/primary_button.dart';
import 'package:flikcar/screens/sell_car_flow/selling_process/book_evaluation/book_evaluation.dart';
import 'package:flikcar/screens/sell_car_flow/selling_process/car_condition/widgets/expected_price.dart';
import 'package:flikcar/screens/sell_car_flow/selling_process/car_condition/widgets/select_condition.dart';
import 'package:flikcar/screens/sell_car_flow/selling_process/splash_screen.dart/splash_screen.dart';
import 'package:flikcar/utils/fonts.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/selling_process_provider.dart';

class CarCondition extends StatelessWidget {
  const CarCondition({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar.getAppBar(),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(15),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [
                      const Color(0xff100049).withOpacity(0.10),
                      const Color(0xffB70050).withOpacity(0.10),
                    ],
                  ),
                ),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            "${context.watch<SellingProcessProvider>().list[2]} ${context.watch<SellingProcessProvider>().list[0]} ${context.watch<SellingProcessProvider>().list[3]}",
                            style: AppFonts.w700black16,
                          ),
                          const Spacer(),
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Text(
                              "EDIT",
                              style: AppFonts.w700p216,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        "${context.watch<SellingProcessProvider>().list[6]}, ${context.watch<SellingProcessProvider>().list[4]}, ${context.watch<SellingProcessProvider>().list[5]}, ${context.watch<SellingProcessProvider>().list[7]}, ${context.watch<SellingProcessProvider>().list[8]}, ${context.watch<SellingProcessProvider>().list[9]}",
                        style: AppFonts.w500dark214,
                      ),
                    ]),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SelectCondition(),
                    const SizedBox(
                      height: 15,
                    ),
                    ExpectedPrice(),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 3.6,
                      child: Image.asset("assets/know_more.png"),
                    ),
                    Text(
                      "Next Step",
                      style: AppFonts.w500dark214,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        const Icon(Icons.calendar_month_outlined),
                        const SizedBox(
                          width: 4,
                        ),
                        Text(
                          "Book an appointment for inspection",
                          style: AppFonts.w500black14,
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    PrimaryButton(
                        title: "Proceed",
                        function: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SplashScreen(),
                            ),
                          );
                        }),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
