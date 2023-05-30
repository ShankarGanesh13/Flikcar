import 'package:flikcar/common_widgets/custom_appbar.dart';
import 'package:flikcar/common_widgets/primary_button.dart';
import 'package:flikcar/screens/home_screen/home_screen.dart';
import 'package:flikcar/utils/colors.dart';
import 'package:flikcar/utils/fonts.dart';
import 'package:flutter/material.dart';

class CancelledScreen extends StatelessWidget {
  const CancelledScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar.getAppBar(),
        body: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 241,
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
              padding: const EdgeInsets.all(16),
              child: Container(
                  padding: const EdgeInsets.all(15),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Appointment id #11925310780",
                        style: AppFonts.w500dark214,
                      ),
                      const SizedBox(height: 15),
                      Text(
                        "We have cancelled the inspection as per your request.",
                        style: AppFonts.w700black16,
                      ),
                      const SizedBox(height: 15),
                      Row(
                        children: [
                          const Icon(Icons.car_rental),
                          const Spacer(),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 1.3,
                            child: Text(
                              "LXI O [2016-2019], 40k-50k km, Petrol Manual Transmission, 2nd owner, After 2 weeks",
                              style: AppFonts.w500black14,
                            ),
                          )
                        ],
                      ),
                    ],
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 15, top: 40),
              child: PrimaryButton(
                backgroundColor: AppColors.p2,
                borderColor: Colors.transparent,
                textStyle: AppFonts.w500white14,
                function: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HomeScreen(index: 1)));
                },
                title: "Continue",
              ),
            )
          ],
        ));
  }
}
