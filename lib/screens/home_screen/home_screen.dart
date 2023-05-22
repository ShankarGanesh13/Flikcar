import 'dart:async';

import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flikcar/screens/buy_car_flow/buy_car_home_screen.dart';
import 'package:flikcar/screens/sell_car_flow/sell_home_screen/sell_car_home_screen.dart';
import 'package:flikcar/utils/fonts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late ConnectivityResult result;
  late StreamSubscription subscription;
  bool isConnected = false;

  checkInternet() async {
    result = await Connectivity().checkConnectivity();
    if (result != ConnectivityResult.none) {
      setState(() {
        isConnected = true;
      });
    } else {
      setState(() {
        isConnected = false;
      });
      showDialogBox();
      print("No internet");
    }
  }

  startStreaming() {
    subscription = Connectivity().onConnectivityChanged.listen((event) async {
      checkInternet();
    });
  }

  showDialogBox() {
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
                      checkInternet();
                    })
              ],
            ));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startStreaming();
  }

  int _currentIndex = 0;
  List<Widget> pages = [
    const BuyCarHomeScreen(),
    const SellCarHomeScreen(),
    const BuyCarHomeScreen(),
    const BuyCarHomeScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomNavigationBar(
        iconSize: 24.0,
        selectedColor: const Color(0xff9A2870),
        strokeColor: const Color(0x30040307),
        unSelectedColor: Colors.white,
        backgroundColor: const Color(0xff100049),
        items: [
          navBarItems(
            imagePath: "assets/buy_car_icon.png",
            title: "Buy Car",
            index: 0,
          ),
          navBarItems(
            imagePath: "assets/sell_car_icon.png",
            title: "Sell Car",
            index: 1,
          ),
          navBarItems(
            imagePath: "assets/wishlist_icon.png",
            title: "Wishlist",
            index: 2,
          ),
          navBarItems(
            imagePath: "assets/account_icon.png",
            title: "Account",
            index: 3,
          )
        ],
        currentIndex: _currentIndex!,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      body: pages.elementAt(_currentIndex!),
    );
  }

  CustomNavigationBarItem navBarItems(
      {required String imagePath, required String title, required int index}) {
    return CustomNavigationBarItem(
      icon: Image.asset(
        imagePath,
        color: _currentIndex == index ? const Color(0xff9A2870) : Colors.white,
      ),
      title: Text(
        title,
        style: TextStyle(
          color:
              _currentIndex == index ? const Color(0xff9A2870) : Colors.white,
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
