import 'dart:convert';
import 'package:flikcar/models/buyer_car_model.dart';
import 'package:flikcar/models/dealer_testdrive.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BuyCarProvider extends ChangeNotifier {
  String testDriveDate = DateTime.now().toString();
  late String testDriveCancellingReason;
  late String testDriveTimeSlot;

  bool compare = false;

  int testDriveCancellingReasonIndex = -1;
  int testDriveDateIndex = 0;
  int testDriveTimeSlotIndex = -1;
  List<DealerTestDrive> testDriveCar = [];

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

  bookTestDrive({
    required int vehicleId,
    required int dealerId,
  }) async {
    final SharedPreferences sp = await SharedPreferences.getInstance();

    var url =
        Uri.parse('http://webservice.flikcar.com:8000/api/test-drive/create');

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
    if (data["status"] == 200) {}
  }

  getCustomerTestdrive() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    final String? token = sp.getString('userToken');

    var url = Uri.parse('http://webservice.flikcar.com:8000/api/test-drive');
    var response = await http.get(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );
    var body = jsonDecode(response.body);
    var data = body["data"] as List;
    data.forEach((element) {
      testDriveCar.add(
        DealerTestDrive.fromJson(element),
      );
    });
  }
}
