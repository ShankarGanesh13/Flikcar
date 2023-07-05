import 'dart:convert';

import 'package:flikcar/common_widgets/snackbar.dart';
import 'package:flikcar/models/buyer_car_model.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class WishlistService extends ChangeNotifier {
  List<BuyerCar> wishlistCars = [];
  addToWishlist({required BuildContext context, required int carId}) async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    final String? token = sp.getString('userToken');

    var url = Uri.parse(
        'http://webservice.flikcar.com:8000/api/buy-car/add-favourites-car');
    var requestBody = {
      "vehicleId": "$carId",
    };

    var response = await http.post(url,
        headers: {'Authorization': 'Bearer $token'}, body: requestBody);
    var data = json.decode(response.body);

    if (data["status"] == 201 || data["status"] == 200) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
            MySnackbar.showSnackBar(context, "Added to wishlist"));
      }

      print("Added to wishlist");
    } else if (data["status"] == 302) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
            MySnackbar.showSnackBar(context, "Already exist in wishlist"));
      }
    } else {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
            MySnackbar.showSnackBar(context, "Falied to add to wishlist"));
      }
      print('Request failed with status: ${response.statusCode}');
    }
  }

  removeFromWishlist(
      {required BuildContext context, required int carId}) async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    final String? token = sp.getString('userToken');

    var url = Uri.parse(
        'http://webservice.flikcar.com:8000/api/buy-car/delete-favourites-car');
    var requestBody = {
      "vehicleId": "$carId",
    };

    var response = await http.delete(url,
        headers: {'Authorization': 'Bearer $token'}, body: requestBody);

    var data = json.decode(response.body);
    if (data["status"] == 200) {
      wishlistCars.removeWhere((element) => element.id == carId);
      notifyListeners();
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
            MySnackbar.showSnackBar(context, "Removed from wishlist"));
      }
      print("Removed from wishlist");
    } else {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
            MySnackbar.showSnackBar(context, "Falied to remove from wishlist"));
      }
      print('Request failed with status: ${response.statusCode}');
    }
  }

  getWishlistCars({required BuildContext context}) async {
    wishlistCars = [];
    final SharedPreferences sp = await SharedPreferences.getInstance();
    final String? token = sp.getString('userToken');

    var url = Uri.parse(
        'http://webservice.flikcar.com:8000/api/buy-car/get-favourites-car');

    var response = await http.get(url, headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    });
    var data = jsonDecode(response.body);

    List result = data["data"] as List;

    if (data["status"] == 200) {
      result.forEach((e) async {
        BuyerCar car = BuyerCar.fromJson(e["dealerVehicle"]);
        wishlistCars.add(car);

        print(wishlistCars);
      });
    } else {
      print('Request failed with status: ${response.statusCode}');
    }
    notifyListeners();
  }
}
