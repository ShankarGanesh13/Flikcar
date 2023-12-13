import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flikcar/firebase_models/firebase_buyer_car.dart';
import 'package:flikcar/firebase_models/firebase_delaer_listed_car.dart';
import 'package:flikcar/utils/env.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:math';

class GetCarDetails extends ChangeNotifier {
  List<FirebaseBuyerCar> displayCars = [];
  FirebaseFirestore firebase = FirebaseFirestore.instance;

  List<FirebaseBuyerCar> fuelFilter = [];
  List<FirebaseBuyerCar> transmissonFilter = [];
  List<FirebaseBuyerCar> bodyTypeFilter = [];
  int fuelIndex = -1;
  int transmissonIndex = -1;
  int bodyIndex = -1;
  String apiUrl = Env.apiUrl;

  getAllBuyerCars() async {
    CollectionReference collection = firebase.collection("vehicles");
    try {
      QuerySnapshot query = await collection.get();
      for (var doc in query.docs) {
        displayCars
            .add(FirebaseBuyerCar.fromJson(doc.data() as Map<String, dynamic>));
      }
      // getBuyerCars();
      print(displayCars);
    } catch (e) {
      debugPrint("$e");
      debugPrint("error in get all buyer cars");
    }
  }

  getBuyerCars() async {
    CollectionReference collection = firebase.collection("vehicles");

    // Use the limit method to retrieve only 10 documents
    QuerySnapshot query = await collection.limit(10).get();

    // Get all cars from the collection
    displayCars = query.docs
        .map((doc) =>
            FirebaseBuyerCar.fromJson(doc.data() as Map<String, dynamic>))
        .toList();

    print(displayCars);
  }

  Future<FirebaseBuyerCar?> getCarById({required String carId}) async {
    try {
      DocumentReference docRef = firebase.collection("vehicles").doc(carId);
      DocumentSnapshot snapshot = await docRef.get();

      if (snapshot.exists) {
        return FirebaseBuyerCar.fromJson(
            snapshot.data() as Map<String, dynamic>);
      } else {
        return null; // Document does not exist
      }
    } catch (e) {
      debugPrint("$e");
      debugPrint("error in getCarById");
      return null;
    }
  }

  Future<List<FirebaseDealerListedCar>> getCarsInStore(
      {required String dealerId}) async {
    List<FirebaseDealerListedCar> cars = [];
    CollectionReference collection =
        firebase.collection("users").doc(dealerId).collection("listedVehicles");
    try {
      QuerySnapshot query = await collection.get();
      for (var doc in query.docs) {
        cars.add(FirebaseDealerListedCar.fromJson(
            doc.data() as Map<String, dynamic>));
      }
      // getBuyerCars();
    } catch (e) {
      debugPrint("$e");
      debugPrint("error in get all buyer cars");
    }
    print(cars);
    return cars;
  }

  filterCars(
      {required String filterType,
      required String filter,
      required int index}) {
    debugPrint("${displayCars.length}");
    switch (filterType) {
      case "fuel":
        {
          // print("fuel");
          // print(filter);
          fuelFilter = displayCars
              .where((element) =>
                  element.properties.fuelType.toLowerCase() ==
                  filter.toLowerCase())
              .toList();
          fuelIndex = index;
          notifyListeners();
        }
      case "transmisson":
        {
          // print("transmisson");
          // print(filter);
          transmissonFilter = displayCars
              .where((element) =>
                  element.properties.transmission.toLowerCase() ==
                  filter.toLowerCase())
              .toList();
          transmissonIndex = index;
          notifyListeners();
        }
      case "bodyType":
        {
          // print("bodyType");
          // print(filter);

          bodyTypeFilter = displayCars
              .where((element) =>
                  element.properties.bodyType.toLowerCase() ==
                  filter.toLowerCase())
              .toList();
          bodyIndex = index;
          notifyListeners();
        }
      case "all":
        {
          // print("all");
          // print(filter);
          bodyIndex = -1;
          fuelIndex = -1;
          transmissonIndex = -1;
          bodyTypeFilter = displayCars;
          // fuelFilter = allCars
          //     .where(
          //         (element) => element.transmission.toLowerCase() == "manual")
          //     .toList();
          transmissonFilter = displayCars;

          // bodyTypeFilter.shuffle();
          // fuelFilter.shuffle();
        }
      default:
        {
          print("Invalid choice");
          print(filter);
        }
        break;
    }
  }
}
