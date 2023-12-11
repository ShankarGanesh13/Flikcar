import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flikcar/firebase_models/firebase_buyer_car.dart';
import 'package:flikcar/models/buyer_car_display.dart';
import 'package:flikcar/models/buyer_car_model.dart';
import 'package:flikcar/utils/env.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class GetCarDetails extends ChangeNotifier {
  List<FirebaseBuyerCar> displayCars = [];
  List<BuyerCarDisplay> similarCars = [];
  FirebaseFirestore firebase = FirebaseFirestore.instance;

  List<FirebaseBuyerCar> fuelFilter = [];
  List<FirebaseBuyerCar> transmissonFilter = [];
  List<FirebaseBuyerCar> bodyTypeFilter = [];
  int fuelIndex = -1;
  int transmissonIndex = -1;
  int bodyIndex = -1;
  String apiUrl = Env.apiUrl;

  getAllDisplayCars() async {
    displayCars = [];
    final SharedPreferences sp = await SharedPreferences.getInstance();
    final String? token = sp.getString('userToken');

    var url = Uri.parse('$apiUrl/buy-car/get-all-car');

    var response = await http.get(url, headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    });

    var data = jsonDecode(response.body);
    List result = data["data"] as List;
    if (displayCars.length < 12) {
      result.forEach((e) {
        displayCars.add(FirebaseBuyerCar.fromJson(e));
      });
    }
    fuelFilter = displayCars
        .where((element) =>
            element.properties.transmission.toLowerCase() == "manual")
        .toList();

    transmissonFilter.shuffle();
    notifyListeners();
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

  Future<BuyerCar> getCarById({required String id}) async {
    similarCars = [];
    final SharedPreferences sp = await SharedPreferences.getInstance();
    final String? token = sp.getString('userToken');

    final queryParameters = {'id': id};
    final url = Uri.https(
      'webservice.flikcar.com',
      '/api/web/buy-car/cars/view/',
      queryParameters,
    );
    var response = await http.get(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    var data = jsonDecode(response.body);

    var result = data["data"]["vehicle"];
    BuyerCar car = BuyerCar.fromJson(result);
    var bestmatch = data["data"]["bestMatchCars"] as List;

    if (bestmatch.isNotEmpty) {
      bestmatch.forEach((element) {
        similarCars.add(BuyerCarDisplay.fromJson(element));
      });
    }
    return car;
  }

  Future<List<FirebaseBuyerCar>> getBuyerCarDetails() async {
    List<FirebaseBuyerCar> allCars = [];
    QuerySnapshot query = await firebase.collection("vehicles").get();
    for (var doc in query.docs) {
      allCars
          .add(FirebaseBuyerCar.fromJson(doc.data() as Map<String, dynamic>));
    }
    return allCars;
  }

  Future<List<BuyerCarDisplay>> getCarAtTheStore({required String id}) async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    final String? token = sp.getString('userToken');

    var url = Uri.parse("$apiUrl/store/search-car");
    Map<String, dynamic> body = {
      "index": 0.5043553213209293,
      "id": id,
      "brand": [],
      "model": [],
      "fuel": [],
      "city": "",
      "bodytype": [],
      "seats": [],
      "transmission": [],
      "owners": [],
      "drivenkm": "",
      "modelyear": "",
      "budget": "",
      "page": 1
    };

    var response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode(body),
    );

    var data = jsonDecode(response.body);

    var result = data["data"] as List;

    List<BuyerCarDisplay> cars = [];

    if (result.isNotEmpty) {
      for (var i = 0; i < result.length; i++) {
        cars.add(
          BuyerCarDisplay.fromJson(result[i]),
        );
      }
    }
    return cars;
  }
}
