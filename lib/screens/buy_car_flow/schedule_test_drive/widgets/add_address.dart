import 'package:flikcar/common_widgets/custom_appbar.dart';
import 'package:flikcar/common_widgets/primary_button.dart';
import 'package:flikcar/screens/home_screen/home_screen.dart';
import 'package:flikcar/screens/sell_car_flow/selling_process/widgets/my_text_field.dart';
import 'package:flikcar/utils/colors.dart';
import 'package:flikcar/utils/fonts.dart';
import 'package:flutter/material.dart';

class AddAddress extends StatelessWidget {
  const AddAddress({super.key});

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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                height: 50,
                width: MediaQuery.of(context).size.width,
                color: const Color.fromARGB(255, 234, 255, 246),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.chevron_left,
                          color: AppColors.p2,
                        ),
                      ),
                    ),
                    Text(
                      "Add Address for Test  Drive at Home",
                      style: AppFonts.w700black16,
                    )
                  ],
                )),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Where should we bring the car?",
                    style: AppFonts.w700black16,
                  ),
                  const SizedBox(height: 10),
                  const MyTextField(hint: "Enter your Address", maxlength: 50),
                  const SizedBox(height: 20),
                  PrimaryButton(
                      title: "Confirm Address",
                      function: () {},
                      borderColor: Colors.transparent,
                      backgroundColor: AppColors.p2,
                      textStyle: AppFonts.w500white14),
                  const SizedBox(height: 30),
                  Text(
                    "Your Addresses",
                    style: AppFonts.w700black16,
                  ),
                  const Divider(
                    color: Colors.black,
                    thickness: 1,
                    height: 25,
                  ),
                  Row(
                    children: [
                      const Icon(Icons.location_on, color: Colors.black),
                      const SizedBox(width: 5),
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "47, Lenin Sarani Kolkata 700013",
                              style: AppFonts.w500black14,
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            Text(
                              "West Bengal , India",
                              style: AppFonts.w500black10,
                            )
                          ])
                    ],
                  )
                ],
              ),
            ),
          ],
        ));
  }
}
