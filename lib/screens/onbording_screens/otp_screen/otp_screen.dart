import 'package:firebase_auth/firebase_auth.dart';
import 'package:flikcar/common_widgets/custom_appbar.dart';
import 'package:flikcar/common_widgets/primary_button.dart';
import 'package:flikcar/common_widgets/snackbar.dart';
import 'package:flikcar/screens/start_screen/start_screen.dart';
import 'package:flikcar/services/firebase_auction_service/firebase_auction_service.dart';
import 'package:flikcar/services/firebase_auth_service/firebase_auth_service.dart';
import 'package:flikcar/utils/colors.dart';
import 'package:flikcar/utils/fonts.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:otp_timer_button/otp_timer_button.dart';

class OtpScreen extends StatefulWidget {
  final String phoneNumber;
  OtpScreen({super.key, required this.phoneNumber});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  @override
  void initState() {
    verifyUserPhoneNumber(
      phoneNumber: widget.phoneNumber,
      context: context,
    );
    // TODO: implement initState
    super.initState();
  }

  final TextEditingController controller = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;
  String receivedID = "";

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
                      widget.phoneNumber,
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
                          // androidSmsAutofillMethod:
                          //     AndroidSmsAutofillMethod.smsUserConsentApi,
                          // listenForMultipleSmsOnAndroid: true,
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
                      verifyUserPhoneNumber(
                        phoneNumber: widget.phoneNumber,
                        context: context,
                      );
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
                    verifyOTPCode(otp: controller.text);
                    // AuthService.verifyOtp(
                    //     phoneNumber: phoneNumber,
                    //     otp: controller.text,
                    //     context: context);
                  },
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ));
  }

  void verifyUserPhoneNumber(
      {required String phoneNumber, required BuildContext context}) {
    auth.verifyPhoneNumber(
      phoneNumber: "+91$phoneNumber",
      verificationCompleted: (PhoneAuthCredential credential) async {
        await auth.signInWithCredential(credential).then(
              (value) => {
                FirebaseAuthService.createUserInFirestore(
                    userId: auth.currentUser!.uid,
                    phoneNumber: widget.phoneNumber,
                    context: context)
                // ScaffoldMessenger.of(context).showSnackBar(
                //     MySnackbar.showSnackBar(context, "Logged in successfully"))
              },
            );
      },
      verificationFailed: (FirebaseAuthException e) {
        print(e);
        ScaffoldMessenger.of(context).showSnackBar(MySnackbar.showSnackBar(
            context, "Something went wrong please try again"));
      },
      codeSent: (String verificationId, int? resendToken) {
        ScaffoldMessenger.of(context)
            .showSnackBar(MySnackbar.showSnackBar(context, "OTP sent"));
        receivedID = verificationId;
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  Future<void> verifyOTPCode({
    required String otp,
  }) async {
    print("-----------------------------------$receivedID");
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
      verificationId: receivedID,
      smsCode: otp,
    );
    try {
      await auth.signInWithCredential(credential).then((value) => {
            FirebaseAuthService.createUserInFirestore(
                userId: auth.currentUser!.uid,
                phoneNumber: widget.phoneNumber,
                context: context)
          });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
          MySnackbar.showSnackBar(context, "Invalid OTP please try again"));
    }
  }
}
