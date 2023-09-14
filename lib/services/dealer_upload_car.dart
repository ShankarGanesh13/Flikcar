import 'dart:convert';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flikcar/common_widgets/snackbar.dart';
import 'package:flikcar/models/features_model.dart';
import 'package:flikcar/screens/dealers_flow/dealer_flow.dart';
import 'package:flikcar/screens/sell_car_flow/selling_process/kilometers_driven/kilometers_driven.dart';
import 'package:flikcar/services/facebook_events.dart';
import 'package:flikcar/services/firebase_events.dart';
import 'package:flikcar/utils/fonts.dart';
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
  String brandId = "";
  String modelId = "";
  String varientId = "";
  String registerationYear = "";
  String bodyTypeId = "";
  String fuelTypeId = "";
  String transmisson = "automatic";
  String ownershipId = "";
  String colorId = "";
  String driveKm = "";
  String carPrice = "";
  String description = "";
  String groundClearance = "";
  String length = "";
  String seat = "";
  String frontTyres = "";
  String bootSpace = "";
  String rearTyres = "";
  String fuelCapacity = "";
  String wheelCover = "yes";
  String wheelbase = "";
  String spareWheel = "yes";
  String height = "";
  String width = "";
  String alloyWheels = "yes";
  String driveTrain = "";
  String gearBox = "";
  String displacement = "";
  String noOfCylinder = "";
  String valveCylinder = "";
  String limitedSlipDiff = "yes";
  String turboCharger = "yes";
  String maxPower = "";
  String maxTorque = "";
  String mileage = "";
  String suspensionFront = "";
  String suspensionRear = "";
  String frontBrakeType = "";
  String rearBrakeType = "";
  String steeringType = "";
  String engineCC = "";
  String city = "";
  List<int> selectedComfort = [];
  List<int> selectedInterior = [];
  List<int> selectedExterior = [];
  List<int> selectedSafety = [];
  List<int> selectedEntertainment = [];

  changeFeatureIndex(int index) {
    featuresIndex = index;
    notifyListeners();
  }

  increaseFeatureIndex() {
    featuresIndex++;
    notifyListeners();
  }

  getBrandId({required String id}) {
    brandId = id;
    // print(brandId);
  }

  getModelId({required String id}) {
    modelId = id;
  }

  getVarientId({required String id}) {
    varientId = id;
    //  print(varientId);
  }

  getYearId({required String year}) {
    registerationYear = year;
  }

  getFuelId({required String id}) {
    fuelTypeId = id;
  }

  getBodyTypeId({required String id}) {
    bodyTypeId = id;
  }

  getOwnershipId({required String id}) {
    ownershipId = id;
  }

  getColorId({required String id}) {
    colorId = id;
  }

  getTransmisson({required String trans}) {
    transmisson = trans;
  }

  getKilometerDriven({required String kms}) {
    // print(".................");
    // print(kms);
    // print(".................");

    driveKm = kms;
    // print("----------");
    // print(driveKm);
    // print("----------");
  }

  getSellingPrice({required String price}) {
    carPrice = price;
  }

  getDescription({required String des}) {
    description = des;
  }

  getGroundClearance({required String clearance}) {
    groundClearance = clearance;
  }

  getSeatCapacity({required String capacity}) {
    seat = capacity;
  }

  getBootSpace({required String boot}) {
    bootSpace = boot;
  }

  getFuelCapacity({required String capacity}) {
    fuelCapacity = capacity;
  }

  getWheelbase({required String wheelbasevalue}) {
    wheelbase = wheelbasevalue;
  }

  getLength({required String carLength}) {
    length = carLength;
  }

  getFrontTyres({required String frontTyresValue}) {
    frontTyres = frontTyresValue;
  }

  getRearTyres({required String rearTyreValue}) {
    rearTyres = rearTyreValue;
  }

  getHeight({required String heightValue}) {
    height = heightValue;
  }

  getWidth({required String widthValue}) {
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

  getDriveTrain({required String drivetrain}) {
    driveTrain = drivetrain;
  }

  getGearbox({required String gearbox}) {
    gearBox = gearbox;
  }

  getCc({required String cc}) {
    displacement = cc;
  }

  getNoOfCylinder({required String noCylinder}) {
    noOfCylinder = noCylinder;
  }

  getValve({required String valve}) {
    valveCylinder = valve;
  }

  getLsd({required String lsd}) {
    limitedSlipDiff = lsd;
  }

  getTurboCharger({required String turbocharger}) {
    turboCharger = turbocharger;
  }

  getPowerDetails({required String power}) {
    maxPower = power;
  }

  getTorqueDetails({required String torque}) {
    maxTorque = torque;
  }

  getMileage({required String kmpl}) {
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

  getEngineCC({required String cc}) {
    engineCC = cc;
  }

  addFeatures({required String feature, required int id}) {
    //   print(feature);
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

  getinteriorFeatures() async {
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
  PlatformFile? pickedFile;
  List<File> fileToDisplay = [];
  List<String> carImages = [];
  //
  List<File> interiorFileToDisplay = [];
  List<String> interiorImages = [];
  //
  List<File> exteriorFileToDisplay = [];
  List<String> exteriorImages = [];
  //
  List<File> engineFileToDisplay = [];
  List<String> engineImages = [];
  //
  List<File> tyreToDisplay = [];
  List<String> tyreImages = [];
  //
  List<File> dentsFileToDisplay = [];
  List<String> dentsImages = [];
  //
  List<File> thumbnailFileToDisplay = [];
  List<String> thumbnailImages = [];
  //
  List<File> otherFileToDisplay = [];
  List<String> otherImages = [];

  pickCarImages({
    required BuildContext context,
    required String type,
  }) {
    if (type == "interior") {
      pickImage(
          context: context,
          multipleSelect: true,
          displayFiles: interiorFileToDisplay,
          images: interiorImages);
    }
    if (type == "exterior") {
      pickImage(
          context: context,
          multipleSelect: true,
          displayFiles: exteriorFileToDisplay,
          images: exteriorImages);
    }
    if (type == "dents") {
      pickImage(
          context: context,
          multipleSelect: true,
          displayFiles: dentsFileToDisplay,
          images: dentsImages);
    }
    if (type == "tyres") {
      pickImage(
        context: context,
        displayFiles: tyreToDisplay,
        images: tyreImages,
        multipleSelect: true,
      );
    }
    if (type == "engine") {
      pickImage(
          context: context,
          multipleSelect: true,
          displayFiles: engineFileToDisplay,
          images: engineImages);
    }
    if (type == "thumbnail") {
      pickImage(
          context: context,
          multipleSelect: false,
          displayFiles: thumbnailFileToDisplay,
          images: thumbnailImages);
    }
    if (type == "others") {
      pickImage(
          context: context,
          multipleSelect: true,
          displayFiles: otherFileToDisplay,
          images: otherImages);
    } else {
      print("+++++++++++++++");
      print("invalid type");

      print("+++++++++++++");
    }
  }

  ////////////////////
  pickImage(
      {required BuildContext context,
      required List<File> displayFiles,
      required bool multipleSelect,
      required List<String> images}) async {
    try {
      result = await FilePicker.platform.pickFiles(
        type: FileType.image,
        allowMultiple: multipleSelect,
      );
      if (result != null) {
        result!.files.forEach((element) {
          images.add(element.path.toString());
          displayFiles!.add(File(element.path.toString()));
        });
        notifyListeners();

        // pickedFile = result!.files.first;
        // fileToDisplay = fileToDisplay.add(File(pickedFile!.path.toString()));
      }
    } catch (e) {
      print(e);
    }

    if (images.isNotEmpty) {
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
    if (images.isEmpty) {
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
  }

  ////////////////////////////
  removeImage(
      {required File image,
      required BuildContext context,
      required String type}) {
    if (type == "interior") {
      interiorFileToDisplay.remove(image);
    }
    if (type == "exterior") {
      exteriorFileToDisplay.remove(image);
    }
    if (type == "dents") {
      dentsFileToDisplay.remove(image);
    }
    if (type == "tyres") {
      tyreToDisplay.remove(image);
    }
    if (type == "engine") {
      engineFileToDisplay.remove(image);
    }
    if (type == "thumbnail") {
      thumbnailFileToDisplay.remove(image);
    }
    if (type == "others") {
      otherFileToDisplay.remove(image);
    } else {
      print("+++++++++++++++");
      print("invalid type");

      print("+++++++++++++");
    }
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
    Uri url = Uri.parse(
        'https://webservice.flikcar.com:8000/api/dealer/car/new-add-car');
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
    request.fields["engine"] = "$engineCC";

    tyreImages.forEach((element) async {
      request.files.add(await http.MultipartFile.fromPath(
        "tyreImages",
        element,
      ));
    });
    thumbnailImages.forEach((element) async {
      request.files.add(await http.MultipartFile.fromPath(
        "thumbImage",
        element,
      ));
    });
    dentsImages.forEach((element) async {
      request.files.add(await http.MultipartFile.fromPath(
        "dentImages",
        element,
      ));
    });
    engineImages.forEach((element) async {
      request.files.add(await http.MultipartFile.fromPath(
        "engineImages",
        element,
      ));
    });
    exteriorImages.forEach((element) async {
      request.files.add(await http.MultipartFile.fromPath(
        "exteriorImages",
        element,
      ));
    });
    otherImages.forEach((element) async {
      request.files.add(await http.MultipartFile.fromPath(
        "extraImages",
        element,
      ));
    });

    interiorImages.forEach((element) async {
      request.files.add(await http.MultipartFile.fromPath(
        "interiorImages",
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
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => const DealerFlow(
            index: 1,
          ),
        ),
        (route) => false,
      );
      showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: Text(
            'Car uploaded successfully',
            style: AppFonts.w700black16,
          ),
          content: Text(
            "The car details have been uploaded successfully and are now live for the customers.",
            style: AppFonts.w500black14,
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                FirebaseEvents().dealerUploadCar(dealerNumber: "dealer number");
                FacebookEvents().dealerUploadCar(dealerNumber: "dealer number");

                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const DealerFlow(index: 1)),
                  (route) => false,
                );
              },
              child: const Text('OK'),
            ),
          ],
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(MySnackbar.showSnackBar(
          context, "Something went wrong try again later"));
    }
    clearData();
    print(data);
  }

  clearData() {
    featuresIndex = 0;
    interiorFileToDisplay = [];
    interiorImages = [];
    //
    exteriorFileToDisplay = [];
    exteriorImages = [];
    //
    engineFileToDisplay = [];
    engineImages = [];
    //
    tyreToDisplay = [];
    tyreImages = [];
    //
    dentsFileToDisplay = [];
    dentsImages = [];
    //
    thumbnailFileToDisplay = [];
    thumbnailImages = [];
    //
    otherFileToDisplay = [];
    otherImages = [];
    notifyListeners();
  }
}
