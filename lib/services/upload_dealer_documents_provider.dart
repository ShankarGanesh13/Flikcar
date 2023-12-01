import 'dart:convert';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flikcar/common_widgets/snackbar.dart';
import 'package:flikcar/screens/dealers_flow/dealer_flow.dart';
import 'package:flikcar/screens/dealers_flow/not_verified_dealer/not_verified_delaer.dart';
import 'package:flikcar/screens/onbording_screens/dealer_onboarding/terms_and_condition.dart';
import 'package:flikcar/utils/env.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
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
      uploadImageAndSetPath(
          imageType: imageType, pickedFilePath: pickedFile!.path!);
      //selectImage(imageType: imageType, pickedFilePath: pickedFile!.path!);
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

  Future<void> uploadImageAndSetPath(
      {required String imageType, required String pickedFilePath}) async {
    try {
      // Upload image to Firebase Storage
      String downloadUrl = await uploadImage(File(pickedFilePath));

      // Set the download URL based on the imageType
      switch (imageType) {
        case "addressFront":
          addressFrontImagePath = downloadUrl;
          break;
        case "addressBack":
          addressBAckImagePath = downloadUrl;
          break;
        case "dealershipImage":
          dealershipImagePath = downloadUrl;
          break;
        case "pan":
          panImagePath = downloadUrl;
          break;
        case "udyogAadhar":
          udyogAadharPath = downloadUrl;
          break;
        case "tradeLicence":
          tradeLicencePath = downloadUrl;
          break;
        case "cancelledCheque":
          cancelChequePath = downloadUrl;
          break;
        default:
          print("Invalid choice");
      }

      // Notify listeners if needed
      notifyListeners();
    } catch (e) {
      print('Error uploading image: $e');
    }
  }

  Future<String> uploadImage(File imageFile) async {
    try {
      String fileName = DateTime.now().millisecondsSinceEpoch.toString();
      Reference storageReference =
          FirebaseStorage.instance.ref().child('$fileName');
      SettableMetadata metadata = SettableMetadata(contentType: 'image/jpeg');

      UploadTask uploadTask = storageReference.putFile(
        imageFile,
        metadata,
      );

      TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() => null);

      String downloadUrl = await taskSnapshot.ref.getDownloadURL();
      return downloadUrl;
    } catch (e) {
      print('Error uploading image: $e');
      return '';
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

  uploadDealerDocumentsFirebase(context) async {
    try {
      final SharedPreferences sp = await SharedPreferences.getInstance();
      FirebaseFirestore firestore = FirebaseFirestore.instance;
      CollectionReference usersCollection = firestore.collection('users');
      FirebaseAuth auth = FirebaseAuth.instance;
      DocumentReference userDocRef = usersCollection.doc(auth.currentUser!.uid);

      Map<String, dynamic> formData = {
        "addressProofNumber": addressProofNumber,
        "cancelledChequeNumber": cancelChequeNumber,
        "email": dealerEmail,
        "name": dealerName,
        "panCardNumber": panCardNumber,
        "pincode": pincode,
        "selectedCity": "Kolkata",
        "selectedState": "West Bengal",
        "shopAddress": dealerShopAddress,
        "shopName": dealerShopName,
        "tradeLicenseNumber": tradeLicenceNumber,
        "docImagePath": [
          {
            "type": "pan",
            "url": panImagePath,
          },
          {
            "type": "addressProofFront",
            "url": addressFrontImagePath,
          },
          {
            "type": "addressProofBack",
            "url": addressBAckImagePath,
          },
          {
            "type": "tradeLicense",
            "url": tradeLicencePath,
          },
          {
            "type": "cancelledCheque",
            "url": cancelChequePath,
          },
          {
            "type": "shop",
            "url": dealershipImagePath,
          },
        ]
      };
      DocumentSnapshot userDoc = await userDocRef.get();
      if (userDoc.exists) {
        // Document exists, update the phone number
        await userDocRef.update({
          'dealerOnboardFormData': formData,
          'userTypeStatus': "DEALER_FORMS_SUBMITTED"
        });
        await sp.setString('userType', "DEALER_FORMS_SUBMITTED");
        ScaffoldMessenger.of(context).showSnackBar(MySnackbar.showSnackBar(
            context, "Documents submitted successfully"));
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => NotVerifiedDealer()),
            (route) => false);
        print('User data updated successfully');
      } else {
        print('User not found');
      }
    } catch (e) {
      print('Error updating data in Firestore: $e');
    }
  }
}
