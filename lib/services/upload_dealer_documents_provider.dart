import 'dart:convert';
import 'dart:io';
import 'package:flikcar/screens/dealers_flow/dealer_flow.dart';
import 'package:flikcar/screens/dealers_flow/not_verified_dealer/not_verified_delaer.dart';
import 'package:flutter/material.dart';

import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:http/http.dart' as http;

import 'package:file_picker/file_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UploadDealerDocumentsProvider extends ChangeNotifier {
  FilePickerResult? result;

  String? fileName;
  bool isLoading = false;
  File? fileToDisplay;
  PlatformFile? pickedFile;
  //String panImagePath = "";
  String addressFrontImagePath = "";
  String addressBAckImagePath = "";
  String dealershipImagePath = "";
  String dealerSelfiePath = "";
  String dealerName = "";
  String dealerEmail = "";
  String dealerShopName = "";
  String dealerGstNumber = "";
  String dealerShopAddress = "";

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
      case "dealerSelfie":
        {
          dealerSelfiePath = pickedFilePath;
          notifyListeners();
        }
        break;
      default:
        {
          print("invalid choice");
        }
        break;
    }
  }

  validateForm(context) {
    if (addressFrontImagePath == '' ||
        addressBAckImagePath == "" ||
        dealershipImagePath == '' ||
        dealerSelfiePath == "") {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          duration: Duration(seconds: 2),
          backgroundColor: Color(0xFF45C08D),
          content: Text(
            "Please upload all the required documents",
          ),
        ),
      );
    } else {
      uploadDealerDocuments(context);
    }
  }

  getBasicDetails(
      {required String name,
      required String email,
      required String gstNumber,
      required String address,
      required String shopName}) {
    dealerName = name;
    dealerEmail = email;
    dealerGstNumber = gstNumber;
    dealerShopAddress = address;
    dealerShopName = shopName;
  }

  uploadDealerDocuments(context) async {
    print("uploadDealerDocuments");

    final SharedPreferences sp = await SharedPreferences.getInstance();
    Uri url = Uri.parse(
        'https://webservice.flikcar.com:8000/api/dealer/auth/update-profile');
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
    request.fields["pincode"] = "123456";
    request.fields["addressProofType"] = "aadhar";

    // var panCardImageFile = File(pickedFile!.path!);

    // var addressProofFrontImageFile = File(pickedFile!.path!);
    // var addressProofBackImageFile = File(pickedFile!.path!);
    // var imageFile = File(pickedFile!.path!);

    // request.files.add(await http.MultipartFile.fromPath(
    //   "panCardImage",
    //   panImagePath,
    // ));

    request.files.add(await http.MultipartFile.fromPath(
      "addressProofFrontImage",
      addressFrontImagePath,
    ));
    request.files.add(await http.MultipartFile.fromPath(
      "addressProofBackImage",
      addressBAckImagePath,
    ));
    request.files.add(await http.MultipartFile.fromPath(
      "image",
      dealerSelfiePath,
    ));
    var response = await request.send();

    var responseData = await response.stream.toBytes();

    var responseString = utf8.decode(responseData);

    var data = json.decode(responseString);

    print(data["status"]);
    if (data["status"] == 200 || data["status"] == 302) {
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
