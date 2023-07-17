import 'package:flikcar/common_widgets/custom_appbar.dart';
import 'package:flikcar/common_widgets/primary_button.dart';
import 'package:flikcar/models/buyer_car_model.dart';
import 'package:flikcar/screens/buy_car_flow/car_detailed_view/widgets/buy_car_details.dart';
import 'package:flikcar/screens/buy_car_flow/confirm_test_drive/confirm_test_drive.dart';
import 'package:flikcar/screens/buy_car_flow/provider/buy_car_provider.dart';
import 'package:flikcar/screens/buy_car_flow/schedule_test_drive/widgets/car_location.dart';
import 'package:flikcar/screens/buy_car_flow/schedule_test_drive/widgets/schedule_car_details.dart';
import 'package:flikcar/screens/buy_car_flow/schedule_test_drive/widgets/schedule_data.dart';
import 'package:flikcar/screens/buy_car_flow/schedule_test_drive/widgets/schedule_time_slot.dart';
import 'package:flikcar/screens/buy_car_flow/schedule_test_drive/widgets/view_dealer_details.dart';
import 'package:flikcar/screens/sell_car_flow/selling_process/book_evaluation/widgets/car_details.dart';
import 'package:flikcar/services/get_car_details.dart';
import 'package:flikcar/utils/colors.dart';
import 'package:flikcar/utils/fonts.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ScheduleTestDrive extends StatelessWidget {
  final BuyerCar car;
  const ScheduleTestDrive({super.key, required this.car});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar.getAppBar(),
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
              padding: EdgeInsets.all(15),
              height: 51,
              width: MediaQuery.of(context).size.width,
              color: const Color.fromARGB(255, 242, 255, 250),
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
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const ScheduleCarDetails(),
                const SizedBox(height: 20),
                //  const CarLocation(),
                ViewDealerDeatils(
                  car: car,
                ),
                const SizedBox(height: 20),
                ScheduleDate(),
                const SizedBox(height: 20),
                //  const ScheduleTimeSlot(),
                const SizedBox(height: 30),
                PrimaryButton(
                    title: "Confirm Test Drive",
                    function: () {
                      Provider.of<BuyCarProvider>(context, listen: false)
                          .bookTestDrive(
                        vehicleId: car.id,
                        dealerId: int.parse(car.dealerId),
                      );
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //       builder: (context) => const ConfirmTestDrive(),
                      //     ));
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
