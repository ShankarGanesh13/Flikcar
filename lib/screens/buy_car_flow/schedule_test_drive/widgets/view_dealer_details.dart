import 'package:flikcar/common_widgets/primary_button.dart';
import 'package:flikcar/common_widgets/snackbar.dart';
import 'package:flikcar/firebase_models/firebase_buyer_car.dart';
import 'package:flikcar/services/facebook_events.dart';
import 'package:flikcar/services/firebase_events.dart';
import 'package:flikcar/utils/colors.dart';
import 'package:flikcar/utils/fonts.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ViewDealerDeatils extends StatelessWidget {
  final FirebaseBuyerCar car;
  const ViewDealerDeatils({super.key, required this.car});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          "Dealer Info",
          style: AppFonts.w700s116,
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            const Icon(
              Icons.person,
              size: 20,
            ),
            const SizedBox(
              width: 4,
            ),
            Text(
              "Name - ",
              style: AppFonts.w700s140,
            ),
            Text(
              car.dealer.name.toString(),
              style: AppFonts.w500black14,
            ),
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        Row(
          children: [
            const Icon(
              Icons.phone,
              size: 20,
            ),
            const SizedBox(
              width: 4,
            ),
            Text(
              "Phone number - ",
              style: AppFonts.w700s140,
            ),
            Text(
              car.dealer.phone.toString(),
              style: AppFonts.w500black14,
            ),
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        Row(
          children: [
            const Icon(
              Icons.directions,
              size: 20,
            ),
            const SizedBox(
              width: 4,
            ),
            Text(
              "Address - ",
              style: AppFonts.w700s140,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 1.5,
              child: Text(
                car.dealer.address,
                style: AppFonts.w500black14,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        PrimaryButton(
            title: "Contact Dealer",
            function: () async {
              // FirebaseEvents().customerCallDealer(
              //     customerPhone: "customer",
              //     dealerPhone: car.dealerPhoneNumber!);
              // FacebookEvents().customerCallDealer(
              //     customerPhone: "customer",
              //     dealerPhone: car.dealerPhoneNumber!);
              Uri phoneno = Uri(
                scheme: 'tel',
                path: '+91${car.dealer.phone}',
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
            borderColor: Colors.transparent,
            backgroundColor: AppColors.p2,
            textStyle: AppFonts.w500white14),
      ]),
    );
  }
}
