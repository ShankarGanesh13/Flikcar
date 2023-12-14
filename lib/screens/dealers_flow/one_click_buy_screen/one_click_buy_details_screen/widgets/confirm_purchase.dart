import 'package:flikcar/common_widgets/primary_button.dart';
import 'package:flikcar/services/firebase_auction_service/firebase_auction_service.dart';
import 'package:flikcar/services/firebase_auth_service/firebase_auth_service.dart';
import 'package:flikcar/utils/colors.dart';
import 'package:flikcar/utils/fonts.dart';
import 'package:flutter/material.dart';

class ConfirmPurchase extends StatelessWidget {
  final String carId;
  final int carPrice;
  const ConfirmPurchase(
      {super.key, required this.carId, required this.carPrice});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 280,
      padding: const EdgeInsets.all(15.0),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.zero, // Set border radius to zero
      ),
      child: Column(
        children: [
          SizedBox(
            height: 80,
            width: 120,
            child: Image.asset(
              "assets/blue_logo.png",
              fit: BoxFit.contain,
            ),
          ),
          Text(
            'Are you sure you want to complete the purchase ?',
            style: AppFonts.w500black16,
          ),
          const SizedBox(height: 16.0),
          PrimaryButton(
            title: "Buy Now",
            function: () {
              FirebaseAuctionService()
                  .oneClickBuy(carId: carId, price: carPrice, context: context);
            },
            borderColor: Colors.white,
            backgroundColor: AppColors.s1,
            textStyle: AppFonts.w500white14,
          ),
          const SizedBox(
            height: 8,
          ),
          PrimaryButton(
            title: "Cancel",
            function: () {
              Navigator.pop(context);
            },
            borderColor: AppColors.s1,
            backgroundColor: Colors.white,
            textStyle: AppFonts.w500s114,
          ),
        ],
      ),
    );
    ;
  }
}
