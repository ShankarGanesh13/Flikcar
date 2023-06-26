import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

import 'package:file_picker/file_picker.dart';

class UploadDealerDocumentsProvider extends ChangeNotifier {
  FilePickerResult? result;

  String? fileName;
  bool isLoading = false;
  File? fileToDisplay;
  PlatformFile? pickedFile;
  String panImagePath = "";
  String addressFrontImagePath = "";
  String addressBAckImagePath = "";
  String dealershipImagePath = "";
  String dealerSelfiePath = "";

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
      case "pan":
        {
          panImagePath = pickedFilePath;
          notifyListeners();
        }
        break;
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
}
