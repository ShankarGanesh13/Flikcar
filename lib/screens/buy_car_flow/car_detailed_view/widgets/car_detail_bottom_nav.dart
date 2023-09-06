import 'package:flikcar/common_widgets/snackbar.dart';
import 'package:flikcar/models/buyer_car_model.dart';
import 'package:flikcar/screens/buy_car_flow/car_detailed_view/widgets/nav_button.dart';
import 'package:flikcar/screens/buy_car_flow/schedule_test_drive/schedule_test_drive.dart';
import 'package:flikcar/services/facebook_events.dart';
import 'package:flikcar/services/firebase_events.dart';
import 'package:flikcar/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CarDetailBottomNav extends StatelessWidget {
  final BuyerCar car;
  const CarDetailBottomNav({super.key, required this.car});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.only(bottom: 10, top: 5),
        color: AppColors.s1,
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          BuyNavButton(
            icon: Icons.phone,
            title: "Contact Dealer",
            function: () async {
              FirebaseEvents().customerCallDealer(
                  customerPhone: "customer",
                  dealerPhone: car.dealerPhoneNumber!);
              FacebookEvents().customerCallDealer(
                  customerPhone: "customer",
                  dealerPhone: car.dealerPhoneNumber!);

              Uri phoneno = Uri(
                scheme: 'tel',
                path: '+91${car.dealerPhoneNumber}',
              );
              if (await launchUrl(phoneno)) {
              } else {
                if (context.mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                      MySnackbar.showSnackBar(
                          context, "Unable to open dailer"));
                }
              }
            },
          ),
          const SizedBox(
            width: 15,
          ),
          BuyNavButton(
            icon: Icons.watch_later,
            title: "Schedule Test Drive",
            function: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ScheduleTestDrive(
                      car: car,
                    ),
                  ));
            },
          )
        ]),
      ),
    );
  }
}
