import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flikcar/firebase_models/firebase_buyer_car.dart';
import 'package:flikcar/models/body_type_model.dart';
import 'package:flikcar/models/brand_model_varient.dart';
import 'package:flikcar/models/fuel_type_model.dart';
import 'package:flikcar/models/owner_type_model.dart';
import 'package:flikcar/services/get_brand_model_varient.dart';
import 'package:flutter/material.dart';

class SearchService extends ChangeNotifier {
  List<FuelTypeModel> fuelTypes = [];
  List<BodyTypeModel> bodyType = [];
  List<OwnerTypeModel> ownershipType = [];

  List<String> allSelectedFilters = [];

  List<String> selectedBodyTypeFilters = [];
  List<String> selectedFuelTypeFilters = [];
  List<String> selectedOwnershipTypeFilters = [];
  List<String> selectedTransmissionTypeFilters = [];
  List<String> selectedBrand = [];
  List<String> selectedModel = [];

  List<BrandModelVarient> brandModel = [];
  List<Model> models = [];

  int? maxYear;
  int? minYear;
  int? maxPrice;
  int? minPrice;

  //List<FirebaseBuyerCar> searchedCarList = [];

  List<TransmissionType> transmissonType = [
    TransmissionType(transmissionType: "Automatic", id: 1, isSelected: false),
    TransmissionType(transmissionType: "Manual", id: 2, isSelected: false),
  ];

  List<FirebaseBuyerCar> filteredCars = [];

  int sort = -1;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  //////////
  ///
  ///
  getSortId({required int sortId}) {
    sort = sortId;
    notifyListeners();
  }

  getSelectedFuelTypeFilter({required String fuelFilter}) {
    if (!selectedFuelTypeFilters.contains(fuelFilter)) {
      selectedFuelTypeFilters.add(fuelFilter);
    } else {
      selectedFuelTypeFilters.remove(fuelFilter);
    }
    debugPrint("$selectedFuelTypeFilters");
  }

  getSelectedBodyTypeFilter({required String bodyTypeFilter}) {
    if (!selectedBodyTypeFilters.contains(bodyTypeFilter)) {
      selectedBodyTypeFilters.add(bodyTypeFilter);
    } else {
      selectedBodyTypeFilters.remove(bodyTypeFilter);
    }
    debugPrint("$selectedBodyTypeFilters");
  }

  getSelectedTransmissionTypeFilter({required String transmissionFilter}) {
    if (!selectedTransmissionTypeFilters.contains(transmissionFilter)) {
      selectedTransmissionTypeFilters.add(transmissionFilter);
    } else {
      selectedTransmissionTypeFilters.remove(transmissionFilter);
    }
    debugPrint("$selectedTransmissionTypeFilters");
  }

  getSelectedOwnerTypeFilter({required String ownershipFilter}) {
    if (!selectedOwnershipTypeFilters.contains(ownershipFilter)) {
      selectedOwnershipTypeFilters.add(ownershipFilter);
    } else {
      selectedOwnershipTypeFilters.remove(ownershipFilter);
    }
    debugPrint("$selectedOwnershipTypeFilters");
  }

  getMaxMinPrice({required int max, required int min}) {
    maxPrice = max;
    minPrice = min;
  }

  getMaxMinYear({required int max, required int min}) {
    maxYear = max;
    minYear = min;
  }

  getBrandModelVarient() async {
    brandModel = await GetBrandModelVarient.getBrandModelVarient();
  }

  getSelectedBrand({required String brand}) {
    if (!selectedBrand.contains(brand)) {
      selectedBrand.add(brand);
    } else {
      selectedBrand.remove(brand);
    }
    debugPrint("$selectedBrand");
  }

  getSelectedModel({required String model}) {
    if (!selectedModel.contains(model)) {
      selectedModel.add(model);
    } else {
      selectedModel.remove(model);
    }
    debugPrint("$selectedModel");
  }

  sortList() {
    if (sort == 0) {
      filteredCars.sort((a, b) => a.carPrice.compareTo(b.carPrice));

      //  filteredCars.forEach((element) {});
    }
    if (sort == 1) {
      filteredCars.sort((a, b) => b.carPrice.compareTo(a.carPrice));
    }
    notifyListeners();
  }

  clearAllFilter() async {}

  searchFunction(String query) {
    // searchedCarList = allCars;
    // searchedCarList = allCars
    //     .where((item) => item.properties.model.toLowerCase().contains(
    //           query.toLowerCase(),
    //         ))
    //     .toList();
    // notifyListeners();
  }

  filterCars() async {
    debugPrint("filter cars called");
    filteredCars = [];
    CollectionReference collection = firestore.collection("vehicles");

    try {
      QuerySnapshot query = await collection.get();
      for (var doc in query.docs) {
        var car = FirebaseBuyerCar.fromJson(doc.data() as Map<String, dynamic>);

        // Apply filters
        if ((minYear == null || car.properties.registrationYear >= minYear!) &&
                (maxYear == null ||
                    car.properties.registrationYear <= maxYear!) &&
                //
                (minPrice == null || int.parse(car.carPrice) >= minPrice!) &&
                (maxPrice == null || int.parse(car.carPrice) <= maxPrice!) &&
                //
                (selectedFuelTypeFilters.isEmpty ||
                    selectedFuelTypeFilters
                        .contains(car.properties.fuelType)) &&
                //
                (selectedModel.isEmpty ||
                    selectedModel.contains(car.properties.model)) &&
                (selectedBrand.isEmpty ||
                    selectedBrand.contains(car.properties.brand)) &&
                //
                (selectedOwnershipTypeFilters.isEmpty ||
                    selectedOwnershipTypeFilters
                        .contains(car.properties.ownerType)) &&
                //
                (selectedTransmissionTypeFilters.isEmpty ||
                    selectedTransmissionTypeFilters
                        .contains(car.properties.transmission)) &&
                //
                (selectedBodyTypeFilters.isEmpty ||
                    selectedBodyTypeFilters.contains(car.properties.bodyType))
            //
            ) {
          filteredCars.add(car);
        }
      }
    } catch (e) {
      debugPrint("$e");
      debugPrint("error in  filter cars");
    }
    notifyListeners();
    debugPrint("filtered cars---------------------- $filteredCars");
  }

  getFuelType() async {
    fuelTypes = await GetBrandModelVarient.getFuelType();
    notifyListeners();
  }

  getBodyType() async {
    bodyType = await GetBrandModelVarient.getBodyType();
    notifyListeners();
  }

  getownership() async {
    ownershipType = await GetBrandModelVarient.getownership();
    notifyListeners();
  }
}
