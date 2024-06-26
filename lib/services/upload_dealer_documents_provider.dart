import 'dart:convert';
import 'dart:io';
import 'package:flikcar/screens/dealers_flow/dealer_flow.dart';
import 'package:flikcar/screens/dealers_flow/not_verified_dealer/not_verified_delaer.dart';
import 'package:flikcar/screens/onbording_screens/dealer_onboarding/terms_and_condition.dart';
import 'package:flikcar/utils/env.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

import 'package:file_picker/file_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UploadDealerDocumentsProvider extends ChangeNotifier {
  FilePickerResult? result;
  String? fileName;
  bool isLoading = false;
  File? fileToDisplay;
  PlatformFile? pickedFile;
  String panImagePath = "";
  String panCardNumber = "";
  String addressFrontImagePath = "";
  String addressBAckImagePath = "";
  String addressProofNumber = "";
  String dealershipImagePath = "";
  String tradeLicencePath = "";
  String tradeLicenceNumber = "";
  String cancelChequeNumber = "";
  String cancelChequePath = "";
  String udyogAadharPath = "";
  String udyogAadharNumber = "";
  String dealerName = "";
  String dealerEmail = "";
  String dealerShopName = "";
  String dealerGstNumber = "";
  String dealerShopAddress = "";
  //type
  //shopimage
  String pincode = "";
  String apiUrl = Env.apiUrl;

  pickFile({required BuildContext context, required String imageType}) async {
    try {
      result = await FilePicker.platform.pickFiles(
        type: FileType.image,
        allowMultiple: false,
      );
      if (result != null) {
        fileName = result!.files.first.name;
        pickedFile = result!.files.first;
        fileToDisplay = File(pickedFile!.path.toString());
        print(fileToDisplay!.path);
      }
    } catch (e) {
      print(e);
    }

    if (pickedFile != null) {
      selectImage(imageType: imageType, pickedFilePath: pickedFile!.path!);
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
    if (pickedFile == null) {
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

  getDocumentNumber(
      {required String documentNumber, required String documentType}) {
    switch (documentType) {
      case "address":
        {
          addressProofNumber = documentNumber;
          debugPrint(addressProofNumber);
        }
        break;
      case "pan":
        {
          panCardNumber = documentNumber;
          debugPrint(panCardNumber);
        }
        break;
      case "tradeLicence":
        {
          tradeLicenceNumber = documentNumber;
          debugPrint(tradeLicenceNumber);
        }
        break;
      case "udyogAadhar":
        {
          udyogAadharNumber = documentNumber;
          debugPrint(udyogAadharNumber);
        }
        break;
      case "cancelledCheque":
        {
          cancelChequeNumber = documentNumber;
          debugPrint(cancelChequeNumber);
        }
        break;

      default:
        {
          print("////////////////////////////////////////");
          print("invalid choice");
        }
        break;
    }
  }

  selectImage({required String imageType, required String pickedFilePath}) {
    switch (imageType) {
      case "addressFront":
        {
          addressFrontImagePath = pickedFilePath;
          notifyListeners();
        }
        break;
      case "addressBack":
        {
          addressBAckImagePath = pickedFilePath;
          notifyListeners();
        }
        break;
      case "dealershipImage":
        {
          dealershipImagePath = pickedFilePath;
          notifyListeners();
        }
        break;
      case "pan":
        {
          panImagePath = pickedFilePath;
          notifyListeners();
        }
        break;
      case "udyogAadhar":
        {
          udyogAadharPath = pickedFilePath;
          notifyListeners();
        }
        break;
      case "tradeLicence":
        {
          tradeLicencePath = pickedFilePath;
          notifyListeners();
        }
        break;
      case "cancelledCheque":
        {
          cancelChequePath = pickedFilePath;
          notifyListeners();
        }
        break;
      default:
        {
          print("////////////////////////////////////////");
          print("invalid choice");
        }
        break;
    }
  }

  validateForm(context) {
    if (addressFrontImagePath == '' ||
        addressBAckImagePath == "" ||
        dealershipImagePath == '' ||
        panImagePath == "" ||
        dealershipImagePath == "" ||
        tradeLicencePath == "" ||
        cancelChequePath == "") {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          duration: Duration(seconds: 2),
          backgroundColor: Color(0xFF45C08D),
          content: Text(
            "Please upload all the required document's image in all sections",
          ),
        ),
      );
    } else {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const TermsAndCondition(),
          ));
    }
  }

  getBasicDetails(
      {required String name,
      required String email,
      required String gstNumber,
      required String address,
      required String pincod,
      required String shopName}) {
    dealerName = name;
    dealerEmail = email;
    pincode = pincod;
    dealerGstNumber = gstNumber;
    dealerShopAddress = address;
    dealerShopName = shopName;
  }

  uploadDealerDocuments(context) async {
    print("uploadDealerDocuments");

    final SharedPreferences sp = await SharedPreferences.getInstance();
    Uri url = Uri.parse('$apiUrl/dealer/auth/update-profile');
    String? dealerToken = sp.getString('dealerToken');

    var request = http.MultipartRequest("POST", url);
    request.headers["Authorization"] = "Bearer $dealerToken";
    request.headers["Content-Type"] =
        "application/x-www-form-urlencoded; charset=UTF-8";
    request.fields["name"] = dealerName;
    request.fields["email"] = dealerEmail;
    request.fields["shopName"] = dealerShopName;
    request.fields["gstNo"] = dealerGstNumber;
    request.fields["shopAddress"] = dealerShopAddress;
    request.fields["state"] = "24";
    request.fields["city"] = "595";
    request.fields["pincode"] = pincode;
    request.fields["addressProofType"] = "aadhar";
    request.fields["addressProofNumber"] = addressProofNumber;
    request.fields["panCardNumber"] = panCardNumber;
    request.fields["tradeLicenseNumber"] = tradeLicenceNumber;
    request.fields["cancelChequeNumber"] = cancelChequeNumber;
    request.fields["udyogAadharNumber"] = udyogAadharNumber;

    // var panCardImageFile = File(pickedFile!.path!);

    // var addressProofFrontImageFile = File(pickedFile!.path!);
    // var addressProofBackImageFile = File(pickedFile!.path!);
    // var imageFile = File(pickedFile!.path!);

    request.files.add(await http.MultipartFile.fromPath(
      "panCardImage",
      panImagePath,
    ));
    request.files.add(await http.MultipartFile.fromPath(
      "tradeLicenseImage",
      tradeLicencePath,
    ));
    request.files.add(await http.MultipartFile.fromPath(
      "cancelChequeImage",
      cancelChequePath,
    ));
    udyogAadharNumber != ""
        ? request.files.add(await http.MultipartFile.fromPath(
            "udyogAadharImage",
            udyogAadharPath,
          ))
        : request.fields["udyogAadharImage"] = "";
    request.files.add(await http.MultipartFile.fromPath(
      "addressProofFrontImage",
      addressFrontImagePath,
    ));
    request.files.add(await http.MultipartFile.fromPath(
      "addressProofBackImage",
      addressBAckImagePath,
    ));
    request.files.add(await http.MultipartFile.fromPath(
      "shopImage",
      dealershipImagePath,
    ));

    var response = await request.send();

    var responseData = await response.stream.toBytes();

    var responseString = utf8.decode(responseData);

    var data = json.decode(responseString);
    print(data["status"]);

    if (data["status"] == 200 || data["status"] == 302) {
      debugPrint("+++++++++++++++++++++++");
      debugPrint("profile created");
      await sp.setString('dealerStatus', "Submitted");

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          duration: Duration(seconds: 1),
          backgroundColor: Color(0xFF45C08D),
          content: Text(
            "Details uploaded successfully",
          ),
        ),
      );
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => const NotVerifiedDealer(),
        ),
        (route) => false,
      );
    } else {
      debugPrint("+++++++++++++++++++++++");
      debugPrint("something went wrong");
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          duration: Duration(seconds: 2),
          backgroundColor: Color(0xFF45C08D),
          content: Text(
            "Something went wrong try again",
          ),
        ),
      );
    }
  }
}
