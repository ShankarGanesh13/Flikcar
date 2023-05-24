import 'package:flikcar/common_widgets/snackbar.dart';
import 'package:flikcar/screens/home_screen/home_screen.dart';
import 'package:flikcar/screens/sell_car_flow/selling_process/car_condition/car_condition.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SellingProcessProvider extends ChangeNotifier {
  int counter = 1;
  late String selectedBrand;
  late String selectedLocation;
  late String manufacturingYear;
  late String carModel;
  late String fuelType;
  late String transmissonType;
  late String varient;
  late String carOwnership;
  late String kilometersDriven;
  late String sellingTime;
  int sellingTimeIndex = -1;
  int kilometersDrivenIndex = -1;
  int carOwnershipIndex = -1;
  int fuelTypeIndex = -1;
  int transmissonTypeIndex = -1;
  int varientIndex = -1;
  int brandIndex = -1;
  int locationIndex = -1;
  int manufacturingYearIndex = -1;
  int modelIndex = -1;

  List<String> list = ["", "", "", "", "", "", "", "", "", ""];

  setBrand({required String brand, required int selectedIndex}) {
    selectedBrand = brand;
    list[0] = brand;
    brandIndex = selectedIndex;
    notifyListeners();
  }

  setlocation({required String location, required int selectedIndex}) {
    selectedLocation = location;
    list[1] = location;
    locationIndex = selectedIndex;
    notifyListeners();
  }

  setManufacturingYear({required String year, required int selectedIndex}) {
    manufacturingYear = year;
    list[2] = year;
    manufacturingYearIndex = selectedIndex;
    notifyListeners();
  }

  setCarModel({required String model, required int selectedIndex}) {
    carModel = model;
    list[3] = carModel;
    modelIndex = selectedIndex;
    notifyListeners();
  }

  setFuelType({required String fuel, required int selectedIndex}) {
    fuelType = fuel;
    list[4] = fuel;
    fuelTypeIndex = selectedIndex;
    notifyListeners();
  }

  setTransmissonType(
      {required String transmisson, required int selectedIndex}) {
    transmissonType = transmisson;
    list[5] = transmisson;
    transmissonTypeIndex = selectedIndex;
    notifyListeners();
  }

  setCarVarient({required String varient, required int selectedIndex}) {
    fuelType = varient;
    list[6] = varient;
    varientIndex = selectedIndex;
    notifyListeners();
  }

  setCarOwnership({required String ownership, required int selectedIndex}) {
    carOwnership = ownership;
    list[7] = ownership;
    carOwnershipIndex = selectedIndex;
    notifyListeners();
  }

  setKilometersDriven(
      {required String kilometers, required int selectedIndex}) {
    kilometersDriven = kilometers;
    list[8] = kilometers;
    kilometersDrivenIndex = selectedIndex;
    notifyListeners();
  }

  setSellingTime({required String time, required int selectedIndex}) {
    sellingTime = time;
    list[9] = time;
    sellingTimeIndex = selectedIndex;
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
                context, "Please select your RTO location"));
          }
        }
        break;

      case 3:
        {
          if (list[2] != "") {
            controller.animateToPage(3,
                duration: const Duration(milliseconds: 200),
                curve: Curves.bounceInOut);
            counter = 4;
            notifyListeners();
          } else {
            ScaffoldMessenger.of(context).showSnackBar(MySnackbar.showSnackBar(
                context, "Please select your car manufacturing year"));
          }
        }
        break;

      case 4:
        {
          if (list[3] != "") {
            controller.animateToPage(4,
                duration: const Duration(milliseconds: 200),
                curve: Curves.bounceInOut);
            counter = 5;
            notifyListeners();
          } else {
            ScaffoldMessenger.of(context).showSnackBar(MySnackbar.showSnackBar(
                context, "Please select your car model"));
          }
        }
        break;
      case 5:
        {
          if (list[4] != "" && list[5] != "" && list[6] != "") {
            controller.animateToPage(5,
                duration: const Duration(milliseconds: 200),
                curve: Curves.bounceInOut);
            counter = 6;
            notifyListeners();
          } else {
            ScaffoldMessenger.of(context).showSnackBar(MySnackbar.showSnackBar(
                context, "Please select all the required properties"));
          }
        }
        break;
      case 6:
        {
          if (list[7] != "") {
            controller.animateToPage(6,
                duration: const Duration(milliseconds: 200),
                curve: Curves.bounceInOut);
            counter = 7;
            notifyListeners();
          } else {
            ScaffoldMessenger.of(context).showSnackBar(MySnackbar.showSnackBar(
                context, "Please select the ownership history"));
          }
        }
        break;
      case 7:
        {
          if (list[8] != "") {
            controller.animateToPage(7,
                duration: const Duration(milliseconds: 200),
                curve: Curves.bounceInOut);
            counter = 8;
            notifyListeners();
          } else {
            ScaffoldMessenger.of(context).showSnackBar(MySnackbar.showSnackBar(
                context, "Please select the kilometers driven"));
          }
        }
        break;
      case 8:
        {
          if (list[9] != "") {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const CarCondition()));
            // clearData();
          } else {
            ScaffoldMessenger.of(context).showSnackBar(MySnackbar.showSnackBar(
                context, "Please select the time period"));
          }
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
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const HomeScreen()));
        }
        break;

      case 2:
        {
          controller.animateToPage(0,
              duration: const Duration(milliseconds: 200),
              curve: Curves.bounceInOut);

          counter = 1;
          notifyListeners();
        }
        break;

      case 3:
        {
          controller.animateToPage(1,
              duration: const Duration(milliseconds: 200),
              curve: Curves.bounceInOut);
          counter = 2;
          notifyListeners();
        }
        break;

      case 4:
        {
          controller.animateToPage(2,
              duration: const Duration(milliseconds: 200),
              curve: Curves.bounceInOut);

          counter = 3;
          notifyListeners();
        }
        break;
      case 5:
        {
          controller.animateToPage(3,
              duration: const Duration(milliseconds: 200),
              curve: Curves.bounceInOut);
          counter = 4;
          notifyListeners();
        }
        break;
      case 6:
        {
          controller.animateToPage(4,
              duration: const Duration(milliseconds: 200),
              curve: Curves.bounceInOut);
          counter = 5;
          notifyListeners();
        }
        break;
      case 7:
        {
          controller.animateToPage(5,
              duration: const Duration(milliseconds: 200),
              curve: Curves.bounceInOut);
          counter = 6;
          notifyListeners();
        }
        break;
      case 8:
        {
          controller.animateToPage(6,
              duration: const Duration(milliseconds: 200),
              curve: Curves.bounceInOut);
          counter = 7;
          notifyListeners();
        }
        break;

      default:
        {
          print("Invalid choice");
        }
        break;
    }
  }

  clearData() {
    counter = 1;
    selectedBrand = "";
    selectedLocation = "";
    manufacturingYear = "";
    carModel = "";
    fuelType = "";
    carOwnership = "";
    kilometersDriven = "";
    sellingTime = "";
    varientIndex = -1;
    brandIndex = -1;
    locationIndex = -1;
    manufacturingYearIndex = -1;
    modelIndex = -1;
    sellingTimeIndex = -1;
    kilometersDrivenIndex = -1;
    carOwnershipIndex = -1;
    fuelTypeIndex = -1;
    transmissonTypeIndex = -1;
    varientIndex = -1;

    list = ["", "", "", "", "", "", "", "", "", ""];
    notifyListeners();
  }
}
