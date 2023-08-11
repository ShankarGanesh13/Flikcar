import 'dart:async';

import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flikcar/screens/account/account_screen.dart';
import 'package:flikcar/screens/buy_car_flow/buy_car_flow_home_screen/buy_car_home_screen.dart';
import 'package:flikcar/screens/home_screen/provider/check_internet_provider.dart';
import 'package:flikcar/screens/sell_car_flow/sell_home_screen/sell_car_home_screen.dart';
import 'package:flikcar/screens/wishlist_screen/wishlist_screen.dart';
import 'package:flikcar/services/get_car_details.dart';
import 'package:flikcar/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  final int index;
  const HomeScreen({super.key, required this.index});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // Provider.of<GetCarDetails>(context, listen: false).getWishlistCars();

    Provider.of<GetCarDetails>(context, listen: false).getAllCars();
    print("init state called");
    // TODO: implement initState
    super.initState();
  }

  int _currentIndex = 0;

  List<Widget> pages = [
    const BuyCarHomeScreen(),
    const SellCarHomeScreen(),
    const WishlistScreen(),
    const AccountScreen(),
  ];
  // @override
  // void initState() {
  //   Provider.of<CheckInternetProvider>(context, listen: false)
  //       .startStreaming(context);
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SafeArea(
        child: CustomNavigationBar(
          iconSize: 24.0,
          selectedColor: const Color(0xff9A2870),
          strokeColor: const Color(0x30040307),
          unSelectedColor: Colors.white,
          backgroundColor: AppColors.s1,
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
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
        ),
      ),
      body: pages.elementAt(_currentIndex),
    );
  }

  CustomNavigationBarItem navBarItems(
      {required String imagePath, required String title, required int index}) {
    return CustomNavigationBarItem(
      icon: Image.asset(
        imagePath,
        color: _currentIndex == index ? AppColors.p2 : Colors.white,
      ),
      title: Text(
        title,
        style: TextStyle(
          color: _currentIndex == index ? AppColors.p2 : Colors.white,
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
