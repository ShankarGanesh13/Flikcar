import 'dart:convert';

import 'package:flikcar/common_widgets/snackbar.dart';
import 'package:flikcar/models/buyer_car_model.dart';
import 'package:flikcar/models/dealer_testdrive.dart';
import 'package:flikcar/screens/dealers_flow/dealer_flow.dart';
import 'package:flikcar/utils/env.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class GetDealerUploadCars extends ChangeNotifier {
  List<BuyerCar> allCars = [];
  List<BuyerCar> filteredCars = [];
  List<BuyerCar> searchCars = [];
  List<DealerTestDrive> dealerTestDrive = [];
  List<DealerTestDrive> filteredDealerTestDrive = [];
  final DateTime now = DateTime.now();
  final DateFormat formatter = DateFormat('yyyy-MM-dd');
  String apiUrl = Env.apiUrl;

  getDealerUploadedCars() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    final String? token = sp.getString('dealerToken');
    var url = Uri.parse('$apiUrl/dealer/car/list-car');
    var response = await http.get(url, headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    });

    var data = jsonDecode(response.body);
    List result = data["data"] as List;
    allCars = [];
    result.forEach(
      (element) {
        allCars.add(BuyerCar.fromJson(element));
      },
    );
    filteredCars = allCars;
    searchCars = allCars;
    notifyListeners();
  }

  filterDealerCars({required String status}) {
    filteredCars = allCars;
    debugPrint(status);

    filteredCars =
        allCars.where((element) => element.saleStatus == status).toList();
    if (status == "All Cars") {
      filteredCars = allCars;
    }
    searchCars = filteredCars;
    notifyListeners();
  }

  getDealerScheduledTestDrive() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    final String? token = sp.getString('dealerToken');

    dealerTestDrive = [];
    var url = Uri.parse('$apiUrl/dealer/test-drive');

    var response = await http.get(url, headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    });
    var data = jsonDecode(response.body);
    if (data["data"] != null) {
      List result = data["data"] as List;
      result.forEach((element) {
        if (element["vehicle"] != null) {
          dealerTestDrive.add(DealerTestDrive.fromJson(element));
        }
      });
      filteredDealerTestDrive = dealerTestDrive;
      notifyListeners();
    }
  }

  filterTestDrive({required String filter}) {
    if (filter == "Today") {
      filteredDealerTestDrive = dealerTestDrive
          .where((element) => element.testDriveDate == formatter.format(now))
          .toList();
    }
    if (filter == "Tomorrow") {
      filteredDealerTestDrive = dealerTestDrive
          .where((element) =>
              element.testDriveDate ==
              formatter.format(now.add(const Duration(days: 1))))
          .toList();
    }
    if (filter == "All") {
      filteredDealerTestDrive = dealerTestDrive;
    }
    notifyListeners();
  }

  searchDealerUploadCars({required String query}) {
    searchCars = filteredCars;
    searchCars = filteredCars
        .where((element) => element.model.toLowerCase().contains(query))
        .toList();
    notifyListeners();
  }

  markAsSold({required BuildContext context, required String carId}) async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    Uri url = Uri.parse('$apiUrl/dealer/car/mark-as-sold');
    String? dealerToken = sp.getString('dealerToken');
    var body = {
      "carId": carId,
    };
    var response = await http.post(
      url,
      headers: {
        "Content-Type": "application/json",
        "Authorization": 'Bearer $dealerToken',
      },
      body: json.encode(body),
    );
    var data = json.decode(response.body);
    if (data["status"] == 200) {
      if (context.mounted) {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => const DealerFlow(
              index: 1,
            ),
          ),
          (route) => false,
        );
        ScaffoldMessenger.of(context).showSnackBar(MySnackbar.showSnackBar(
            context, "Car status changed successfully"));
      }
    }
  }
}
