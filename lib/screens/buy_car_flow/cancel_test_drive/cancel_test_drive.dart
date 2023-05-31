import 'package:flikcar/common_widgets/custom_appbar.dart';
import 'package:flikcar/common_widgets/primary_button.dart';
import 'package:flikcar/screens/buy_car_flow/booking_cancelled/booking_cancelled.dart';
import 'package:flikcar/screens/buy_car_flow/car_detailed_view/widgets/buy_car_details.dart';
import 'package:flikcar/screens/buy_car_flow/schedule_test_drive/widgets/schedule_car_details.dart';
import 'package:flikcar/utils/colors.dart';
import 'package:flikcar/utils/fonts.dart';
import 'package:flutter/material.dart';

class CancelTestDrive extends StatelessWidget {
  const CancelTestDrive({super.key});
  static List<String> reason = [
    "Car Finance/Loan issue",
    "Retailer related issue",
    "Found a better car",
    "Test Drive issue",
    "My reason is not listed",
    "Registration Transfer issue",
    "Inadequate staff assistance",
    "Car related issue"
  ];
  final selectedIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar.getAppBar(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                width: MediaQuery.of(context).size.width,
                color: const Color.fromARGB(255, 240, 255, 249),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.chevron_left,
                        color: AppColors.p2,
                        size: 28,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      "Reason for cancellation",
                      style: AppFonts.w700black16,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    const ScheduleCarDetails(),
                    const SizedBox(height: 30),
                    Text(
                        "Please let us know your reason for cancelling the test drive.",
                        style: AppFonts.w700black16),
                    const SizedBox(height: 30),
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
                                        : AppColors.p2,
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(
                                      color: AppColors.grey,
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
                    const SizedBox(height: 50),
                    PrimaryButton(
                        title: "Cancel and Continue",
                        function: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const BookingCancelled(),
                              ));
                        },
                        borderColor: Colors.transparent,
                        backgroundColor: AppColors.p2,
                        textStyle: AppFonts.w500white14)
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
