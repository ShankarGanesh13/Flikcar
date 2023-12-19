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
      debugPrint("--------ggggg--------$e");
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
      debugPrint("---------bbbb--------$e");
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
      debugPrint("-----------qqqqq------$e");
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
      print("-------------wwwww----$e");
    }
    // debugPrint("$fuelTypes");

    return fuelTypes;
  }

  static Future<List<BrandModelVarient>> getBrandModelVarient() async {
    List<BrandModelVarient> brands = [];
    debugPrint("get brand model variant");
    try {
      CollectionReference collection =
          firestore.collection('brand_model_variants');
      QuerySnapshot querySnapshot = await collection.get();
      for (QueryDocumentSnapshot documentSnapshot in querySnapshot.docs) {
        brands.add(BrandModelVarient.fromJson(
            documentSnapshot.data() as Map<String, dynamic>));
      }
    } catch (e) {
      print("------------eeeee-----$e");
    }

    return brands;
  }

  static Future<List<Rto>> getRtoLocations() async {
    List<Rto> rto = [];
    try {
      CollectionReference collection = firestore.collection('rtoLocations');
      QuerySnapshot querySnapshot = await collection.get();
      for (QueryDocumentSnapshot documentSnapshot in querySnapshot.docs) {
        rto.add(Rto.fromJson(documentSnapshot.data() as Map<String, dynamic>));
      }
    } catch (e) {
      debugPrint("error om getting rto locations $e");
    }
    return rto;
  }
}
