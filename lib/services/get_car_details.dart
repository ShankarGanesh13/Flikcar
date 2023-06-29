import 'dart:convert';

import 'package:flikcar/models/buyer_car_model.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class GetCarDetails {
  static late Future<Isar> localDB;

  GetCarDetails() {
    localDB = openIsar();
  }

  Future<Isar> openIsar() async {
    if (Isar.instanceNames.isEmpty) {
      final dir = await getApplicationDocumentsDirectory();
      return await Isar.open(
        [
          BuyerCarSchema,
        ],
        directory: dir.path,
        inspector: true,
      );
    }
    print("ISAR initialised");
    return Future.value(Isar.getInstance());
  }

  saveCarDetails() async {
    final isar = await localDB;

    final SharedPreferences sp = await SharedPreferences.getInstance();
    final String? token = sp.getString('userToken');

    var url =
        Uri.parse('http://webservice.flikcar.com:8000/api/buy-car/get-car');

    var response = await http.get(url, headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    });
    var data = jsonDecode(response.body);
    List result = data["data"] as List;

    result.forEach((e) async {
      BuyerCar car = BuyerCar.fromJson(e);
      print(car.bodytype);
      await isar.writeTxn(() async {
        await isar.buyerCars.put(BuyerCar.fromJson(e));
      });
    });
    print("car details saved");
  }

  static Future<List<BuyerCar>> getAllCarDetails() async {
    final isar = await localDB;
    final allCars = await isar.buyerCars.where().findAll();
    print(allCars);
    return allCars;
  }
}
