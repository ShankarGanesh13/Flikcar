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

  filterByFuelType({required String filter}) {
    fuelFilter = allCars
        .where((element) => element.fuel.toLowerCase() == filter.toLowerCase())
        .toList();
    notifyListeners();
  }

  filterByBodyType({required String filter}) {
    bodyTypeFilter = allCars
        .where(
            (element) => element.bodytype.toLowerCase() == filter.toLowerCase())
        .toList();
    notifyListeners();
  }

  filterByTransmissonType({required String filter}) {
    transmissonFilter = allCars
        .where((element) =>
            element.transmission.toLowerCase() == filter.toLowerCase())
        .toList();
    notifyListeners();
  }
}
