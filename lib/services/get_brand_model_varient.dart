import 'dart:convert';

import 'package:flikcar/models/body_type_model.dart';
import 'package:flikcar/models/brand_model_varient.dart';
import 'package:flikcar/models/color_model.dart';
import 'package:flikcar/models/fuel_type_model.dart';
import 'package:flikcar/models/owner_type_model.dart';
import 'package:flikcar/models/rto_model.dart';
import 'package:flikcar/models/seats_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class GetBrandModelVarient {
  static Future<List<BodyTypeModel>> getBodyType() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    Uri url =
        Uri.parse('https://webservice.flikcar.com/api/dealer/car/body-type');
    String? dealerToken = sp.getString('dealerToken');

    var response = await http.get(url, headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $dealerToken',
    });
    var body = jsonDecode(response.body);
    var data = body["data"] as List;
    List<BodyTypeModel> bodyType = [];

    data.forEach((element) {
      bodyType.add(BodyTypeModel.fromJson(element));
    });

    return bodyType;
  }

  static Future<List<OwnerTypeModel>> getownership() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    Uri url =
        Uri.parse('https://webservice.flikcar.com/api/dealer/car/owner-type');
    String? dealerToken = sp.getString('dealerToken');

    var response = await http.get(url, headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $dealerToken',
    });
    var body = jsonDecode(response.body);
    var data = body["data"] as List;
    List<OwnerTypeModel> ownership = [];
    data.forEach((element) {
      ownership.add(OwnerTypeModel.fromJson(element));
    });

    return ownership;
  }

  static Future<List<ColorModel>> getColors() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    Uri url = Uri.parse('https://webservice.flikcar.com/api/dealer/car/color');
    String? dealerToken = sp.getString('dealerToken');

    var response = await http.get(url, headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $dealerToken',
    });
    var body = jsonDecode(response.body);
    var data = body["data"] as List;
    List<ColorModel> colors = [];

    data.forEach((element) {
      colors.add(ColorModel.fromJson(element));
    });
    return colors;
  }

  static Future<List<FuelTypeModel>> getFuelType() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();

    Uri url = Uri.parse(
      'https://webservice.flikcar.com/api/dealer/car/fuel-type',
    );

    String? dealerToken = sp.getString('dealerToken');

    var response = await http.get(url, headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $dealerToken',
    });
    var body = jsonDecode(response.body);
    var data = body["data"] as List;
    List<FuelTypeModel> fuelType = [];

    data.forEach((element) {
      fuelType.add(FuelTypeModel.fromJson(element));
    });

    return fuelType;
  }

  static Future<List<BrandModelVarient>> getBrandModelVarientCust() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    List<BrandModelVarient> brands = [];
    Uri url = Uri.parse(
      'https://webservice.flikcar.com/api/dealer/car/brand-model-variant',
    );

    String? userToken = sp.getString('userToken');

    var response = await http.get(url, headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $userToken',
    });

    var body = jsonDecode(response.body);
    var data = body["data"] as List;

    brands = [];
    data.forEach((element) {
      brands.add(BrandModelVarient.fromJson(element));
    });

    return brands;
  }

  static Future<List<BrandModelVarient>> getBrandModelVarient() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    List<BrandModelVarient> brands = [];
    Uri url = Uri.parse(
      'https://webservice.flikcar.com/api/dealer/car/brand-model-variant',
    );

    String? dealerToken = sp.getString('dealerToken');

    var response = await http.get(url, headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $dealerToken',
    });
    var body = jsonDecode(response.body);
    var data = body["data"] as List;
    brands = [];
    data.forEach((element) {
      brands.add(BrandModelVarient.fromJson(element));
    });

    return brands;
  }

  static Future<List<SeatsModel>> getSeats() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    List<SeatsModel> seats = [];
    Uri url = Uri.parse(
      'https://webservice.flikcar.com/api/dealer/car/seat',
    );

    String? dealerToken = sp.getString('dealerToken');

    var response = await http.get(url, headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $dealerToken',
    });
    var body = jsonDecode(response.body);
    var data = body["data"] as List;

    data.forEach((element) {
      seats.add(SeatsModel.fromJson(element));
    });

    return seats;
  }

  static Future<List<Rto>> getRto() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    List<Rto> rto = [];

    Uri url = Uri.parse(
      'https://webservice.flikcar.com/api/rto',
    );

    String? dealerToken = sp.getString('dealerToken');

    var response = await http.get(url, headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $dealerToken',
    });
    var body = jsonDecode(response.body);
    List<dynamic> data = body["data"] as List;
    for (var i = 0; i < data.length; i++) {
      rto.add(Rto.fromJson(data[i]));
    }

    return rto;
  }
}
