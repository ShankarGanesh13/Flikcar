import 'package:flikcar/common_widgets/custom_appbar.dart';
import 'package:flikcar/common_widgets/primary_button.dart';
import 'package:flikcar/screens/start_screen/start_screen.dart';
import 'package:flikcar/services/dealer_auth_service.dart';
import 'package:flikcar/utils/colors.dart';
import 'package:flikcar/utils/fonts.dart';
import 'package:flutter/material.dart';

class NotVerifiedDealer extends StatelessWidget {
  const NotVerifiedDealer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.getAppBar(
        function: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => StartScreen()));
        },
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 50,
            ),
            Center(
              child: Text(
                "Your Dealer Profile is not verified please contact our support team",
                style: AppFonts.w700black16,
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Center(
              child: Text(
                "( Once your profile is verified please logout and try again )",
                style: AppFonts.w500black14,
                textAlign: TextAlign.center,
              ),
            ),
            const Spacer(),
            PrimaryButton(
                title: "Logout",
                function: () {
                  DealerAuthService.dealerLogout(context);
                },
                borderColor: Colors.white,
                backgroundColor: AppColors.s1,
                textStyle: AppFonts.w700white16)
          ],
        ),
      ),
    );
  }
}
