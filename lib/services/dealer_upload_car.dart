import 'dart:convert';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flikcar/common_widgets/snackbar.dart';
import 'package:flikcar/models/features_model.dart';
import 'package:flikcar/models/image_model.dart';
import 'package:flikcar/screens/dealers_flow/dealer_flow.dart';
import 'package:flikcar/screens/sell_car_flow/selling_process/kilometers_driven/kilometers_driven.dart';
import 'package:flikcar/services/facebook_events.dart';
import 'package:flikcar/services/firebase_events.dart';
import 'package:flikcar/utils/env.dart';
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
  String brand = "";
  String model = "";
  String varient = "";
  String registerationYear = "";
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
    print(registerationYear);
  }

  getFuelId({required String fuel}) {
    fuelType = fuel;
    print(fuelType);
  }

  getBodyTypeId({required String bodyTypeName}) {
    bodyType = bodyTypeName;
    print(bodyType);
  }

  getOwnershipId({required String owner}) {
    ownership = owner;
    print(ownership);
  }

  getColorId({required String colorName}) {
    color = colorName;
    print(color);
  }

  getTransmisson({required String trans}) {
    transmisson = trans;
    print(transmisson);
  }

  getKilometerDriven({required String kms}) {
    // print(".................");
    // print(kms);
    // print(".................");

    driveKm = kms;
    // print("----------");
    print(driveKm);
    // print("----------");
  }

  getSellingPrice({required String price}) {
    carPrice = price;
    print(carPrice);
  }

  getDescription({required String des}) {
    description = des;
    print(description);
  }

  getSeatCapacity({required String capacity}) {
    seat = capacity;
    print(seat);
  }

  getPowerDetails({required String power}) {
    maxPower = power;
    print(maxPower);
  }

  getTorqueDetails({required String torque}) {
    maxTorque = torque;
    print(maxTorque);
  }

  getMileage({required String kmpl}) {
    mileage = kmpl;
    print(mileage);
  }

  getEngineCC({required String cc}) {
    engineCC = cc;
    print(engineCC);
  }

  addFeatures({required String feature, required String id}) {
    //   print(feature);
    switch (feature) {
      case "comfort":
        {
          selectedComfort.add(id);
          print(selectedComfort);
        }
        break;
      case "safety":
        {
          selectedSafety.add(id);
          print(selectedSafety);
        }
        break;
      case "interior":
        {
          selectedInterior.add(id);
          print(selectedInterior);
        }
        break;
      case "exterior":
        {
          selectedExterior.add(id);
          print(selectedExterior);
        }
        break;
      case "entertainment":
        {
          selectedEntertainment.add(id);
          print(selectedEntertainment);
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
    Uri url = Uri.parse('$apiUrl/dealer/car/comfort');
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
    Uri url = Uri.parse('$apiUrl/dealer/car/interior');
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
    Uri url = Uri.parse('$apiUrl/dealer/car/exterior');
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
    Uri url = Uri.parse('$apiUrl/dealer/car/safety');
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
    Uri url = Uri.parse('$apiUrl/dealer/car/entertainment-communications');
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

        images.addAll(
            await uploadImagesToFirestore(files: displayFiles, type: type));

        notifyListeners();
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

  Future<List<FirebaseImageModel>> uploadImagesToFirestore(
      {required List<File> files, required String type}) async {
    final storage = FirebaseStorage.instance;
    List<FirebaseImageModel> imageUrls = [];

    for (var file in files) {
      try {
        String fileName = DateTime.now().millisecondsSinceEpoch.toString();
        Reference storageReference = storage.ref().child('$fileName.jpg');

        UploadTask uploadTask = storageReference.putFile(file);

        TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() => null);

        String downloadUrl = await taskSnapshot.ref.getDownloadURL();
        imageUrls
            .add(FirebaseImageModel(imageType: type, imageUrl: downloadUrl));
      } catch (e) {
        print('Error uploading image: $e');
        // Handle errors if needed
      }
    }
    // print("||||||||||||||||||||||||||||||||||||||||||||||||||||||$imageUrls");
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

  uploadCarToFirestore() async {
    List<Map<String, String>> imageList = allImages
        .map((image) => Map<String, String>.from(image.toJson()))
        .toList();
    FirebaseAuth auth = FirebaseAuth.instance;

    final firestore = FirebaseFirestore.instance;
    Map<String, dynamic> data = {
      "id": DateTime.now().microsecondsSinceEpoch,
      "carPrice": carPrice,
      "status": "ACTIVE",
      "images": imageList,
      "properties": {
        "brand": brand,
        "model": model,
        "variant": varient,
        "fuelType": fuelType,
        "bodyType": bodyType,
        "color": color,
        "seat": seat,
        "ownerType": ownership,
        "city": rtoLocation,
      },
      "saleStatus": "AVAILABLE",
      "uploadedBy": auth.currentUser!.uid,
      "uploadedAt": DateTime.now().microsecondsSinceEpoch,
      "dealer": {
        "id": auth.currentUser!.uid,
        "name": "Dealer",
        "phone": auth.currentUser!.phoneNumber,
        "address": "Kolkata",
      },
    };
    try {
      await firestore
          .collection('vehicles')
          .doc("${DateTime.now().microsecondsSinceEpoch}")
          .set(data);
    } catch (e) {
      print(e);
    }
  }

  // uploadCar(context) async {
  //     if (data["success"] == true) {
  //       ScaffoldMessenger.of(context).showSnackBar(
  //           MySnackbar.showSnackBar(context, "Car uploaded successfully"));
  //       Navigator.pushAndRemoveUntil(
  //         context,
  //         MaterialPageRoute(
  //           builder: (context) => const DealerFlow(
  //             index: 1,
  //           ),
  //         ),
  //         (route) => false,
  //       );
  //       showDialog<String>(
  //         context: context,
  //         builder: (BuildContext context) => AlertDialog(
  //           title: Text(
  //             'Car uploaded successfully',
  //             style: AppFonts.w700black16,
  //           ),
  //           content: Text(
  //             "The car details have been uploaded successfully and are now live for the customers.",
  //             style: AppFonts.w500black14,
  //           ),
  //           actions: <Widget>[
  //             TextButton(
  //               onPressed: () {
  //                 // FirebaseEvents()
  //                 //     .dealerUploadCar(dealerNumber: "dealer number");
  //                 // FacebookEvents()
  //                 //     .dealerUploadCar(dealerNumber: "dealer number");

  //                 Navigator.pushAndRemoveUntil(
  //                   context,
  //                   MaterialPageRoute(
  //                       builder: (context) => const DealerFlow(index: 1)),
  //                   (route) => false,
  //                 );
  //               },
  //               child: const Text('OK'),
  //             ),
  //           ],
  //         ),
  //       );
  //       debugPrint("success status code ${data["status"]}");
  //     } else {
  //       ScaffoldMessenger.of(context).showSnackBar(MySnackbar.showSnackBar(
  //           context, "Something went wrong try again later"));
  //       debugPrint("error status code ${data["status"]}");
  //     }
  //   } catch (error) {
  //     print("Error: $error");
  //     ScaffoldMessenger.of(context).showSnackBar(MySnackbar.showSnackBar(
  //         context, "Something went wrong try again later"));
  //   }

  //   clearData();
  // }

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
