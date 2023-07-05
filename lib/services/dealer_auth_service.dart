import 'dart:convert';

import 'package:flikcar/common_widgets/snackbar.dart';
import 'package:flikcar/screens/dealers_flow/dealer_flow.dart';
import 'package:flikcar/screens/onbording_screens/dealer_onboarding/dealer_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class DealerAuthService {
  static sendOtp({required String phoneNumber}) async {
    var url =
        Uri.parse('http://webservice.flikcar.com:8000/api/dealer/auth/get-otp');

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
        Uri.parse('http://webservice.flikcar.com:8000/api/dealer/auth/sign-in');

    var requestBody = {
      'contact': phoneNumber,
      'otp': otp,
    };
    var response = await http.post(url, body: requestBody);

    var data = json.decode(response.body);
    if (data["status"] == 200) {
      await sp.setString('delaerToken', data["data"]["access_token"]);
      await sp.setBool('dealerIsLoggedIn', true);
      await sp.setString('dealerStatus', data["data"]["profileStatus"]);
      if (context.mounted) {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DealerDetails(),
            ));
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
}
