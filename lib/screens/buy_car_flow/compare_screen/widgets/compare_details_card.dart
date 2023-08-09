import 'package:favorite_button/favorite_button.dart';
import 'package:flikcar/common_widgets/primary_button.dart';
import 'package:flikcar/utils/colors.dart';
import 'package:flikcar/utils/fonts.dart';
import 'package:flutter/material.dart';

class CompareDetailsCard extends StatelessWidget {
  const CompareDetailsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: MediaQuery.of(context).size.width / 2.3,
        height: 239,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
                height: 107,
                width: MediaQuery.of(context).size.width / 2.3,
                child: Image.asset(
                  "assets/sample_car/tigor1.png",
                  fit: BoxFit.fill,
                )),
            const SizedBox(height: 8),
            Row(
              children: [
                Text(
                  "Car Name",
                  style: AppFonts.w700black16,
                ),
                Spacer(),
                FavoriteButton(iconSize: 20, valueChanged: (_) {})
              ],
            ),
            const SizedBox(height: 5),
            Text(
              "Variant name",
              style: AppFonts.w500dark214,
            ),
            const Spacer(),
            PrimaryButton(
                title: "Contact Dealer",
                function: () {
                  
                },
                borderColor: AppColors.s1,
                backgroundColor: Colors.white,
                textStyle: AppFonts.w500s114),
            const SizedBox(height: 20)
          ],
        ));
  }
}
