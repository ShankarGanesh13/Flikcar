import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CheckInternetProvider extends ChangeNotifier {
  late ConnectivityResult result;
  late StreamSubscription subscription;
  bool isConnected = false;

  checkInternet(context) async {
    result = await Connectivity().checkConnectivity();
    if (result != ConnectivityResult.none) {
      isConnected = true;
      print("internet connected");
      notifyListeners();
    } else {
      isConnected = false;
      notifyListeners();
      print("no internet");
      showDialogBox(context);
    }
    print("check internet called");
  }

  showDialogBox(context) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) => CupertinoAlertDialog(
              title: const Text("No Internet"),
              content: const Text("Please check your internet connection"),
              actions: [
                CupertinoButton.filled(
                    child: const Text("Retry"),
                    onPressed: () {
                      Navigator.pop(context);
                      checkInternet(context);
                    })
              ],
            ));
  }

  startStreaming(context) async {
    subscription = Connectivity().onConnectivityChanged.listen((event) async {
      await checkInternet(context);
    });
    await checkInternet(context);
    print("start streaming called");
  }
}
