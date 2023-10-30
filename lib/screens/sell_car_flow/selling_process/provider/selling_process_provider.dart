import 'dart:async';
import 'dart:convert';

import 'package:flikcar/common_widgets/snackbar.dart';
import 'package:flikcar/models/brand_model_varient.dart';
import 'package:flikcar/screens/home_screen/home_screen.dart';
import 'package:flikcar/screens/sell_car_flow/selling_process/car_condition/car_condition.dart';
import 'package:flikcar/screens/sell_car_flow/selling_process/splash_screen.dart/splash_screen.dart';
import 'package:flikcar/services/facebook_events.dart';
import 'package:flikcar/services/firebase_events.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:shared_preferences/shared_preferences.dart';

class SellingProcessProvider extends ChangeNotifier {
  late BrandModelVarient selectedbrand;
  List<Model> selecedModels = [];
  int counter = 1;

  String contactNumber = "";
  String selectedBrandId = "";
  String selectedModelId = "";
  String registerationYear = "";

  int brandIndex = -1;
  int modelIndex = -1;
  // late String selectedLocation;
  // late String fuelType;
  // late String transmissonType;
  // late String varient;
  // late String carOwnership;
  // late String kilometersDriven;
  // late String sellingTime;
  // late String carCondition;
  // String minExpectedPrice = "";
  // String maxExpectedPrice = "";
  // int sellingTimeIndex = -1;
  // int kilometersDrivenIndex = -1;
  // int carOwnershipIndex = -1;
  // int fuelTypeIndex = -1;
  // int transmissonTypeIndex = -1;
  // int varientIndex = -1;
  // int locationIndex = -1;
  // int carConditionIndex = -1;

  List<String> list = ["", "", "", "", "", "", "", "", "", ""];

  setBrand(
      {required String brandId,
      required List<Model> models,
      required String brand,
      required int index}) {
    selectedBrandId = brandId;
    brandIndex = index;
    list[0] = brand;
    selecedModels = models;
    notifyListeners();
  }

  setManufacturingYear({required String year}) {
    registerationYear = year;
    print(registerationYear);
    list[2] = year;
    //manufacturingYearIndex = selectedIndex;
    notifyListeners();
  }

  setContactNumber({required String phone}) {
    contactNumber = phone;
    list[3] = phone;
    //manufacturingYearIndex = selectedIndex;
    notifyListeners();
  }

  setCarModel(
      {required String modelid, required int index, required String model}) {
    selectedModelId = modelid;
    modelIndex = index;
    list[1] = model;

    notifyListeners();
  }

//////////////////////////////////////////////////////////////////
  nextStep(
      {required PageController controller, required BuildContext context}) {
    switch (counter) {
      case 1:
        {
          if (list[0] != "") {
            controller.animateToPage(1,
                duration: const Duration(milliseconds: 200),
                curve: Curves.bounceInOut);
            counter = 2;
            notifyListeners();
          } else {
            ScaffoldMessenger.of(context).showSnackBar(MySnackbar.showSnackBar(
                context, "Please select your car brand "));
          }
          print("nc1");
        }
        break;

      case 2:
        {
          if (list[1] != "") {
            controller.animateToPage(2,
                duration: const Duration(milliseconds: 200),
                curve: Curves.bounceInOut);
            counter = 3;
            notifyListeners();
          } else {
            ScaffoldMessenger.of(context).showSnackBar(MySnackbar.showSnackBar(
                context, "Please select your car model"));
          }
          print("nc2");
        }
        break;

      case 3:
        {
          if (list[2] != "" && list[3] != "") {
            controller.animateToPage(3,
                duration: const Duration(milliseconds: 200),
                curve: Curves.bounceInOut);
            //counter = 4;
            bookInspection(context: context);

            notifyListeners();
          } else {
            ScaffoldMessenger.of(context).showSnackBar(MySnackbar.showSnackBar(
                context, "Please enter manufacturing year and phone number"));
          }
          print("nc3");
        }
        break;

      default:
        {
          print("Invalid choice");
        }
        break;
    }
  }

  /////////////////////////////////////////////////////
  previousStep(
      {required PageController controller, required BuildContext context}) {
    switch (counter) {
      case 1:
        {
          print("previous step called");
          // Navigator.push(
          //     context,
          //     MaterialPageRoute(
          //         builder: (context) => const HomeScreen(index: 1)));
          Navigator.pop(context);
          print("pc1");
          list = ["", "", "", "", "", "", "", "", "", ""];
          modelIndex = -1;
          brandIndex = -1;
          notifyListeners();
        }
        break;

      case 2:
        {
          controller.animateToPage(0,
              duration: const Duration(milliseconds: 200),
              curve: Curves.bounceInOut);
          modelIndex = -1;
          list[1] = "";
          counter = 1;
          notifyListeners();
          print("pc2");
        }
        break;

      case 3:
        {
          controller.animateToPage(1,
              duration: const Duration(milliseconds: 200),
              curve: Curves.bounceInOut);
          counter = 2;
          notifyListeners();
          print("pc3");
        }
        break;

      // case 4:
      //   {
      //     controller.animateToPage(2,
      //         duration: const Duration(milliseconds: 200),
      //         curve: Curves.bounceInOut);

      //     counter = 3;
      //     notifyListeners();
      //     print("pc4");
      //   }
      //   break;

      default:
        {
          print("Invalid choice");
        }
        break;
    }
  }

  bookInspection({required BuildContext context}) async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    final String? token = sp.getString('userToken');

    var url = Uri.parse(
        'https://webservice.flikcar.com/api/web/sale-car/cars/add-sale');

    var requestBody = {
      "brand": "$selectedBrandId",
      "model": "$selectedModelId",
      "year": "$registerationYear",
      "contact": "$contactNumber",
    };

    var response = await http.post(url,
        headers: {'Authorization': 'Bearer $token'}, body: requestBody);
    print(response.body);
    var data = json.decode(response.body);
    print(data);

    if (data["status"] == 201 || data["status"] == 200) {
      if (context.mounted) {
        clearData();
        ScaffoldMessenger.of(context).showSnackBar(MySnackbar.showSnackBar(
            context, "Car details uploaded successfully"));
        Timer(const Duration(seconds: 1), () {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => const HomeScreen(
                index: 1,
              ),
            ),
            (route) => false,
          );
          showDialog<String>(
            context: context,
            builder: (BuildContext context) => AlertDialog(
              title: const Text('Thank you for registering with us'),
              content: const Text('Our team will contact you shortly'),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.pop(context, 'Cancel');
                    //  FirebaseEvents().customerCarSellRequest(customerNumber: "");
                    //  FacebookEvents().customerCarSellRequest(customerNumber: "");
                  },
                  child: const Text('Ok'),
                ),
              ],
            ),
          );
        });
      }
      print("Added to wishlist");
    } else {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(MySnackbar.showSnackBar(
            context, "Falied to upload car try again later"));
      }
      print('Request failed with status: ${response.statusCode}');
    }
  }

  clearData() {
    counter = 1;
    selectedBrandId = "";
    registerationYear = "";
    selectedModelId = "";
    // selectedLocation = "";
    // fuelType = "";
    // carOwnership = "";
    // kilometersDriven = "";
    // sellingTime = "";
    // varientIndex = -1;
    //  locationIndex = -1;
    brandIndex = -1;

    modelIndex = -1;
    // sellingTimeIndex = -1;
    // kilometersDrivenIndex = -1;
    // carOwnershipIndex = -1;
    // fuelTypeIndex = -1;
    // transmissonTypeIndex = -1;
    // varientIndex = -1;

    list = ["", "", "", "", "", "", "", "", "", ""];
    notifyListeners();
  }
}
