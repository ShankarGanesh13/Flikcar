import 'package:flikcar/common_widgets/primary_button.dart';
import 'package:flikcar/screens/onbording_screens/otp_screen/otp_screen.dart';  
import 'package:flutter/material.dart';

class PhoneNumber extends StatelessWidget {
  PhoneNumber({super.key});
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(16.0),
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
            height: 50,
            child: TextFormField(
              controller: controller,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.only(
                    left: 12, right: 12, top: 4, bottom: 4),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                counterText: "",
                counterStyle: const TextStyle(color: Colors.transparent),
                hintText: "Enter phone number",
              ),
              maxLength: 10,
            ),
          ),
          const SizedBox(height: 40),
          PrimaryButton(
            title: "Send OTP",
            function: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => OtpScreen()));
            },
          )
        ],
      ),
    ));
  }
}
