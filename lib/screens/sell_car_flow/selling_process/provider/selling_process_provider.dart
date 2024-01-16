import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flikcar/common_widgets/snackbar.dart';
import 'package:flikcar/models/brand_model_varient.dart';
import 'package:flikcar/screens/home_screen/home_screen.dart';

import 'package:flutter/material.dart';

class SellingProcessProvider extends ChangeNotifier {
  static FirebaseFirestore firestore = FirebaseFirestore.instance;

  late BrandModelVarient selectedbrand;
  List<Model> selecedModels = [];
  int counter = 1;

  String contactNumber = "";
  String selectedBrandId = "";
  String selectedModelId = "";
  String registerationYear = "";
  String sellingTime = "";
  int brandIndex = -1;
  int modelIndex = -1;

  List<String> list = ["", "", "", ""];

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

  setSellingTime({required String time}) {
    sellingTime = time;
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
    //  notifyListeners();
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
          print(list);

          if (list[2] != "") {
            controller.animateToPage(3,
                duration: const Duration(milliseconds: 200),
                curve: Curves.bounceInOut);
            //counter = 4;
            bookInspection(context: context);

            notifyListeners();
          } else {
            ScaffoldMessenger.of(context).showSnackBar(MySnackbar.showSnackBar(
                context, "Please enter registered year and phone number"));
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
          list = ["", "", "", ""];
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

      default:
        {
          print("Invalid choice");
        }
        break;
    }
  }

  void bookInspection({required BuildContext context}) {
    try {
      String id = DateTime.now().millisecondsSinceEpoch.toString();
      CollectionReference collection =
          FirebaseFirestore.instance.collection('sell_vehicle_enquiries');
      var requestBody = {
        "brand": "${list[0]}",
        "model": "${list[1]}",
        "registrationYear": "$registerationYear",
        "phone": "$contactNumber",
        "status": "IN-PROGRESS",
        "timeOfSelling": sellingTime,
        "createdAt": DateTime.now().millisecondsSinceEpoch,
        "id": id,
      };
      debugPrint("$requestBody");

      collection.doc(id).set(requestBody).then((value) {
        if (context.mounted) {
          clearData();
          ScaffoldMessenger.of(context).showSnackBar(MySnackbar.showSnackBar(
            context,
            "Car details uploaded successfully",
          ));
          Timer(const Duration(seconds: 1), () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => const HomeScreen(index: 1),
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
                    },
                    child: const Text('Ok'),
                  ),
                ],
              ),
            );
          });
        }
      });
    } catch (e) {
      debugPrint("-------------------$e");
      ScaffoldMessenger.of(context).showSnackBar(MySnackbar.showSnackBar(
        context,
        "Failed to upload car, please try again later",
      ));
    }
  }

  clearData() {
    counter = 1;
    selectedBrandId = "";
    registerationYear = "";
    selectedModelId = "";
    brandIndex = -1;
    modelIndex = -1;

    list = [
      "",
      "",
      "",
      "",
    ];
    notifyListeners();
  }
}
