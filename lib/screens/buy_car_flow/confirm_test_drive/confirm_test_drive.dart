import 'package:flikcar/common_widgets/custom_appbar.dart';
import 'package:flikcar/common_widgets/icon_elevated_button.dart';
import 'package:flikcar/common_widgets/primary_button.dart';
import 'package:flikcar/screens/buy_car_flow/cancel_test_drive/cancel_test_drive.dart';
import 'package:flikcar/screens/buy_car_flow/schedule_test_drive/widgets/schedule_car_details.dart';
import 'package:flikcar/screens/home_screen/home_screen.dart';
import 'package:flikcar/utils/colors.dart';
import 'package:flikcar/utils/fonts.dart';
import 'package:flutter/material.dart';

class ConfirmTestDrive extends StatelessWidget {
  const ConfirmTestDrive({super.key});

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
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              const SizedBox(height: 15),
              Row(
                children: [
                  const CircleAvatar(
                      radius: 12,
                      backgroundColor: Color(0xff45C08D),
                      child: Icon(
                        Icons.check,
                        color: Colors.white,
                      )),
                  const SizedBox(width: 10),
                  Text(
                    "Test Drive Confirmed",
                    style: AppFonts.w700black16,
                  ),
                ],
              ),
              const SizedBox(height: 15),
              //  const ScheduleCarDetails(),
              const SizedBox(height: 50),
              testDriveDetails(
                  title: "Location",
                  subtitle: "47, Lenin Sarani Kolkata 700013",
                  icon: Icons.location_on),
              testDriveDetails(
                  title: "Date",
                  subtitle: "Thursday, 25 May 2023",
                  icon: Icons.calendar_month),
              testDriveDetails(
                  title: "Time",
                  subtitle: "Between  5 pm - 6pm",
                  icon: Icons.location_on),
              PrimaryButton(
                  title: "Continue",
                  function: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomeScreen(
                          index: 0,
                        ),
                      ),
                      (route) => false,
                    );
                  },
                  borderColor: Colors.transparent,
                  backgroundColor: AppColors.p2,
                  textStyle: AppFonts.w500white14),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 2.3,
                    child: IconElevatedButton(
                        title: "Reschedule",
                        function: () {
                          Navigator.pop(context);
                        },
                        borderColor: Colors.black,
                        backgroundColor: Colors.white,
                        textStyle: AppFonts.w500black14,
                        icon: Icons.watch_later),
                  ),
                  const Spacer(),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 2.3,
                    child: IconElevatedButton(
                        title: "Cancel",
                        function: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const CancelTestDrive()));
                        },
                        borderColor: Colors.black,
                        backgroundColor: Colors.white,
                        textStyle: AppFonts.w500black14,
                        icon: Icons.close),
                  ),
                ],
              )
            ],
          ),
        ));
  }

  Widget testDriveDetails(
      {required String title,
      required String subtitle,
      required IconData icon}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            icon,
            color: AppColors.p2,
          ),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: AppFonts.w700black16,
              ),
              const SizedBox(height: 5),
              Text(
                subtitle,
                style: AppFonts.w500dark214,
              )
            ],
          )
        ],
      ),
    );
  }
}
