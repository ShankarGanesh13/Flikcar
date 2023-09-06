import 'dart:convert';
import 'package:flikcar/common_widgets/snackbar.dart';
import 'package:flikcar/models/buyer_car_model.dart';
import 'package:flikcar/models/customer_testdrive.dart';
import 'package:flikcar/models/dealer_testdrive.dart';
import 'package:flikcar/screens/home_screen/home_screen.dart';
import 'package:flikcar/services/facebook_events.dart';
import 'package:flikcar/services/firebase_events.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BuyCarProvider extends ChangeNotifier {
  String testDriveDate = DateTime.now().toString();
  late String testDriveCancellingReason;
  late String testDriveTimeSlot;

  bool compare = false;
  final DateFormat formatter = DateFormat('yyyy-MM-dd');
  int testDriveCancellingReasonIndex = -1;
  int testDriveDateIndex = 0;
  int testDriveTimeSlotIndex = -1;
  List<CustomerTestDrive> testDriveCars = [];
  List<CustomerTestDrive> upcomingTestDriveCars = [];
  List<CustomerTestDrive> filterTestDriveCars = [];

  DateTime now = DateTime.now();

  getTestDriveCancellingReason({required String reason, required int index}) {
    testDriveCancellingReason = reason;
    testDriveCancellingReasonIndex = index;
    notifyListeners();
  }

  getTestDriveDate({required String date, required int index}) {
    testDriveDate = date;
    testDriveDateIndex = index;
    notifyListeners();
  }

  getTestDriveTimeSlot({required String timeslot, required int index}) {
    testDriveTimeSlot = timeslot;
    testDriveTimeSlotIndex = index;
    notifyListeners();
  }

  compareCars() {
    compare = compare == true ? false : true;
    notifyListeners();
  }

  bookTestDrive(
      {required int vehicleId,
      required int dealerId,
      required BuildContext context}) async {
    final SharedPreferences sp = await SharedPreferences.getInstance();

    var url =
        Uri.parse('https://webservice.flikcar.com:8000/api/test-drive/create');

    var requestBody = {
      "vehicleId": "$vehicleId",
      "testDriveLocation": "Home",
      "date": "$testDriveDate",
      "dealerId": "$dealerId"
    };
    final String? token = sp.getString('userToken');

    var response = await http.post(url,
        headers: {'Authorization': 'Bearer $token'}, body: requestBody);

    var data = json.decode(response.body);
    print(data);
    if (data["status"] == 200 || data["status"] == 201) {
      FirebaseEvents()
          .customerConfirmTestdrive(customerPhone: "customer phone");
      FacebookEvents()
          .customerConfirmTestdrive(customerPhone: "customer phone");
      if (context.mounted) {
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
      }
    }
  }

  getCustomerTestdrive() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    final String? token = sp.getString('userToken');
    testDriveCars = [];

    var url = Uri.parse('https://webservice.flikcar.com:8000/api/test-drive');
    var response = await http.get(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );
    var body = jsonDecode(response.body);

    if (body["data"] != null) {
      var data = body["data"] as List;
      data.forEach((element) {
        //   print(element);
        if (element["vehicle"] != null) {
          testDriveCars.add(
            CustomerTestDrive.fromJson(element),
          );
        }
      });
    }
    customerUpcomingTestdrive();
    // print(testDriveCars);
  }

  customerUpcomingTestdrive() {
    final String formatted = formatter.format(now);
    upcomingTestDriveCars = [];
    testDriveCars.forEach((element) {
      if (DateTime.parse(element.testDriveDate).isAfter(now) ||
          DateTime.parse(element.testDriveDate) == DateTime.parse(formatted)) {
        upcomingTestDriveCars.add(element);
      }
    });
    upcomingTestDriveCars.sort((a, b) {
      return a.testDriveDate.compareTo(b.testDriveDate);
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
        if (DateTime.parse(element.testDriveDate).isBefore(now)) {
          filterTestDriveCars.add(element);
        }
      });
    }
    if (filter == "Upcoming") {
      testDriveCars.forEach((element) {
        if (DateTime.parse(element.testDriveDate).isAfter(now) ||
            DateTime.parse(element.testDriveDate) == (now)) {
          filterTestDriveCars.add(element);
        }
      });
    }
    // print(filterTestDriveCars);
    notifyListeners();
  }
}
