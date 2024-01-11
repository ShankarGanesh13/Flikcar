import 'dart:convert';
import 'dart:io';
import 'dart:typed_data'; // Import this to use Uint8List

import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flikcar/common_widgets/snackbar.dart';
import 'package:flikcar/models/features_model.dart';
import 'package:flikcar/models/image_model.dart';
import 'package:flikcar/screens/dealers_flow/dealer_flow.dart';
import 'package:flikcar/services/firebase_auth_service/firebase_auth_service.dart';
import 'package:flikcar/utils/env.dart';
import 'package:flikcar/utils/fonts.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DealerUploadCar extends ChangeNotifier {
  int featuresIndex = 0;
  List<FeatureModel> comfortFeatures = [];
  List<FeatureModel> safetyFeatures = [];
  List<FeatureModel> interiorFeatures = [];
  List<FeatureModel> exteriorFeatures = [];
  List<FeatureModel> entertainmentFeatures = [];
  String brand = "";
  String model = "";
  String varient = "";
  String registerationYear = "";
  String manufacturedYear = "";
  String bodyType = "";
  String fuelType = "";
  String transmisson = "automatic";
  String ownership = "";
  String color = "";
  String driveKm = "";
  String carPrice = "";
  String description = "";
  String seat = "";
  String maxPower = "";
  String maxTorque = "";
  String mileage = "";
  String engineCC = "";
  String city = "";
  String rtoLocation = "";
  List<String> selectedComfort = [];
  List<String> selectedInterior = [];
  List<String> selectedExterior = [];
  List<String> selectedSafety = [];
  List<String> selectedEntertainment = [];
  String apiUrl = Env.apiUrl;
  static FirebaseFirestore firestore = FirebaseFirestore.instance;

  changeFeatureIndex(int index) {
    featuresIndex = index;
    notifyListeners();
  }

  increaseFeatureIndex() {
    featuresIndex++;
    notifyListeners();
  }

  getBrandId({required String brandName}) {
    brand = brandName;
    //  print(brand);
  }

  getRtoLocationId({required String id}) {
    rtoLocation = id;
    print(rtoLocation);

    //    print(brand);
  }

  getModelId({required String modelName}) {
    model = modelName;
    // print(model);
  }

  getVarientId({required String varientName}) {
    varient = varientName;

    //  print(varient);
  }

  getYearId({required String year}) {
    registerationYear = year;
    //print(registerationYear);
  }

  getFuelId({required String fuel}) {
    fuelType = fuel;
    //print(fuelType);
  }

  getBodyTypeId({required String bodyTypeName}) {
    bodyType = bodyTypeName;
    // print(bodyType);
  }

  getOwnershipId({required String owner}) {
    ownership = owner;
    // print(ownership);
  }

  getColorId({required String colorName}) {
    color = colorName;
    // print(color);
  }

  getTransmisson({required String trans}) {
    transmisson = trans;
    //  print(transmisson);
  }

  getKilometerDriven({required String kms}) {
    // print(".................");
    // print(kms);
    // print(".................");

    driveKm = kms;
    // print("----------");
    //  print(driveKm);
    // print("----------");
  }

  getSellingPrice({required String price}) {
    carPrice = price;
    // print(carPrice);
  }

  getManufacturedYear({required String year}) {
    manufacturedYear = year;
    // print(carPrice);
  }

  getDescription({required String des}) {
    description = des;
    // print(description);
  }

  getSeatCapacity({required String capacity}) {
    seat = capacity;
    // print(seat);
  }

  getPowerDetails({required String power}) {
    maxPower = power;
    // print(maxPower);
  }

  getTorqueDetails({required String torque}) {
    maxTorque = torque;
    //  print(maxTorque);
  }

  getMileage({required String kmpl}) {
    mileage = kmpl;
    // print(mileage);
  }

  getEngineCC({required String cc}) {
    engineCC = cc;
    // print(engineCC);
  }

  addFeatures({required String feature, required String id}) {
    //   print(feature);
    switch (feature) {
      case "comfort":
        {
          selectedComfort.add(id);
          //   print(selectedComfort);
        }
        break;
      case "safety":
        {
          selectedSafety.add(id);
          //  print(selectedSafety);
        }
        break;
      case "interior":
        {
          selectedInterior.add(id);
          //  print(selectedInterior);
        }
        break;
      case "exterior":
        {
          selectedExterior.add(id);
          //  print(selectedExterior);
        }
        break;
      case "entertainment":
        {
          selectedEntertainment.add(id);
          //    print(selectedEntertainment);
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

  removeFeatures({required String feature, required String id}) {
    debugPrint(feature);
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
    try {
      DocumentReference collection =
          firestore.collection('car_features').doc("1");
      DocumentSnapshot documentSnapshot = await collection.get();
      var data = documentSnapshot.data() as Map<String, dynamic>;

      for (var label in data["labels"] as List) {
        comfortFeatures.add(FeatureModel.fromJson(label));
      }
    } catch (e) {
      print("-----------------$e");
    }

    notifyListeners();
  }

  getinteriorFeatures() async {
    interiorFeatures = [];

    try {
      DocumentReference collection =
          firestore.collection('car_features').doc("3");
      DocumentSnapshot documentSnapshot = await collection.get();
      var data = documentSnapshot.data() as Map<String, dynamic>;

      for (var label in data["labels"] as List) {
        interiorFeatures.add(FeatureModel.fromJson(label));
      }
    } catch (e) {
      print("-----------------$e");
    }
    notifyListeners();
  }

  getExteriorFeatures() async {
    exteriorFeatures = [];
    try {
      DocumentReference collection =
          firestore.collection('car_features').doc("4");
      DocumentSnapshot documentSnapshot = await collection.get();
      var data = documentSnapshot.data() as Map<String, dynamic>;

      for (var label in data["labels"] as List) {
        exteriorFeatures.add(FeatureModel.fromJson(label));
      }
    } catch (e) {
      print("-----------------$e");
    }
    notifyListeners();
  }

  getSafetyFeatures() async {
    safetyFeatures = [];
    try {
      DocumentReference collection =
          firestore.collection('car_features').doc("2");
      DocumentSnapshot documentSnapshot = await collection.get();
      var data = documentSnapshot.data() as Map<String, dynamic>;

      for (var label in data["labels"] as List) {
        safetyFeatures.add(FeatureModel.fromJson(label));
      }
    } catch (e) {
      print("-----------------$e");
    }
    notifyListeners();
  }

  getEntertainmentFeatures() async {
    entertainmentFeatures = [];
    try {
      DocumentReference collection =
          firestore.collection('car_features').doc("5");
      DocumentSnapshot documentSnapshot = await collection.get();
      var data = documentSnapshot.data() as Map<String, dynamic>;

      for (var label in data["labels"] as List) {
        entertainmentFeatures.add(FeatureModel.fromJson(label));
      }
    } catch (e) {
      print("-----------------$e");
    }
    notifyListeners();
  }

  FilePickerResult? result;

  bool isLoading = false;
  PlatformFile? pickedFile;
  List<File> fileToDisplay = [];
  List<String> carImages = [];
  //
  List<File> interiorFileToDisplay = [];
  List<FirebaseImageModel> interiorImages = [];
  //
  List<File> exteriorFileToDisplay = [];
  List<FirebaseImageModel> exteriorImages = [];
  //
  List<File> engineFileToDisplay = [];
  List<FirebaseImageModel> engineImages = [];
  //
  List<File> tyreToDisplay = [];
  List<FirebaseImageModel> tyreImages = [];
  //
  List<File> dentsFileToDisplay = [];
  List<FirebaseImageModel> dentsImages = [];
  //
  List<File> thumbnailFileToDisplay = [];
  List<FirebaseImageModel> thumbnailImages = [];
  //
  List<File> otherFileToDisplay = [];
  List<FirebaseImageModel> otherImages = [];
  List<FirebaseImageModel> allImages = [];

  pickCarImages({
    required BuildContext context,
    required String type,
  }) {
    if (type == "interior") {
      pickImage(
          type: "INT",
          context: context,
          multipleSelect: true,
          displayFiles: interiorFileToDisplay,
          images: interiorImages);
    }
    if (type == "exterior") {
      pickImage(
          type: "EXT",
          context: context,
          multipleSelect: true,
          displayFiles: exteriorFileToDisplay,
          images: exteriorImages);
    }
    if (type == "dents") {
      pickImage(
          type: "DENT",
          context: context,
          multipleSelect: true,
          displayFiles: dentsFileToDisplay,
          images: dentsImages);
    }
    if (type == "tyres") {
      pickImage(
        type: "TYRE",
        context: context,
        displayFiles: tyreToDisplay,
        images: tyreImages,
        multipleSelect: true,
      );
    }
    if (type == "engine") {
      pickImage(
          type: "ENGINE",
          context: context,
          multipleSelect: true,
          displayFiles: engineFileToDisplay,
          images: engineImages);
    }
    if (type == "thumbnail") {
      pickImage(
          type: "THUMB",
          context: context,
          multipleSelect: false,
          displayFiles: thumbnailFileToDisplay,
          images: thumbnailImages);
    }
    if (type == "others") {
      pickImage(
          type: "OTHER",
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
      required String type,
      required List<FirebaseImageModel> images}) async {
    try {
      result = await FilePicker.platform.pickFiles(
        type: FileType.image,
        allowMultiple: multipleSelect,
      );
      if (result != null) {
        result!.files.forEach((element) {
          displayFiles!.add(File(element.path.toString()));
        });

        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              duration: const Duration(seconds: 5),
              backgroundColor: const Color(0xFF45C08D),
              content: const Text("Images Uploading, Please wait "),
              action: SnackBarAction(
                label: 'Dismiss',
                textColor: Colors.white,
                onPressed: () {},
              ),
            ),
          );
        }

        images.addAll(
            await uploadImagesToFirestore(files: displayFiles, type: type));

        notifyListeners();
      }
    } catch (e) {
      print(e);
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

  Future<List<FirebaseImageModel>> uploadImagesToFirestore(
      {required List<File> files, required String type}) async {
    final storage = FirebaseStorage.instance;
    List<FirebaseImageModel> imageUrls = [];

    for (var file in files) {
      try {
        // Compress the image before uploading
        List<int> compressedBytes = await FlutterImageCompress.compressWithList(
          file.readAsBytesSync(),
          minHeight: 800,
          minWidth: 600,
          quality: 65,
        );

        // Convert List<int> to Uint8List
        Uint8List compressedUint8List = Uint8List.fromList(compressedBytes);

        String fileName = DateTime.now().millisecondsSinceEpoch.toString();
        Reference storageReference = storage.ref().child('$fileName.jpg');

        // Upload the compressed image
        UploadTask uploadTask = storageReference.putData(compressedUint8List);

        TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() => null);

        String downloadUrl = await taskSnapshot.ref.getDownloadURL();
        imageUrls
            .add(FirebaseImageModel(imageType: type, imageUrl: downloadUrl));
      } catch (e) {
        print('Error uploading image: $e');
        // Handle errors if needed
      }
    }

    return imageUrls;
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

  mergeAllImages() {
    allImages.addAll(interiorImages);
    allImages.addAll(exteriorImages);
    allImages.addAll(thumbnailImages);
    allImages.addAll(dentsImages);
    allImages.addAll(otherImages);
    allImages.addAll(engineImages);
    allImages.addAll(tyreImages);
  }

  uploadCarToFirestore({required BuildContext context}) async {
    Map<String, dynamic> dealer = await FirebaseAuthService.getDealerDetails();
    final functions = FirebaseFunctions.instance;
    List<Map<String, String>> imageList = allImages
        .map((image) => Map<String, String>.from(image.toJson()))
        .toList();
    FirebaseAuth auth = FirebaseAuth.instance;
    // print("===============================${int.parse(maxPower)}");

    Map<String, dynamic> data = {
      "userId": auth.currentUser!.uid,
      "incomingVehicle": {
        "carPrice": int.parse(carPrice),
        "status": "AVAILABLE",
        "images": imageList,
        "properties": {
          "brand": brand,
          "model": model,
          "variant": varient,
          "fuelType": fuelType,
          "bodyType": bodyType,
          "color": color,
          "seat": int.parse(seat),
          "ownerType": ownership,
          "city": "Kolkata",
          "RTOlocation": rtoLocation,
          "kmsDriven": int.parse(driveKm),
          "registrationYear": int.parse(registerationYear),
          "manufacturedYear": int.parse(manufacturedYear),
          "maxPower": maxPower != "" ? int.parse(maxPower) : null,
          "maxTorque": maxTorque != "" ? int.parse(maxTorque) : null,
          "transmission": transmisson,
          "engineCC": engineCC != "" ? int.parse(engineCC) : null,
          "mileage": mileage != "" ? int.parse(mileage) : null,
          "description": description,
          "saleStatus": "AVAILABLE",
          "comfort": selectedComfort,
          "exterior": selectedExterior,
          "entertainment": selectedEntertainment,
          "safety": selectedSafety,
          "interior": selectedInterior,
          "uploadedBy": auth.currentUser!.uid,
          "uploadedAt": DateTime.now().millisecondsSinceEpoch,
        },
        "dealer": {
          "id": auth.currentUser!.uid,
          "name": dealer["name"],
          "phone": dealer["phoneNumber"],
          "address": dealer["shopAddress"],
        },
      }
    };

    try {
      print("function called");
      final callable = functions.httpsCallable('createVehicle');
      final result = await callable(data);
      debugPrint("${result.data}");
      if (result.data["status"] == "SUCCESS") {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
              MySnackbar.showSnackBar(context, "Car uploaded successfully"));
          clearData();
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
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(MySnackbar.showSnackBar(
            context, "Something went wrong try again later"));
      }
    } catch (e) {
      print("=================$e");
      ScaffoldMessenger.of(context).showSnackBar(MySnackbar.showSnackBar(
          context, "Something went wrong try again later"));
    }
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
    allImages = [];
    notifyListeners();
  }

  updateDealerUploadedCar(
      {required String brand,
      required BuildContext context,
      required int carPrice,
      required String model,
      required String varient,
      required String fuelType,
      required String bodyType,
      required String color,
      required int seat,
      required String ownerType,
      required String rtoLocation,
      required int kmsDriven,
      required int registrationYear,
      required int manufacturingYear,
      required String transmission,
      required String mileage,
      required String description,
      required String carId}) async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    FirebaseAuth auth = FirebaseAuth.instance;
    DocumentReference vehicleRef = firestore.collection('vehicles').doc(carId);
    var vehicleSnapshot = await vehicleRef.get();
    var data = vehicleSnapshot.data() as Map<String, dynamic>;
    var properties = data["properties"];

    properties["brand"] = brand;
    properties["model"] = model;
    properties["variant"] = varient;
    properties["fuelType"] = fuelType;
    properties["bodyType"] = bodyType;
    properties["color"] = color;
    properties["seat"] = seat;
    properties["ownerType"] = ownerType;
    properties["city"] = "Kolkata";
    properties["RTOlocation"] = rtoLocation;
    properties["kmsDriven"] = kmsDriven;
    properties["registrationYear"] = registrationYear;
    properties["manufacturedYear"] = manufacturingYear;
    properties["transmission"] = transmission;
    properties["description"] = description;
    properties["uploadedAt"] = DateTime.now().millisecondsSinceEpoch;
    vehicleRef.update({
      "properties": properties,
      "carPrice": carPrice,
    });

    DocumentReference dealerRef = firestore
        .collection("users")
        .doc(auth.currentUser!.uid)
        .collection('listedVehicles')
        .doc(carId);
    dealerRef.update({
      "carPrice": carPrice,
      "brand": brand,
      "model": model,
      "variant": varient,
      "fuelType": fuelType,
      "ownerType": ownerType,
      "kmsDriven": kmsDriven,
      "registrationYear": registrationYear,
      "transmission": transmission,
      "uploadedAt": DateTime.now().millisecondsSinceEpoch,
    });
    Navigator.pop(context);
    ScaffoldMessenger.of(context).showSnackBar(
        MySnackbar.showSnackBar(context, "Car Updated Successfully"));

    // vehicleRef.update({
    //   "brand": brand,
    //   "model": model,
    //   "variant": varient,
    //   "fuelType": fuelType,
    //   "bodyType": bodyType,
    //   "color": color,
    //   "seat": seat,
    //   "ownerType": ownerType,
    //   "city": "Kolkata",
    //   "RTOlocation": rtoLocation,
    //   "kmsDriven": kmsDriven,
    //   "registrationYear": registrationYear,
    //   "manufacturedYear": manufacturingYear,
    //   "transmission": transmission,
    //   "description": description,
    //   "uploadedAt": DateTime.now().millisecondsSinceEpoch,
    // });
    //  {
  }
}
