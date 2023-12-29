import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flikcar/common_widgets/snackbar.dart';
import 'package:flikcar/firebase_models/firebase_buyer_car.dart';
import 'package:flikcar/firebase_models/firebase_display_car_details.dart';
import 'package:flikcar/firebase_models/firebase_testdrive.dart';
import 'package:flikcar/screens/home_screen/home_screen.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TestDriveService extends ChangeNotifier {
  int testDriveDate = DateTime.now().millisecondsSinceEpoch;

  FirebaseFunctions functions = FirebaseFunctions.instance;
  FirebaseAuth auth = FirebaseAuth.instance;

  bool compare = false;
  final DateFormat formatter = DateFormat('yyyy-MM-dd');
  int testDriveDateIndex = 0;
  List<FirebaseTestDrive> testDriveCars = [];
  List<FirebaseTestDrive> upcomingTestDriveCars = [];
  List<FirebaseTestDrive> filterTestDriveCars = [];

  DateTime now = DateTime.now();

  getTestDriveDate({required int date, required int index}) {
    testDriveDate = date;
    testDriveDateIndex = index;

    notifyListeners();
  }

  bookTestDrive({
    required BuildContext context,
    required FirebaseBuyerCar car,
  }) async {
    var data = {
      "date": testDriveDate,
      "carDetails": {
        'id': car.id,
        'registrationYear': car.properties.registrationYear,
        'variant': car.properties.variant,
        'city': car.properties.city,
        'ownerType': car.properties.ownerType,
        'model': car.properties.model,
        'seat': car.properties.seat,
        'brand': car.properties.brand,
        'kmsDriven': car.properties.kmsDriven,
        'transmission': car.properties.transmission,
        'fuelType': car.properties.fuelType,
        'imagePath': car.images[0].imageUrl,
        'color': car.properties.color,
        'bodyType': car.properties.bodyType,
        "price": int.parse(car.carPrice),
      },
      "venue": "STORE",
      "customerId": auth.currentUser!.uid,
      "dealerId": car.properties.dealer.id,
    };
    try {
      final callable = functions.httpsCallable('createTestDrive');
      final result = await callable(data);
      //  print(result.data);
      if (context.mounted && result.data["status"] == "SUCCESS") {
        ScaffoldMessenger.of(context).showSnackBar(
            MySnackbar.showSnackBar(context, "Test drive book succeessfully"));
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => const HomeScreen(
              index: 0,
            ),
          ),
          (route) => false,
        );
      } else {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
              MySnackbar.showSnackBar(context, "Something went wrong"));
        }
      }
    } catch (e) {
      debugPrint("error in create testdrive----------$e");
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
            MySnackbar.showSnackBar(context, "Something went wrong"));
      }
    }
  }

  // getCustomerTestdrive() async {
  //   try {
  //     final callable = functions.httpsCallable('getTestDrivesOfUser');
  //     final result = await callable("1FZlALqt4cP9BtRfBfk6o1zieV83");
  //     var data = jsonDecode(result.data["data"]);

  //     print(data.length);
  //     for (var test in data) {
  //       test = test.cast<String, dynamic>();

  //       testDriveCars
  //           .add(FirebaseTestDrive.fromJson(test as Map<String, dynamic>));
  //     }
  //   } catch (e) {
  //     debugPrint("get customer test drive$e");
  //   }
  //   customerUpcomingTestdrive();
  //   // print(testDriveCars);
  // }
  getCustomerTestdrive({required String type}) async {
    testDriveCars = [];
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference collection = firestore.collection("test_drive");
    QuerySnapshot testdriveDocs = type == "CUSTOMER"
        ? await collection
            .where("customerDetails.userId", isEqualTo: auth.currentUser!.uid)
            .get()
        : await collection
            .where("dealerDetails.userId", isEqualTo: auth.currentUser!.uid)
            .get();
    for (var testDrive in testdriveDocs.docs) {
      testDriveCars.add(
          FirebaseTestDrive.fromJson(testDrive.data() as Map<String, dynamic>));
    }
    //  filterTestDrive(filter: "All");
    debugPrint("$testDriveCars");
    notifyListeners();
  }

  customerUpcomingTestdrive() {
    final String formatted = formatter.format(now);
    upcomingTestDriveCars = [];
    testDriveCars.forEach((element) {
      if (DateTime.fromMillisecondsSinceEpoch(element.date).isAfter(now) ||
          DateTime.fromMillisecondsSinceEpoch(element.date) ==
              DateTime.parse(formatted)) {
        upcomingTestDriveCars.add(element);
      }
    });
    upcomingTestDriveCars.sort((a, b) {
      return a.date.compareTo(b.date);
    });

    notifyListeners();
  }

  filterTestDrive({required String filter}) {
    filterTestDriveCars = [];

    print(filter);
    if (filter == "All") {
      filterTestDriveCars = testDriveCars;
      print(filter);
    }
    if (filter == "Completed") {
      testDriveCars.forEach((element) {
        if (DateTime.fromMillisecondsSinceEpoch(element.date).isBefore(now)) {
          filterTestDriveCars.add(element);
        }
      });
    }
    if (filter == "Upcoming") {
      testDriveCars.forEach((element) {
        if (DateTime.fromMillisecondsSinceEpoch(element.date).isAfter(now) ||
            DateTime.fromMillisecondsSinceEpoch(element.date) == (now)) {
          filterTestDriveCars.add(element);
        }
      });
    }
    // print(filterTestDriveCars);
    notifyListeners();
  }
}
