import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flikcar/common_widgets/snackbar.dart';
import 'package:flikcar/firebase_models/firebase_buyer_car.dart';
import 'package:flikcar/firebase_models/firebase_delaer_listed_car.dart';
import 'package:flikcar/utils/env.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class GetDealerUploadCars extends ChangeNotifier {
  List allCars = [];
  List filteredCars = [];
  List searchCars = [];
  List dealerTestDrive = [];
  List filteredDealerTestDrive = [];
  final DateTime now = DateTime.now();
  final DateFormat formatter = DateFormat('yyyy-MM-dd');
  String apiUrl = Env.apiUrl;
  static FirebaseFirestore firestore = FirebaseFirestore.instance;
  static FirebaseAuth auth = FirebaseAuth.instance;
  List<FirebaseDealerListedCar> allDealerListedCar = [];

  Stream<List<FirebaseDealerListedCar>> getDealerUploadedCars() {
    CollectionReference collection = firestore
        .collection('users')
        .doc(auth.currentUser!.uid)
        .collection("listedVehicles");

    return collection.snapshots().map((querySnapshot) {
      List<FirebaseDealerListedCar> allDealerListedCar = [];

      for (var doc in querySnapshot.docs) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

        allDealerListedCar.add(FirebaseDealerListedCar.fromJson(data));
      }

      return allDealerListedCar;
    });
  }

  filterDealerCars({required String status}) {
    //   filteredCars = allCars;
    //   debugPrint(status);

    //   filteredCars =
    //       allCars.where((element) => element.saleStatus == status).toList();
    //   if (status == "All Cars") {
    //     filteredCars = allCars;
    //   }
    //   searchCars = filteredCars;
    //   notifyListeners();
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
          //  dealerTestDrive.add(DealerTestDrive.fromJson(element));
        }
      });
      filteredDealerTestDrive = dealerTestDrive;
      notifyListeners();
    }
  }

  filterTestDrive({required String filter}) {
    if (filter == "Today") {
      // filteredDealerTestDrive = dealerTestDrive
      //     .where((element) => element.testDriveDate == formatter.format(now))
      //     .toList();
    }
    if (filter == "Tomorrow") {
      //  filteredDealerTestDrive = dealerTestDrive
      // .where((element) =>
      //     element.testDriveDate ==
      //     formatter.format(now.add(const Duration(days: 1))))
      // .toList();
    }
    if (filter == "All") {
      filteredDealerTestDrive = dealerTestDrive;
    }
    notifyListeners();
  }

  searchDealerUploadCars({required String query}) {
    searchCars = filteredCars;
    // searchCars = filteredCars
    //     .where((element) => element.model.toLowerCase().contains(query))
    //     .toList();
    notifyListeners();
  }

  markAsSold({required BuildContext context, required String carId}) async {
    DocumentReference doc = firestore.collection('vehicles').doc(carId);
    DocumentReference doc2 = firestore
        .collection("users")
        .doc(auth.currentUser!.uid)
        .collection("listedVehicles")
        .doc(carId);
    try {
      DocumentSnapshot snapshot = await doc.get();
      DocumentSnapshot snapshot2 = await doc2.get();

      Map<String, dynamic>? data = snapshot.data() as Map<String, dynamic>?;
      Map<String, dynamic>? data2 = snapshot2.data() as Map<String, dynamic>?;
      data2!["status"] = 'SOLD_OUT';

      data!['properties']['saleStatus'] = 'SOLD_OUT';
      await doc2.update(data2);
      await doc.update(data);
    } catch (e) {
      debugPrint("$e");
      debugPrint("error in changing car status");
    }
  }

  markAsAvailable(
      {required BuildContext context, required String carId}) async {
    DocumentReference doc = firestore.collection('vehicles').doc(carId);
    DocumentReference doc2 = firestore
        .collection("users")
        .doc(auth.currentUser!.uid)
        .collection("listedVehicles")
        .doc(carId);
    try {
      DocumentSnapshot snapshot = await doc.get();
      DocumentSnapshot snapshot2 = await doc2.get();

      Map<String, dynamic>? data = snapshot.data() as Map<String, dynamic>?;
      Map<String, dynamic>? data2 = snapshot2.data() as Map<String, dynamic>?;
      data2!["status"] = 'AVAILABLE';

      data!['properties']['saleStatus'] = 'AVAILABLE';
      await doc2.update(data2);
      await doc.update(data);
    } catch (e) {
      debugPrint("$e");
      debugPrint("error in changing car status");
    }
  }

  Stream<FirebaseBuyerCar?> getDealerCarStream({required String carId}) {
    DocumentReference doc = firestore.collection('vehicles').doc(carId);

    return doc.snapshots().map((snapshot) {
      if (snapshot.exists) {
        print(snapshot.data());
        return FirebaseBuyerCar.fromJson(
            snapshot.data() as Map<String, dynamic>);
      } else {
        return null;
      }
    });
  }
}
