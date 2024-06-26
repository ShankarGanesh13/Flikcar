import 'dart:convert';
import 'dart:io';

import 'package:flikcar/common_widgets/snackbar.dart';
import 'package:flikcar/screens/dealers_flow/dealer_flow.dart';
import 'package:flikcar/screens/dealers_flow/not_verified_dealer/not_verified_delaer.dart';
import 'package:flikcar/screens/onbording_screens/dealer_onboarding/dealer_details.dart';
import 'package:flikcar/screens/start_screen/start_screen.dart';
import 'package:flikcar/utils/env.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class DealerAuthService {
  // static sendOtp({required String phoneNumber}) async {
  //   var url = Uri.parse(
  //       '$apiUrl/dealer/auth/get-otp');

  //   var requestBody = {
  //     'contact': phoneNumber,
  //   };
  //   var response = await http.post(url, body: requestBody);

  //   if (response.statusCode == 200) {
  //     debugPrint('Response body: ${response.body}');
  //   } else {
  //     debugPrint('Request failed with status: ${response.statusCode}');
  //   }
  // }
  static String apiUrl = Env.apiUrl;
  static sendOtp({required String phoneNumber}) async {
    var url = Uri.parse('$apiUrl/dealer/auth/get-otp');

    var headers = {
      'Content-Type': 'application/json',
    };

    var requestBody = {
      'contact': phoneNumber,
    };

    try {
      var response =
          await http.post(url, headers: headers, body: jsonEncode(requestBody));

      if (response.statusCode == 200) {
        debugPrint('Response body: ${response.body}');
      } else {
        debugPrint('Request failed with status: ${response.statusCode}');
        // Handle other error cases or responses here
      }
    } catch (e) {
      debugPrint('Error: $e');
      // Handle network errors or other exceptions here
    }
  }
  // $apiUrl/dealer/auth/get-otp

  static verifyOtp(
      {required String phoneNumber,
      required String otp,
      required BuildContext context}) async {
    final SharedPreferences sp = await SharedPreferences.getInstance();

    var url = Uri.parse('$apiUrl/dealer/auth/sign-in');

    var requestBody = {
      'contact': phoneNumber,
      'otp': otp,
    };
    var response = await http.post(url, body: requestBody);

    var data = json.decode(response.body);

    if (data["status"] == 200) {
      debugPrint("dealer jwt token ${data["data"]["access_token"]}");

      await sp.setString('dealerToken', data["data"]["access_token"]);
      await sp.setBool('dealerIsLoggedIn', true);
      await sp.setString("dealerPhone", phoneNumber);

      await sp.setString('dealerStatus', data["data"]["profileStatus"]);
      debugPrint("|||||||||||||||||||||||||");
      debugPrint("dealer profile status ${data["data"]["profileStatus"]}");
      if (context.mounted) {
        if (data["data"]["profileStatus"] == "Complete") {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => const DealerFlow(
                index: 0,
              ),
            ),
            (route) => false,
          );
          ScaffoldMessenger.of(context).showSnackBar(
              MySnackbar.showSnackBar(context, "Logged in successfully"));
        }
        if (data["data"]["profileStatus"] == "Submitted") {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const NotVerifiedDealer()),
            (route) => false,
          );
        }
        if (data["data"]["profileStatus"] == "Pending") {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DealerDetails(),
              ));
        }
      }

      debugPrint("OTP verification successful");
    } else {
      print('Request failed with status: ${response.statusCode}');
      if (context.mounted) {
        ScaffoldMessenger.of(context)
            .showSnackBar(MySnackbar.showSnackBar(context, "Invalid OTP"));
      }

      await sp.setBool('dealerIsLoggedIn', false);
    }
  }

  static dealerLogout(context) async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    await sp.setBool('dealerIsLoggedIn', false);
    await sp.setString("dealerToken", "logged out");
    await sp.setString("dealerStatus", "logged out");
    await sp.setString("profileStatus", "");
    await sp.setString("dealerPhone", "");
    ScaffoldMessenger.of(context).showSnackBar(
        MySnackbar.showSnackBar(context, "Logged out successfully"));
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => StartScreen(),
      ),
      (route) => false,
    );
  }
}
