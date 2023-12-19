import 'dart:convert';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flikcar/common_widgets/snackbar.dart';
import 'package:flikcar/screens/dealers_flow/dealer_flow.dart';
import 'package:flikcar/screens/dealers_flow/not_verified_dealer/not_verified_delaer.dart';
import 'package:flikcar/screens/onbording_screens/dealer_onboarding/dealer_details.dart';
import 'package:flikcar/screens/onbording_screens/phone_number/phone_number.dart';
import 'package:flikcar/screens/start_screen/start_screen.dart';
import 'package:flikcar/utils/env.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class DealerAuthService {
  static dealerLogout(context) async {
    final SharedPreferences sp = await SharedPreferences.getInstance();

    FirebaseAuth auth = FirebaseAuth.instance;
    auth.signOut();
    ScaffoldMessenger.of(context).showSnackBar(
        MySnackbar.showSnackBar(context, "Logged out successfully"));
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => PhoneNumber(),
      ),
      (route) => false,
    );
  }

  static deleteAccount(context) async {
    FirebaseAuth auth = FirebaseAuth.instance;

    final SharedPreferences sp = await SharedPreferences.getInstance();
    await sp.setBool('dealerIsLoggedIn', false);
    await sp.setString("dealerToken", "logged out");
    await sp.setString("dealerStatus", "logged out");
    await sp.setString("profileStatus", "");
    await sp.setString("dealerPhone", "");
    auth.signOut();
    ScaffoldMessenger.of(context).showSnackBar(MySnackbar.showSnackBar(context,
        "Delete request has be submitted. Account will be deleted in 24 hrs. Thank you"));
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => StartScreen(),
      ),
      (route) => false,
    );
  }
}
