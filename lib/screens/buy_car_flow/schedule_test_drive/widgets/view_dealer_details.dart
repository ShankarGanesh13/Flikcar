import 'package:flikcar/common_widgets/primary_button.dart';
import 'package:flikcar/common_widgets/snackbar.dart';
import 'package:flikcar/models/buyer_car_model.dart';
import 'package:flikcar/utils/colors.dart';
import 'package:flikcar/utils/fonts.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ViewDealerDeatils extends StatelessWidget {
  final BuyerCar car;
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
              car.dealerName.toString(),
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
              car.dealerPhoneNumber.toString(),
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
            Text(
              car.dealerAddress.toString(),
              style: AppFonts.w500black14,
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        PrimaryButton(
            title: "Contact Dealer",
            function: () async {
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
            borderColor: Colors.transparent,
            backgroundColor: AppColors.p2,
            textStyle: AppFonts.w500white14),
      ]),
    );
  }
}
