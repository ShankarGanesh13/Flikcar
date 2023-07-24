import 'dart:convert';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flikcar/common_widgets/snackbar.dart';
import 'package:flikcar/models/features_model.dart';
import 'package:flikcar/screens/dealers_flow/dealer_flow.dart';
import 'package:flikcar/screens/sell_car_flow/selling_process/kilometers_driven/kilometers_driven.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class DealerUploadCar extends ChangeNotifier {
  int featuresIndex = 0;
  List<FeatureModel> comfortFeatures = [];
  List<FeatureModel> safetyFeatures = [];
  List<FeatureModel> interiorFeatures = [];
  List<FeatureModel> exteriorFeatures = [];
  List<FeatureModel> entertainmentFeatures = [];
  int brandId = 0;
  int modelId = 0;
  int varientId = 5;
  int registerationYear = 1000;
  int bodyTypeId = 0;
  int fuelTypeId = 0;
  String transmisson = "automatic";
  int ownershipId = 0;
  int colorId = 0;
  int driveKm = 2000;
  int carPrice = 100000;
  String description = "";
  int groundClearance = 0;
  int length = 0;
  int seat = 2;
  int frontTyres = 1;
  int bootSpace = 0;
  int rearTyres = 0;
  int fuelCapacity = 0;
  String wheelCover = "yes";
  int wheelbase = 100;
  String spareWheel = "yes";
  int height = 100;
  int width = 100;
  String alloyWheels = "yes";
  int driveTrain = 14;
  int gearBox = 11;
  int displacement = 20;
  int noOfCylinder = 4;
  int valveCylinder = 44;
  String limitedSlipDiff = "yes";
  String turboCharger = "yes";
  int maxPower = 10;
  int maxTorque = 100;
  int mileage = 33;
  String suspensionFront = "";
  String suspensionRear = "";
  String frontBrakeType = "";
  String rearBrakeType = "";
  String steeringType = "";
  int city = 592;
  List<int> selectedComfort = [];
  List<int> selectedInterior = [];
  List<int> selectedExterior = [];
  List<int> selectedSafety = [];
  List<int> selectedEntertainment = [];

  changeFeatureIndex(int index) {
    featuresIndex = index;
    notifyListeners();
  }

  getBrandId({required int id}) {
    brandId = id;
    print(brandId);
  }

  getModelId({required int id}) {
    modelId = id;
  }

  getVarientId({required int id}) {
    varientId = id;
    print("000000000000000000");
    print(varientId);
  }

  getYearId({required int year}) {
    registerationYear = year;
  }

  getFuelId({required int id}) {
    fuelTypeId = id;
  }

  getBodyTypeId({required int id}) {
    bodyTypeId = id;
  }

  getOwnershipId({required int id}) {
    ownershipId = id;
  }

  getColorId({required int id}) {
    colorId = id;
  }

  getTransmisson({required String trans}) {
    transmisson = trans;
  }

  getKilometerDriven({required int kms}) {
    print(".................");
    print(kms);
    print(".................");

    driveKm = kms;
    print("----------");
    print(driveKm);
    print("----------");
  }

  getSellingPrice({required int price}) {
    carPrice = price;
  }

  getDescription({required String des}) {
    description = des;
  }

  getGroundClearance({required int clearance}) {
    groundClearance = clearance;
  }

  getSeatCapacity({required int capacity}) {
    seat = capacity;
  }

  getBootSpace({required int boot}) {
    bootSpace = boot;
  }

  getFuelCapacity({required int capacity}) {
    fuelCapacity = capacity;
  }

  getWheelbase({required int wheelbasevalue}) {
    wheelbase = wheelbasevalue;
  }

  getLength({required int carLength}) {
    length = carLength;
  }

  getFrontTyres({required int frontTyresValue}) {
    frontTyres = frontTyresValue;
  }

  getRearTyres({required int rearTyreValue}) {
    rearTyres = rearTyreValue;
  }

  getHeight({required int heightValue}) {
    height = heightValue;
  }

  getWidth({required int widthValue}) {
    width = widthValue;
  }

  getWheelCover({required String wheelcover}) {
    wheelCover = wheelcover;
  }

  getAlloyWheel({required String alloywheel}) {
    alloyWheels = alloywheel;
  }

  getSpareWheel({required String sparewheel}) {
    spareWheel = sparewheel;
  }

  getDriveTrain({required int drivetrain}) {
    driveTrain = drivetrain;
  }

  getGearbox({required int gearbox}) {
    gearBox = gearbox;
  }

  getCc({required int cc}) {
    displacement = cc;
  }

  getNoOfCylinder({required int noCylinder}) {
    noOfCylinder = noCylinder;
  }

  getValve({required int valve}) {
    valveCylinder = valve;
  }

  getLsd({required String lsd}) {
    limitedSlipDiff = lsd;
  }

  getTurboCharger({required String turbocharger}) {
    turboCharger = turbocharger;
  }

  getPowerDetails({required int power}) {
    maxPower = power;
  }

  getTorqueDetails({required int torque}) {
    maxTorque = torque;
  }

  getMileage({required int kmpl}) {
    mileage = kmpl;
  }

  getFrontSuspension({required String frontsuspension}) {
    suspensionFront = frontsuspension;
  }

  getRearSuspension({required String rearsuspension}) {
    suspensionRear = rearsuspension;
  }

  getFrontBrakes({required String frontbrake}) {
    frontBrakeType = frontbrake;
  }

  getRearBrakes({required String rearbrake}) {
    rearBrakeType = rearbrake;
  }

  getSteering({required String steering}) {
    steeringType = steering;
  }

  addFeatures({required String feature, required int id}) {
    print(feature);
    switch (feature) {
      case "comfort":
        {
          selectedComfort.add(id);
        }
        break;
      case "safety":
        {
          selectedSafety.add(id);
        }
        break;
      case "interior":
        {
          selectedInterior.add(id);
        }
        break;
      case "exterior":
        {
          selectedExterior.add(id);
        }
        break;
      case "entertainment":
        {
          selectedEntertainment.add(id);
        }
        break;
      default:
        {
          print("------------------------------");
          print("Invalid choice");
        }
        break;
    }
  }

  removeFeatures({required String feature, required int id}) {
    print(feature);
    switch (feature) {
      case "comfort":
        {
          selectedComfort.remove(id);
        }
        break;
      case "safety":
        {
          selectedSafety.remove(id);
        }
        break;
      case "interior":
        {
          selectedInterior.remove(id);
        }
        break;
      case "exterior":
        {
          selectedExterior.remove(id);
        }
        break;
      case "entertainment":
        {
          selectedEntertainment.remove(id);
        }
        break;
      default:
        {
          print("------------------------------");
          print("Invalid choice");
        }
        break;
    }
  }

  getComfortFeatures() async {
    comfortFeatures = [];
    final SharedPreferences sp = await SharedPreferences.getInstance();
    Uri url =
        Uri.parse('https://webservice.flikcar.com:8000/api/dealer/car/comfort');
    String? dealerToken = sp.getString('dealerToken');

    var response = await http.get(url, headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $dealerToken',
    });
    var body = jsonDecode(response.body);
    var data = body["data"] as List;

    data.forEach((element) {
      comfortFeatures.add(FeatureModel.fromJson(element));
    });
    notifyListeners();
  }

  getInteriorFeatures() async {
    interiorFeatures = [];
    final SharedPreferences sp = await SharedPreferences.getInstance();
    Uri url = Uri.parse(
        'https://webservice.flikcar.com:8000/api/dealer/car/interior');
    String? dealerToken = sp.getString('dealerToken');

    var response = await http.get(url, headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $dealerToken',
    });
    var body = jsonDecode(response.body);
    var data = body["data"] as List;

    data.forEach((element) {
      interiorFeatures.add(FeatureModel.fromJson(element));
    });
    notifyListeners();
  }

  getExteriorFeatures() async {
    exteriorFeatures = [];
    final SharedPreferences sp = await SharedPreferences.getInstance();
    Uri url = Uri.parse(
        'https://webservice.flikcar.com:8000/api/dealer/car/exterior');
    String? dealerToken = sp.getString('dealerToken');

    var response = await http.get(url, headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $dealerToken',
    });
    var body = jsonDecode(response.body);
    var data = body["data"] as List;

    data.forEach((element) {
      exteriorFeatures.add(FeatureModel.fromJson(element));
    });
    notifyListeners();
  }

  getSafetyFeatures() async {
    safetyFeatures = [];
    final SharedPreferences sp = await SharedPreferences.getInstance();
    Uri url =
        Uri.parse('https://webservice.flikcar.com:8000/api/dealer/car/safety');
    String? dealerToken = sp.getString('dealerToken');

    var response = await http.get(url, headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $dealerToken',
    });
    var body = jsonDecode(response.body);
    var data = body["data"] as List;

    data.forEach((element) {
      safetyFeatures.add(FeatureModel.fromJson(element));
    });
    notifyListeners();
  }

  getEntertainmentFeatures() async {
    entertainmentFeatures = [];
    final SharedPreferences sp = await SharedPreferences.getInstance();
    Uri url = Uri.parse(
        'https://webservice.flikcar.com:8000/api/dealer/car/entertainment-communications');
    String? dealerToken = sp.getString('dealerToken');

    var response = await http.get(url, headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $dealerToken',
    });
    var body = jsonDecode(response.body);
    var data = body["data"] as List;

    data.forEach((element) {
      entertainmentFeatures.add(FeatureModel.fromJson(element));
    });
    notifyListeners();
  }

  FilePickerResult? result;

  bool isLoading = false;
  List<File> fileToDisplay = [];
  PlatformFile? pickedFile;
  List<String> carImages = [];
  pickCarImages({required BuildContext context}) async {
    try {
      result = await FilePicker.platform.pickFiles(
        type: FileType.image,
        allowMultiple: true,
      );
      if (result != null) {
        print("--------------");
        print(result!.files.length);

        result!.files.forEach((element) {
          carImages.add(element.path.toString());
          fileToDisplay!.add(File(element.path.toString()));
        });
        notifyListeners();
        print(carImages);
        print("////////////");
        print(fileToDisplay);
        // pickedFile = result!.files.first;
        // fileToDisplay = fileToDisplay.add(File(pickedFile!.path.toString()));
      }
    } catch (e) {
      print(e);
    }

    if (carImages.isNotEmpty) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            duration: Duration(seconds: 2),
            backgroundColor: Color(0xFF45C08D),
            content: Text("Image Selected"),
          ),
        );
      }
    }
    if (carImages.isEmpty) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            duration: Duration(seconds: 2),
            backgroundColor: Color(0xFF45C08D),
            content: Text(
              "No image selected",
            ),
          ),
        );
      }
    }
    return result;
  }

  removeImage({required File image, required BuildContext context}) {
    fileToDisplay.remove(image);
    if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          duration: Duration(seconds: 1),
          backgroundColor: Color(0xFF45C08D),
          content: Text("Image removed"),
        ),
      );
    }
    notifyListeners();
  }

  uploadCar(context) async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    Uri url =
        Uri.parse('https://webservice.flikcar.com:8000/api/dealer/car/add-car');
    String? dealerToken = sp.getString('dealerToken');
    var request = http.MultipartRequest("POST", url);
    request.headers["Authorization"] = "Bearer $dealerToken";
    request.headers["Content-Type"] =
        "application/x-www-form-urlencoded; charset=UTF-8";
    request.fields["brand"] = "$brandId";
    request.fields["model"] = "$modelId";
    request.fields["variant"] = "$varientId";
    request.fields["registrationYear"] = "$registerationYear";
    request.fields["bodyType"] = "$bodyTypeId";
    request.fields["fuelType"] = "$fuelTypeId";
    request.fields["transmisson"] = "$transmisson";
    request.fields["ownerType"] = "$ownershipId";
    request.fields["color"] = "$colorId";
    request.fields["drivenKm"] = "$driveKm";
    request.fields["carPrice"] = "$carPrice";
    request.fields["description"] = "$description";
    request.fields["groundClearance"] = "$groundClearance";
    request.fields["length"] = "$length";
    request.fields["seat"] = "$seat";
    request.fields["frontTyres"] = "$frontTyres";
    request.fields["bootSpace"] = "$bootSpace";
    request.fields["rearTyre"] = "$rearTyres";
    request.fields["fuelTankCapacity"] = "$fuelCapacity";
    request.fields["wheelCover"] = "$wheelCover";
    request.fields["wheelbase"] = "$wheelbase";
    request.fields["sparewheel"] = "$spareWheel";
    request.fields["height"] = "$height";
    request.fields["width"] = "$width";
    request.fields["alloyWheels"] = "$alloyWheels";
    request.fields["driveTrain"] = "$driveTrain";
    request.fields["gearBox"] = "$gearBox";
    request.fields["displacement"] = "$displacement";
    request.fields["noOfCylinders"] = "$noOfCylinder";
    request.fields["valveCylinders"] = "$valveCylinder";
    request.fields["limitedSlipDiffer"] = "$limitedSlipDiff";
    request.fields["turbocharger"] = "$turboCharger";
    request.fields["maxPower"] = "$maxPower";
    request.fields["maxTorque"] = "$maxTorque";
    request.fields["mileage"] = "$mileage";
    request.fields["suspensionFront"] = "$suspensionFront";
    request.fields["suspensionRear"] = "$suspensionRear";
    request.fields["frontBrakeFront"] = "$frontBrakeType";
    request.fields["rearBrakeType"] = "$rearBrakeType";
    request.fields["steeringType"] = "$steeringType";
    request.fields["city"] = "592";
    request.fields["comforts"] = "$selectedComfort";
    request.fields["interior"] = "$selectedInterior";
    request.fields["exterior"] = "$selectedExterior";
    request.fields["entertainment"] = "$selectedEntertainment";
    request.fields["safety"] = "$selectedSafety";

    carImages.forEach((element) async {
      request.files.add(await http.MultipartFile.fromPath(
        "images",
        element,
      ));
    });

    var response = await request.send();

    var responseData = await response.stream.toBytes();

    var responseString = utf8.decode(responseData);

    var data = json.decode(responseString);

    if (data["success"] == false) {
      ScaffoldMessenger.of(context).showSnackBar(MySnackbar.showSnackBar(
          context, "Something went wrong try again later"));
    }
    if (data["success"] == true) {
      ScaffoldMessenger.of(context).showSnackBar(
          MySnackbar.showSnackBar(context, "Car uploaded successfully"));
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => const DealerFlow(
            index: 1,
          ),
        ),
        (route) => false,
      );
    }
    print(data);
  }
}
