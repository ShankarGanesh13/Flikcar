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
import 'dart:io';

import '../utils/env.dart';

class AuthService {
  static String apiUrl = Env.apiUrl;
  static sendOtp({required String phoneNumber}) async {
    var url = Uri.parse('$apiUrl/customer/get-otp');

    var requestBody = {
      'contact': phoneNumber,
    };
    var response = await http.post(url, body: requestBody);
    if (response.statusCode == 200) {
      debugPrint('Response body: ${response.body}');
    } else {
      debugPrint('Request failed with status: ${response.statusCode}');
    }
  }

  static verifyOtp(
      {required String phoneNumber,
      required String otp,
      required BuildContext context}) async {
    final SharedPreferences sp = await SharedPreferences.getInstance();

    var url = Uri.parse('$apiUrl/customer/sign-in');

    var requestBody = {
      'contact': phoneNumber,
      'otp': otp,
    };
    var response = await http.post(url, body: requestBody);

    var data = json.decode(response.body);
    if (data["status"] == 200) {
      debugPrint("customer jwt token ${data["data"]["access_token"]}");
      await sp.setString('userToken', data["data"]["access_token"]);
      await sp.setBool('isLoggedIn', true);
      await sp.setString("custPhone", phoneNumber);
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

      debugPrint("OTP verification successful");
    } else {
      debugPrint('Request failed with status: ${response.statusCode}');
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
    await sp.setString("userName", "");
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => StartScreen(),
      ),
      (route) => false,
    );
  }

  static editProfile(
      {required String fName,
      required String lName,
      required BuildContext context,
      required String contact}) async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    String? token = sp.getString("userToken");
    await sp.setString("userName", fName);
    var url = Uri.parse('$apiUrl/web/customer/update-profile');
    var requestBody = {
      'contact': contact,
      'fname': fName,
      'lname': lName,
    };
    var response = await http.post(url,
        headers: {'Authorization': 'Bearer $token'}, body: requestBody);
    var data = json.decode(response.body);

    debugPrint(data["success"]);
    if (data["success"] == true) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
            MySnackbar.showSnackBar(context, "Profile updated successfully"));
        Navigator.pop(context);
      }
    }
  }
}
