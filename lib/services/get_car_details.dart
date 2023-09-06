import 'dart:convert';

import 'package:flikcar/models/buyer_car_display.dart';
import 'package:flikcar/models/buyer_car_model.dart';
import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class GetCarDetails extends ChangeNotifier {
  List<BuyerCarDisplay> displayCars = [];
  List<BuyerCarDisplay> similarCars = [];

  List<BuyerCarDisplay> fuelFilter = [];
  List<BuyerCarDisplay> transmissonFilter = [];
  List<BuyerCarDisplay> bodyTypeFilter = [];
  int fuelIndex = -1;
  int transmissonIndex = -1;
  int bodyIndex = -1;

  getAllDisplayCars() async {
    displayCars = [];
    final SharedPreferences sp = await SharedPreferences.getInstance();
    final String? token = sp.getString('userToken');

    var url = Uri.parse(
        'https://webservice.flikcar.com:8000/api/buy-car/get-all-car');

    var response = await http.get(url, headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    });

    var data = jsonDecode(response.body);
    List result = data["data"] as List;
    if (displayCars.length < 12) {
      result.forEach((e) {
        displayCars.add(BuyerCarDisplay.fromJson(e));
      });
    }
    fuelFilter = displayCars
        .where((element) => element.transmission.toLowerCase() == "manual")
        .toList();
    transmissonFilter.shuffle();
    notifyListeners();
  }

  filterCars(
      {required String filterType,
      required String filter,
      required int index}) {
    print(displayCars.length);
    switch (filterType) {
      case "fuel":
        {
          // print("fuel");
          // print(filter);
          fuelFilter = displayCars
              .where((element) =>
                  element.fuelType.toLowerCase() == filter.toLowerCase())
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
                  element.transmission.toLowerCase() == filter.toLowerCase())
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
                  element.bodyType.toLowerCase() == filter.toLowerCase())
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
      'webservice.flikcar.com:8000',
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
}
