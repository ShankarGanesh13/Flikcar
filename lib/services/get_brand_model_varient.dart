import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flikcar/models/body_type_model.dart';
import 'package:flikcar/models/brand_model_varient.dart';
import 'package:flikcar/models/color_model.dart';
import 'package:flikcar/models/fuel_type_model.dart';
import 'package:flikcar/models/owner_type_model.dart';
import 'package:flikcar/models/rto_model.dart';
import 'package:flikcar/models/seats_model.dart';
import 'package:flikcar/utils/env.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class GetBrandModelVarient {
  static FirebaseFirestore firestore = FirebaseFirestore.instance;
  static String apiUrl = Env.apiUrl;

  static Future<List<BodyTypeModel>> getBodyType() async {
    List<BodyTypeModel> bodyType = [];

    try {
      CollectionReference collection = firestore.collection('bodyTypes');
      QuerySnapshot querySnapshot = await collection.get();
      for (QueryDocumentSnapshot documentSnapshot in querySnapshot.docs) {
        bodyType.add(BodyTypeModel.fromJson(
            documentSnapshot.data() as Map<String, dynamic>));
      }
    } catch (e) {
      print("----------------$e");
    }
    // debugPrint("$bodyType");
    return bodyType;
  }

  static Future<List<OwnerTypeModel>> getownership() async {
    List<OwnerTypeModel> ownership = [];
    try {
      CollectionReference collection = firestore.collection('ownerTypes');
      QuerySnapshot querySnapshot = await collection.get();
      for (QueryDocumentSnapshot documentSnapshot in querySnapshot.docs) {
        ownership.add(OwnerTypeModel.fromJson(
            documentSnapshot.data() as Map<String, dynamic>));
      }
    } catch (e) {
      print("-----------------$e");
    }
    // debugPrint("$ownership");

    return ownership;
  }

  static Future<List<ColorModel>> getColors() async {
    List<ColorModel> colors = [];
    try {
      CollectionReference collection = firestore.collection('colors');
      QuerySnapshot querySnapshot = await collection.get();
      for (QueryDocumentSnapshot documentSnapshot in querySnapshot.docs) {
        colors.add(ColorModel.fromJson(
            documentSnapshot.data() as Map<String, dynamic>));
      }
    } catch (e) {
      print("-----------------$e");
    }
    //  debugPrint("$colors");

    return colors;
  }

  static Future<List<FuelTypeModel>> getFuelType() async {
    List<FuelTypeModel> fuelTypes = [];
    try {
      CollectionReference collection = firestore.collection('fuelTypes');
      QuerySnapshot querySnapshot = await collection.get();
      for (QueryDocumentSnapshot documentSnapshot in querySnapshot.docs) {
        fuelTypes.add(FuelTypeModel.fromJson(
            documentSnapshot.data() as Map<String, dynamic>));
      }
    } catch (e) {
      print("-----------------$e");
    }
    // debugPrint("$fuelTypes");

    return fuelTypes;
  }

  static Future<List<BrandModelVarient>> getBrandModelVarientCust() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    List<BrandModelVarient> brands = [];
    Uri url = Uri.parse(
      '$apiUrl/dealer/car/brand-model-variant',
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
      '$apiUrl/dealer/car/brand-model-variant',
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
    List<SeatsModel> seats = [];
    try {
      CollectionReference collection = firestore.collection('seats');
      QuerySnapshot querySnapshot = await collection.get();
      for (QueryDocumentSnapshot documentSnapshot in querySnapshot.docs) {
        seats.add(SeatsModel.fromJson(
            documentSnapshot.data() as Map<String, dynamic>));
      }
    } catch (e) {
      print("-----------------$e");
    }
    //  debugPrint("$seats");

    return seats;
  }

  static Future<List<Rto>> getRto() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    List<Rto> rto = [];

    Uri url = Uri.parse(
      '$apiUrl/rto',
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
