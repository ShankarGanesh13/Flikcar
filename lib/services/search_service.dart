import 'dart:convert';
import 'package:flikcar/models/body_type_model.dart';
import 'package:flikcar/models/fuel_type_model.dart';
import 'package:flikcar/models/owner_type_model.dart';
import 'package:flikcar/models/search_req_model.dart';
import 'package:http/http.dart' as http;
import 'package:flikcar/models/buyer_car_model.dart';
import 'package:flikcar/models/car_brand_model.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SearchService extends ChangeNotifier {
  List<CarBrandModel> brandAndModel = [];
  List<FuelTypeModel> fuel = [];
  List<BodyTypeModel> bodyType = [];
  List<OwnerTypeModel> ownership = [];
  List<int> brandFilter = [];
  List<int> modelFilter = [];
  List<int> fuelFilter = [];
  List<int> bodytypeFilter = [];
  List<int> seatsFilter = [];
  List<String> transmissionFilter = [];
  List<int> ownersFilter = [];
  List<int> kmsDrivenFilter = [];
  List<int> modelyearFilter = [];
  List<int> budgetFilter = [];
  List<BuyerCar> allCars = [];
  List<String> appliedFilters = [];
  List<BuyerCar> searchedCarList = [];

  //////////
  getBrandAndModels() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    final String? token = sp.getString('userToken');
    List<CarBrandModel> carModel = [];
    var url =
        Uri.parse('http://webservice.flikcar.com:8000/api/cars/make-model');

    var response = await http.get(url, headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    });
    var data = jsonDecode(response.body);
    List result = data["data"] as List;
    for (var i = 0; i < result.length; i++) {
      carModel.add(
        CarBrandModel.fromJson(result[i]),
      );
    }
    brandAndModel = carModel;
    notifyListeners();
    print(brandAndModel);
  }

  getFuelTypes() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    final String? token = sp.getString('userToken');
    fuel = [];
    var url = Uri.parse('http://webservice.flikcar.com:8000/api/cars/fuel');

    var response = await http.get(url, headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    });
    var data = jsonDecode(response.body);
    List result = data["data"] as List;
    for (var i = 0; i < result.length; i++) {
      fuel.add(
        FuelTypeModel.fromJson(result[i]),
      );
    }

    notifyListeners();
    print(fuel);
  }

  getBodyTypes() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    final String? token = sp.getString('userToken');
    bodyType = [];
    var url =
        Uri.parse('http://webservice.flikcar.com:8000/api/cars/body-type');

    var response = await http.get(url, headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    });
    var data = jsonDecode(response.body);
    List result = data["data"] as List;
    for (var i = 0; i < result.length; i++) {
      bodyType.add(
        BodyTypeModel.fromJson(result[i]),
      );
    }

    notifyListeners();
    print(bodyType);
  }

  getOwnerTypes() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    final String? token = sp.getString('userToken');
    ownership = [];
    var url = Uri.parse('http://webservice.flikcar.com:8000/api/cars/owner');

    var response = await http.get(url, headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    });
    var data = jsonDecode(response.body);
    List result = data["data"] as List;
    for (var i = 0; i < result.length; i++) {
      print(result[i]);
      ownership.add(
        OwnerTypeModel.fromJson(result[i]),
      );
      print(OwnerTypeModel.fromJson(result[i]).ownerType);
    }

    notifyListeners();
    print(ownership);
  }

  addBrandFilter({required List<CarBrandModel> brands}) {
    brandFilter = [];
    brands.forEach((element) {
      brandFilter.add(element.id);
    });

    notifyListeners();
    print(brandFilter);
  }

  addmodelFilter({required List<CarModel> models}) {
    modelFilter = [];
    models.forEach((element) {
      modelFilter.add(element.id);
    });

    notifyListeners();
    print(modelFilter);
  }

  addBudgetFilter({required int min, required int max}) {
    budgetFilter = [min, max];
    notifyListeners();
    print(budgetFilter);
  }

  addFuelFilter({required List<int> fuel}) {
    fuelFilter = fuel;
    print(fuelFilter);
    notifyListeners();
  }

  addBodytypeFilter({required List<int> bodyType}) {
    bodytypeFilter = bodyType;
    notifyListeners();
    print(bodytypeFilter);
  }

  addOwnersFilter({required List<int> owner}) {
    ownersFilter = owner;
    notifyListeners();
  }

  addKmsDrivenFilter({required int min, required int max}) {
    kmsDrivenFilter = [min, max];
    notifyListeners();
  }

  addModelYearFilter({required List<String> year}) {
    modelyearFilter = [];
    year.forEach((element) {
      modelyearFilter.add(int.parse(element));
    });
    print(modelyearFilter);
    print(modelyearFilter.length);
    notifyListeners();
  }

  addTransmissonFilter({required String transmission}) {
    transmissionFilter = [transmission];
    notifyListeners();
    print(transmissionFilter);
  }

  showFilterResult() async {
    allCars = [];
    final SharedPreferences sp = await SharedPreferences.getInstance();
    final String? token = sp.getString('userToken');
    var url =
        Uri.parse('http://webservice.flikcar.com:8000/api/cars/search-car');
    SearchReqModel body = SearchReqModel(
        brand: brandFilter,
        model: modelFilter,
        bodytype: bodytypeFilter,
        seats: [],
        fuel: fuelFilter,
        transmission: transmissionFilter,
        owners: ownersFilter,
        modelyear: modelyearFilter,
        drivenkm: kmsDrivenFilter,
        budget: budgetFilter,
        type: "app");
    print("brand ${body.brand}");
    print("model ${body.model}");
    print("bodyType ${body.bodytype}");
    print("fuel ${body.fuel}");
    print("transmisson ${body.transmission}");
    print("owner ${body.owners}");
    print("modelYear ${body.modelyear}");
    print("driveKm ${body.drivenkm}");
    print("budget ${body.budget}");
    print("type ${body.type}");

    var response = await http.post(
      url,
      headers: {
        "Content-Type": "application/json",
        "Authorization": 'Bearer $token',
      },
      body: json.encode(body),
    );
    print("function called");
    var data = json.decode(response.body);

    var allData = data["data"] as List;

    for (var i = 0; i < allData.length; i++) {
      allCars.add(BuyerCar.fromJson(allData[i]));
      // BuyerCar car = BuyerCar.fromJson(allData[i]);
      // print(car.registrationYear);
    }
    searchedCarList = allCars;
    notifyListeners();
    print("car list length ${allCars.length}");
  }

  clearAllFilter() async {
    allCars = [];
    brandFilter = [];
    modelFilter = [];
    bodytypeFilter = [];
    fuelFilter = [];
    transmissionFilter = [];
    ownersFilter = [];
    modelyearFilter = [];
    kmsDrivenFilter = [];
    budgetFilter = [];

    final SharedPreferences sp = await SharedPreferences.getInstance();
    final String? token = sp.getString('userToken');
    var url =
        Uri.parse('http://webservice.flikcar.com:8000/api/cars/search-car');
    SearchReqModel body = SearchReqModel(
        brand: brandFilter,
        model: modelFilter,
        bodytype: bodytypeFilter,
        seats: [],
        fuel: fuelFilter,
        transmission: transmissionFilter,
        owners: ownersFilter,
        modelyear: modelyearFilter,
        drivenkm: kmsDrivenFilter,
        budget: budgetFilter,
        type: "app");

    var response = await http.post(
      url,
      headers: {
        "Content-Type": "application/json",
        "Authorization": 'Bearer $token',
      },
      body: json.encode(body),
    );
    var data = json.decode(response.body);

    var allData = data["data"] as List;

    for (var i = 0; i < allData.length; i++) {
      allCars.add(BuyerCar.fromJson(allData[i]));
      // BuyerCar car = BuyerCar.fromJson(allData[i]);
      // print(car.registrationYear);
    }
    searchedCarList = allCars;
    notifyListeners();
    print("car list length ${allCars.length}");
  }

  getAppliedFilters() {
    appliedFilters = [];
    if (brandFilter.isNotEmpty) {
      appliedFilters.add("Brand");
    }
    if (modelFilter.isNotEmpty) {
      appliedFilters.add("Model");
    }
    if (fuelFilter.isNotEmpty) {
      appliedFilters.add("Fuel type");
    }
    if (bodytypeFilter.isNotEmpty) {
      appliedFilters.add("Body type");
    }
    if (transmissionFilter.isNotEmpty) {
      appliedFilters.add("Transmisson");
    }
    if (ownersFilter.isNotEmpty) {
      appliedFilters.add("Ownership");
    }
    if (kmsDrivenFilter.isNotEmpty) {
      appliedFilters.add("Kms driven");
    }
    if (modelyearFilter.isNotEmpty) {
      appliedFilters.add("Model year");
    }
    if (budgetFilter.isNotEmpty) {
      appliedFilters.add("Budget");
    }

    print(appliedFilters);
  }

  removeFilter({required String filter}) async {
    appliedFilters.remove(filter);
    if (filter == "Brand") {
      brandFilter = [];
    }
    if (filter == "Model") {
      modelFilter = [];
    }
    if (filter == "Fuel type") {
      fuelFilter = [];
    }
    if (filter == "Body type") {
      bodytypeFilter = [];
    }
    if (filter == "Transmisson") {
      transmissionFilter = [];
    }
    if (filter == "Ownership") {
      ownersFilter = [];
    }
    if (filter == "Kms driven") {
      kmsDrivenFilter = [];
    }
    if (filter == "Model year") {
      modelyearFilter = [];
    }
    if (filter == "Budget") {
      budgetFilter = [];
    }
    notifyListeners();
    final SharedPreferences sp = await SharedPreferences.getInstance();
    final String? token = sp.getString('userToken');
    var url =
        Uri.parse('http://webservice.flikcar.com:8000/api/cars/search-car');

    SearchReqModel body = SearchReqModel(
        brand: brandFilter,
        model: modelFilter,
        bodytype: bodytypeFilter,
        seats: [],
        fuel: fuelFilter,
        transmission: transmissionFilter,
        owners: ownersFilter,
        modelyear: modelyearFilter,
        drivenkm: kmsDrivenFilter,
        budget: budgetFilter,
        type: "app");

    var response = await http.post(
      url,
      headers: {
        "Content-Type": "application/json",
        "Authorization": 'Bearer $token',
      },
      body: json.encode(body),
    );
    var data = json.decode(response.body);
    allCars = [];
    var allData = data["data"] as List;

    for (var i = 0; i < allData.length; i++) {
      allCars.add(BuyerCar.fromJson(allData[i]));
      // BuyerCar car = BuyerCar.fromJson(allData[i]);
      // print(car.registrationYear);
    }
    searchedCarList = allCars;
    print("car list length ${allCars.length}");

    notifyListeners();
  }

  searchFunction(String query) {
    searchedCarList = allCars;
    searchedCarList = allCars
        .where((item) => item.model.toLowerCase().contains(query.toLowerCase()))
        .toList();
    notifyListeners();
  }
}
// List<int> brandFilter = [];
//   List<int> modelFilter = [];
//   List<int> fuelFilter = [];
//   List<int> bodytypeFilter = [];
//   List<int> seatsFilter = [];
//   List<String> transmissionFilter = [];
//   List<int> ownersFilter = [];
//   List<int> kmsDrivenFilter = [];
//   List<int> modelyearFilter = [];
//   List<int> budgetFilter = [];