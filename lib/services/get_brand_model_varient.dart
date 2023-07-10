import 'dart:convert';

import 'package:flikcar/models/brand_model_varient.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class GetBrandModelVarient {
  Future<List<BrandModelVarient>> getAllBrands() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    Uri url =
        Uri.parse('http://webservice.flikcar.com:8000/api/dealer/car/brand');
    String? dealerToken = sp.getString('dealerToken');

    var response = await http.get(url, headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $dealerToken',
    });
    var body = jsonDecode(response.body);
    var data = body["data"] as List;
    List<BrandModelVarient> brand = [];

    data.forEach((element) {
      brand.add(BrandModelVarient.fromJson(element));
    });

    return brand;
  }

  Future<List<Model>> getAllModel({required int brandId}) async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    var param = {"brandId": "$brandId"};
    Uri url = Uri.parse(
      'http://webservice.flikcar.com:8000/api/dealer/car/model-by-brand',
    );
    final finalUri = url.replace(queryParameters: param);

    String? dealerToken = sp.getString('dealerToken');

    var response = await http.get(finalUri, headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $dealerToken',
    });
    var body = jsonDecode(response.body);
    var data = body["data"] as List;
    List<Model> model = [];

    data.forEach((element) {
      model.add(Model.fromJson(element));
    });
    print(model);
    return model;
  }
}
