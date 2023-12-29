import 'package:flikcar/common_widgets/custom_appbar.dart';
import 'package:flikcar/common_widgets/primary_button.dart';
import 'package:flikcar/firebase_models/firebase_buyer_car.dart';
import 'package:flikcar/screens/buy_car_flow/provider/test_drive_service.dart';
import 'package:flikcar/screens/buy_car_flow/schedule_test_drive/widgets/schedule_car_details.dart';
import 'package:flikcar/screens/buy_car_flow/schedule_test_drive/widgets/schedule_data.dart';
import 'package:flikcar/screens/buy_car_flow/schedule_test_drive/widgets/view_dealer_details.dart';
import 'package:flikcar/screens/home_screen/home_screen.dart';
import 'package:flikcar/utils/colors.dart';
import 'package:flikcar/utils/fonts.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ScheduleTestDrive extends StatelessWidget {
  final FirebaseBuyerCar car;
  const ScheduleTestDrive({super.key, required this.car});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar.getAppBar(
        function: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const HomeScreen(index: 0)));
        },
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
              padding: EdgeInsets.all(15),
              height: 51,
              width: MediaQuery.of(context).size.width,
              //   color: const Color.fromARGB(255, 242, 255, 250),
              decoration: BoxDecoration(gradient: AppColors.gradient),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(
                      Icons.chevron_left,
                      color: Color(0xff45C08D),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    "Schedule Test Drive",
                    style: AppFonts.w700black16,
                  )
                ],
              )),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ScheduleCarDetails(
                  car: car,
                ),
                const SizedBox(height: 20),
                //  const CarLocation(),
                ViewDealerDeatils(
                  car: car,
                ),
                const SizedBox(height: 20),
                const ScheduleDate(),
                const SizedBox(height: 20),
                //  const ScheduleTimeSlot(),
                const SizedBox(height: 30),
                PrimaryButton(
                    title: "Confirm Test Drive",
                    function: () {
                      Provider.of<TestDriveService>(context, listen: false)
                          .bookTestDrive(
                        context: context,
                        car: car,
                      );
                    },
                    borderColor: Colors.transparent,
                    backgroundColor: AppColors.p2,
                    textStyle: AppFonts.w500white14),
                const SizedBox(height: 20),
              ],
            ),
          )
        ]),
      ),
    );
  }
}
