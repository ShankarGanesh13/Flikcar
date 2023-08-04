import 'dart:convert';

import 'package:flikcar/models/buyer_car_model.dart';
import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class GetCarDetails extends ChangeNotifier {
  List<BuyerCar> allCars = [];
  List<BuyerCar> fuelFilter = [];
  List<BuyerCar> transmissonFilter = [];
  List<BuyerCar> bodyTypeFilter = [];
  int fuelIndex = -1;
  int transmissonIndex = -1;
  int bodyIndex = -1;

  getAllCars() async {
    allCars = [];
    final SharedPreferences sp = await SharedPreferences.getInstance();
    final String? token = sp.getString('userToken');

    var url =
        Uri.parse('https://webservice.flikcar.com:8000/api/buy-car/get-car');

    var response = await http.get(url, headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    });
    print(token);
    var data = jsonDecode(response.body);
    List result = data["data"] as List;

    result.forEach((e) {
      allCars.add(BuyerCar.fromJson(e));
    });
    notifyListeners();
    print("car details saved");
  }

  filterCars(
      {required String filterType,
      required String filter,
      required int index}) {
    switch (filterType) {
      case "fuel":
        {
          print("fuel");
          print(filter);
          fuelFilter = allCars
              .where((element) =>
                  element.fuel.toLowerCase() == filter.toLowerCase())
              .toList();
          fuelIndex = index;
          notifyListeners();
        }
      case "transmisson":
        {
          print("transmisson");
          print(filter);
          transmissonFilter = allCars
              .where((element) =>
                  element.transmission.toLowerCase() == filter.toLowerCase())
              .toList();
          print(transmissonFilter);
          transmissonIndex = index;
          notifyListeners();
        }
      case "bodyType":
        {
          print("bodyType");
          print(filter);
          bodyTypeFilter = allCars
              .where((element) =>
                  element.bodytype.toLowerCase() == filter.toLowerCase())
              .toList();
          bodyIndex = index;
          notifyListeners();
        }
      case "all":
        {
          print("all");
          print(filter);
          bodyIndex = -1;
          fuelIndex = -1;
          transmissonIndex = -1;
          bodyTypeFilter = allCars;
          fuelFilter = allCars
              .where(
                  (element) => element.transmission.toLowerCase() == "manual")
              .toList();
          transmissonFilter = allCars;
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
