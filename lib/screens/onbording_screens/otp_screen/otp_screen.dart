import 'package:flikcar/common_widgets/custom_appbar.dart';
import 'package:flikcar/common_widgets/primary_button.dart';
import 'package:flikcar/screens/start_screen/start_screen.dart';
import 'package:flikcar/services/auth_service.dart';
import 'package:flikcar/utils/colors.dart';
import 'package:flikcar/utils/fonts.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:otp_timer_button/otp_timer_button.dart';

class OtpScreen extends StatelessWidget {
  final String phoneNumber;
  OtpScreen({super.key, required this.phoneNumber});
  final TextEditingController controller = TextEditingController();
  final defaultPinTheme = PinTheme(
    width: 56,
    height: 56,
    textStyle: AppFonts.w500black14,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(19),
      border: Border.all(color: const Color(0xffE0E0E0)),
    ),
  );
  final Color focusedBorderColor = const Color(0xff9A2870);
  final Color fillColor = Colors.white;
  final Color borderColor = const Color(0xffE0E0E0);
  final OtpTimerButtonController resendOtpController =
      OtpTimerButtonController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar.getAppBar(
          function: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => StartScreen()));
          },
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 150),
                const Text(
                  "OTP Verification",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                ),
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Enter the OTP sent to ",
                      style: AppFonts.w500black14,
                    ),
                    Text(
                      phoneNumber,
                      style: AppFonts.w700black14,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        " EDIT",
                        style: AppFonts.w500green14,
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 20),
                FractionallySizedBox(
                  widthFactor: 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Directionality(
                        textDirection: TextDirection.ltr,
                        child: Pinput(
                          length: 6,
                          controller: controller,
                          androidSmsAutofillMethod:
                              AndroidSmsAutofillMethod.smsUserConsentApi,
                          listenForMultipleSmsOnAndroid: true,
                          defaultPinTheme: defaultPinTheme,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Enter valid OTP";
                            }
                            if (value.length < 6) {
                              return "Enter valid OTP";
                            }
                            return null;
                          },
                          hapticFeedbackType: HapticFeedbackType.lightImpact,
                          cursor: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                margin: const EdgeInsets.only(bottom: 9),
                                width: 22,
                                height: 1,
                                color: const Color(0xffE0E0E0),
                              ),
                            ],
                          ),
                          disabledPinTheme: defaultPinTheme.copyWith(
                            decoration: defaultPinTheme.decoration!.copyWith(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                color: const Color(0xffE0E0E0),
                              ),
                            ),
                          ),
                          focusedPinTheme: defaultPinTheme.copyWith(
                            decoration: defaultPinTheme.decoration!.copyWith(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                color: focusedBorderColor,
                              ),
                            ),
                          ),
                          submittedPinTheme: defaultPinTheme.copyWith(
                            decoration: defaultPinTheme.decoration!.copyWith(
                              color: fillColor,
                              borderRadius: BorderRadius.circular(19),
                              border: Border.all(
                                color: focusedBorderColor,
                              ),
                            ),
                          ),
                          errorPinTheme: defaultPinTheme.copyBorderWith(
                            border: Border.all(
                              color: Colors.redAccent,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Align(
                  alignment: Alignment.centerRight,
                  child: OtpTimerButton(
                    controller: resendOtpController,
                    onPressed: () {
                      AuthService.sendOtp(phoneNumber: phoneNumber);
                    },
                    text: Text(
                      'Resend OTP ',
                      style: AppFonts.w500black14,
                    ),
                    backgroundColor: Colors.white,
                    buttonType: ButtonType.text_button,
                    duration: 60,
                  ),
                ),
                const SizedBox(height: 20),
                PrimaryButton(
                  title: "Verify OTP",
                  backgroundColor: AppColors.s1,
                  borderColor: Colors.transparent,
                  textStyle: AppFonts.w500white14,
                  function: () {
                    AuthService.verifyOtp(
                        phoneNumber: phoneNumber,
                        otp: controller.text,
                        context: context);
                  },
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ));
  }
}
