import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

import 'package:file_picker/file_picker.dart';

class PickFile {
  FilePickerResult? result;
  String? fileName;
  bool isLoading = false;
  File? fileToDisplay;
  PlatformFile? pickedFile;
  Future<FilePickerResult?> pickFile({required BuildContext context}) async {
    try {
      result = await FilePicker.platform.pickFiles(
        type: FileType.image,
        allowMultiple: false,
      );
      if (result != null) {
        fileName = result!.files.first.name;
        pickedFile = result!.files.first;

        fileToDisplay = File(pickedFile!.path.toString());
      }
    } catch (e) {}

    if (pickedFile != null) {
      final dir = await path_provider.getTemporaryDirectory();
      final targetPath = dir.absolute.path + '/temp.jpg';

      final result = await FlutterImageCompress.compressAndGetFile(
        fileToDisplay!.absolute.path,
        targetPath,
        quality: 75,
      );

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          duration: const Duration(seconds: 4),
          backgroundColor: const Color(0xFF0D332B),
          content: Text("Uploading"),
        ),
      );
    }
    if (pickedFile == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          duration: Duration(seconds: 4),
          backgroundColor: const Color(0xFF0D332B),
          content: Text(
            "No file selected",
          ),
        ),
      );
    }
    return result;
  }
}
