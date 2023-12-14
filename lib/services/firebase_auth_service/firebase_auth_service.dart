import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flikcar/common_widgets/snackbar.dart';
import 'package:flikcar/screens/dealers_flow/dealer_flow.dart';
import 'package:flikcar/screens/dealers_flow/not_verified_dealer/not_verified_delaer.dart';
import 'package:flikcar/screens/home_screen/home_screen.dart';
import 'package:flikcar/screens/onbording_screens/dealer_onboarding/dealer_details.dart';
import 'package:flikcar/screens/onbording_screens/otp_screen/otp_screen.dart';
import 'package:flikcar/screens/start_screen/start_screen.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FirebaseAuthService {
  String receivedID = "";
  static FirebaseAuth auth = FirebaseAuth.instance;

  static Future<void> createUserInFirestore(
      {required String? userId,
      required String phoneNumber,
      required BuildContext context}) async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    print("create user function called");
    try {
      DocumentSnapshot userDoc = await FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .get();

      if (userDoc.exists) {
        print("--------------user already exist.......");
        // Document already exists, navigate accordingly based on userType
        String userType = userDoc['userTypeStatus'];
        await sp.setString('userType', userType);
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
              MySnackbar.showSnackBar(context, "Logged in successfully"));
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => StartScreen(),
            ),
            (route) => false,
          );
        }
      } else {
        // Document doesn't exist, create it
        await FirebaseFirestore.instance.collection('users').doc(userId).set({
          'phone': phoneNumber,
          'id': userId,
          'userTypeStatus': 'CUSTOMER',
        });

        await sp.setString('userType', "CUSTOMER");
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
              MySnackbar.showSnackBar(context, "Logged in successfully"));
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => StartScreen(),
            ),
            (route) => false,
          );
        }
      }
    } catch (e) {
      print('Error creating/checking user in Firestore: $e');
    }
  }

  static navigateUserBasedOnType(
      {required String userType, required BuildContext context}) {
    switch (userType) {
      case 'CUSTOMER':
        if (context.mounted) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DealerDetails(),
            ),
          );
        }
        break;
      case 'DEALER':
        // Navigate to dealer page for dealers
        if (context.mounted) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const DealerFlow(
                index: 0,
              ),
            ),
          );
        }
        break;
      case 'DEALER_FORMS_SUBMITTED':
        // Navigate to form page for submitted users
        if (context.mounted) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const NotVerifiedDealer(),
            ),
          );
        }
        break;
      case 'DEALER_REJECTED':
        // Navigate to form page for submitted users
        if (context.mounted) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DealerDetails(),
            ),
          );
        }
        break;
      default:
        // Handle other cases or navigate to a default screen
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const NotVerifiedDealer(),
          ),
        );
        break;
    }
  }

  Stream<String?> listenToStatus() {
    return FirebaseFirestore.instance
        .collection('users')
        .doc(auth.currentUser!.uid)
        .snapshots()
        .map((doc) {
      var data = doc.data() as Map<String, dynamic>;
      return data["userTypeStatus"] as String?;
    }).handleError((error) {
      debugPrint('Error listening to user status: $error');
      // Handle the error appropriately (e.g., show a message to the user)
    });
  }

  StreamSubscription<String?>? statusSubscription;
  String? currentStatus;

  void handleStatusChange(
      {required String? newStatus, required BuildContext context}) async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    await sp.setString('userType', newStatus!);

    debugPrint('Updated User status: $newStatus');
  }

  void startListeningToStatus(context) {
    debugPrint("Started listening to user status");
    statusSubscription = listenToStatus().listen(
      (newStatus) => handleStatusChange(newStatus: newStatus, context: context),
      onError: (error) {
        debugPrint('Error in user status subscription: $error');
        // Handle the error appropriately (e.g., show a message to the user)
      },
    );
  }

  static Future<Map<String, dynamic>> getDealerDetails() async {
    DocumentSnapshot doc = await FirebaseFirestore.instance
        .collection('users')
        .doc(auth.currentUser!.uid)
        .get();

    var json = doc.data() as Map<String, dynamic>;
    var data = {
      "phoneNumber": json["phone"],
      "name": json["dealerOnboardFormData"]["name"],
      "shopAddress": json["dealerOnboardFormData"]["shopAddress"],
    };
    print(data);

    return data;
  }
}
