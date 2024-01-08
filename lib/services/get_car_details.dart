import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flikcar/firebase_models/firebase_buyer_car.dart';
import 'package:flikcar/firebase_models/firebase_delaer_listed_car.dart';
import 'package:flikcar/utils/env.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:http/http.dart' as http;

class GetCarDetails extends ChangeNotifier {
  List<FirebaseBuyerCar> displayCars = [];
  List<FirebaseBuyerCar> displayCars2 = [];

  FirebaseFirestore firebase = FirebaseFirestore.instance;

  List<FirebaseBuyerCar> fuelFilter = [];
  List<FirebaseBuyerCar> transmissonFilter = [];
  List<FirebaseBuyerCar> bodyTypeFilter = [];
  int fuelIndex = -1;
  int transmissonIndex = -1;
  int bodyIndex = -1;
  String apiUrl = Env.apiUrl;

  filterCars(
      {required String filterType,
      required String filter,
      required int index}) {
    debugPrint("${displayCars.length}");
    switch (filterType) {
      case "fuel":
        {
          fuelFilter = displayCars
              .where((element) =>
                  element.properties.fuelType.toLowerCase() ==
                  filter.toLowerCase())
              .toList();
          fuelIndex = index;
          notifyListeners();
          break;
        }
      case "transmisson":
        {
          transmissonFilter = displayCars
              .where((element) =>
                  element.properties.transmission.toLowerCase() ==
                  filter.toLowerCase())
              .toList();
          transmissonIndex = index;
          notifyListeners();
          break;
        }
      case "bodyType":
        {
          bodyTypeFilter = displayCars
              .where((element) =>
                  element.properties.bodyType.toLowerCase() ==
                  filter.toLowerCase())
              .toList();
          bodyIndex = index;
          notifyListeners();
          break;
        }
      case "all":
        {
          bodyIndex = -1;
          fuelIndex = -1;
          transmissonIndex = -1;
          bodyTypeFilter = displayCars;
          fuelFilter = displayCars2;

          transmissonFilter = displayCars;
          SchedulerBinding.instance.addPostFrameCallback((_) {
            // fuelFilter = displayCars
            //     .where((element) =>
            //         element.properties.transmission.toLowerCase() ==
            //         "automatic".toLowerCase())
            //     .toList();
            notifyListeners();
          });

          break;
        }
      default:
        {
          print("Invalid choice");
          print(filter);
        }
        break;
    }
  }

  getAllBuyerCars() async {
    getBuyerCarsShuffled();
    debugPrint("get all buyer cars called");
    displayCars = [];
    CollectionReference collection = firebase.collection("vehicles");
    try {
      QuerySnapshot query = await collection.limit(12).get();
      for (var doc in query.docs) {
        displayCars
            .add(FirebaseBuyerCar.fromJson(doc.data() as Map<String, dynamic>));
      }
    } catch (e) {
      debugPrint("$e");
      debugPrint("error in get all buyer cars");
    }
    debugPrint("$displayCars");
  }

  getBuyerCarsShuffled() async {
    debugPrint("get buyer cars shuffled called");
    displayCars2 = [];
    CollectionReference collection = firebase.collection("vehicles");
    try {
      QuerySnapshot query = await collection.limit(12).get();
      for (var doc in query.docs) {
        displayCars2
            .add(FirebaseBuyerCar.fromJson(doc.data() as Map<String, dynamic>));
      }
    } catch (e) {
      debugPrint("$e");
      debugPrint("error in get all buyer cars");
    }
    displayCars2.shuffle();
    debugPrint("$displayCars2");
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
    debugPrint("$cars");
    return cars;
  }
}
