import 'package:flikcar/screens/onbording_screens/dealer_onboarding/dealer_otp.dart';
import 'package:flikcar/services/dealer_auth_service.dart';
import 'package:flutter/material.dart';

import 'package:flikcar/common_widgets/heading1.dart';
import 'package:flikcar/common_widgets/primary_button.dart';
import 'package:flikcar/screens/home_screen/provider/check_internet_provider.dart';
import 'package:flikcar/screens/onbording_screens/otp_screen/otp_screen.dart';
import 'package:flikcar/services/auth_service.dart';
import 'package:flikcar/utils/colors.dart';
import 'package:flikcar/utils/fonts.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DealerPhoneNumber extends StatelessWidget {
  DealerPhoneNumber({super.key});

  final TextEditingController controller = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Column(
        children: [
          SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 210,
              child: Image.asset(
                "assets/login_background.png",
                fit: BoxFit.fill,
              )),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 15),
                  const SizedBox(height: 15),
                  const Heading1(title1: "Dealer Login", title2: ""),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: TextFormField(
                      controller: controller,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.only(
                            left: 12, right: 12, top: 0, bottom: 0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        prefixStyle: AppFonts.w500black14,
                        counterText: "",
                        counterStyle:
                            const TextStyle(color: Colors.transparent),
                        hintText: "Enter mobile number",
                        prefixIcon: Padding(
                          padding: const EdgeInsets.only(
                              top: 14.0, bottom: 12, left: 8),
                          child: Text(
                            "+91 - ",
                            style: AppFonts.w500black14,
                          ),
                        ),
                      ),
                      maxLength: 10,
                      validator: (value) {
                        if (value!.length < 10) {
                          return "Enter a valid phone number";
                        } else {
                          return null;
                        }
                      },
                    ),
                  ),
                  const SizedBox(height: 15),
                  Row(
                    children: [
                      Text(
                        "By logging in, I agree to ",
                        style: AppFonts.w500dark212,
                      ),
                      Text(
                        "terms ",
                        style: AppFonts.w500green12,
                      ),
                      Text(
                        "and",
                        style: AppFonts.w500dark212,
                      ),
                      Text(
                        " privacy policy",
                        style: AppFonts.w500green12,
                      )
                    ],
                  ),
                  const SizedBox(height: 40),
                  PrimaryButton(
                    backgroundColor: AppColors.s1,
                    borderColor: Colors.transparent,
                    textStyle: AppFonts.w500white14,
                    title: "Send OTP",
                    function: () {
                      if (_formKey.currentState!.validate()) {
                        DealerAuthService.sendOtp(phoneNumber: controller.text);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DealerOtpScreen(
                                      phoneNumber: controller.text,
                                    )));
                      }
                    },
                  )
                ],
              ),
            ),
          ),
        ],
      )),
    );
  }
}
