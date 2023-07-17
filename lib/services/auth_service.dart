import 'dart:convert';
import 'package:flikcar/common_widgets/snackbar.dart';
import 'package:flikcar/screens/home_screen/home_screen.dart';
import 'package:flikcar/screens/onbording_screens/phone_number/phone_number.dart';
import 'package:flikcar/screens/start_screen/start_screen.dart';
import 'package:flikcar/utils/colors.dart';
import 'package:flikcar/utils/fonts.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class AuthService {
  static sendOtp({required String phoneNumber}) async {
    var url =
        Uri.parse('http://webservice.flikcar.com:8000/api/customer/get-otp');

    var requestBody = {
      'contact': phoneNumber,
    };
    var response = await http.post(url, body: requestBody);
    if (response.statusCode == 200) {
      print('Response body: ${response.body}');
    } else {
      print('Request failed with status: ${response.statusCode}');
    }
  }

  static verifyOtp(
      {required String phoneNumber,
      required String otp,
      required BuildContext context}) async {
    final SharedPreferences sp = await SharedPreferences.getInstance();

    var url =
        Uri.parse('http://webservice.flikcar.com:8000/api/customer/sign-in');

    var requestBody = {
      'contact': phoneNumber,
      'otp': otp,
    };
    var response = await http.post(url, body: requestBody);

    var data = json.decode(response.body);
    if (data["status"] == 200) {
      print(data);
      await sp.setString('userToken', data["data"]["access_token"]);
      await sp.setBool('isLoggedIn', true);
      if (context.mounted) {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => const HomeScreen(
              index: 0,
            ),
          ),
          (route) => false,
        );
        ScaffoldMessenger.of(context).showSnackBar(
            MySnackbar.showSnackBar(context, "Logged in successfully"));
      }

      print("OTP verification successful");
    } else {
      print('Request failed with status: ${response.statusCode}');
      if (context.mounted) {
        ScaffoldMessenger.of(context)
            .showSnackBar(MySnackbar.showSnackBar(context, "Invalid OTP"));
      }

      await sp.setBool('isLoggedIn', false);
    }
  }

  static signout(context) async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    await sp.setBool('isLoggedIn', false);
    await sp.setString("userToken", "logged out");
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const StartScreen()));
  }
}
