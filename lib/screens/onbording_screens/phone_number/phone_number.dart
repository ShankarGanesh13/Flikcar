import 'package:flikcar/common_widgets/primary_button.dart';
import 'package:flikcar/screens/home_screen/provider/check_internet_provider.dart';
import 'package:flikcar/screens/onbording_screens/otp_screen/otp_screen.dart';
import 'package:flikcar/services/auth_service.dart';
import 'package:flikcar/utils/colors.dart';
import 'package:flikcar/utils/fonts.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PhoneNumber extends StatefulWidget {
  PhoneNumber({super.key});

  @override
  State<PhoneNumber> createState() => _PhoneNumberState();
}

class _PhoneNumberState extends State<PhoneNumber> {
  final TextEditingController controller = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  // @override
  // void initState() {
  //   Provider.of<CheckInternetProvider>(context, listen: false)
  //       .startStreaming(context);
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 100),
            const Text(
              "Login",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 40),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: TextFormField(
                controller: controller,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.only(
                      left: 12, right: 12, top: 4, bottom: 4),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  counterText: "",
                  counterStyle: const TextStyle(color: Colors.transparent),
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
            const SizedBox(height: 40),
            PrimaryButton(
              backgroundColor: AppColors.p2,
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
    ));
  }
}
