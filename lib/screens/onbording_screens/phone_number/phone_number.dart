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
import 'package:url_launcher/url_launcher.dart';

class PhoneNumber extends StatefulWidget {
  PhoneNumber({super.key});

  @override
  State<PhoneNumber> createState() => _PhoneNumberState();
}

class _PhoneNumberState extends State<PhoneNumber> {
  final TextEditingController controller = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
        child: Column(
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
                    const Heading1(
                        title1: "Login with your", title2: "mobile number"),
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
                          prefixIcon: Padding(
                            padding: const EdgeInsets.only(
                                top: 14.0, bottom: 12, left: 8),
                            child: Text(
                              "+91 - ",
                              style: AppFonts.w500black14,
                            ),
                          ),
                          counterText: "",
                          counterStyle:
                              const TextStyle(color: Colors.transparent),
                          hintText: "Enter phone number",
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
                        GestureDetector(
                          onTap: () async {
                            final Uri _url = Uri.parse(
                                "https://www.flikcar.com/terms-conditions/");
                            if (!await launchUrl(_url)) {
                              throw Exception('Could not launch $_url');
                            }
                          },
                          child: Text(
                            "terms ",
                            style: AppFonts.w500green12,
                          ),
                        ),
                        Text(
                          "and",
                          style: AppFonts.w500dark212,
                        ),
                        GestureDetector(
                          onTap: () async {
                            final Uri _url = Uri.parse(
                                "https://www.flikcar.com/privacy-policy/");
                            if (!await launchUrl(_url)) {
                              throw Exception('Could not launch $_url');
                            }
                          },
                          child: Text(
                            " privacy policy",
                            style: AppFonts.w500green12,
                          ),
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
                          AuthService.sendOtp(phoneNumber: controller.text);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => OtpScreen(
                                  phoneNumber: controller.text,
                                ),
                              ));
                        }
                      },
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
