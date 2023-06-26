import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flikcar/screens/dealers_flow/auction_screens/dealer_home_screen/dealer_home_screen.dart';
import 'package:flikcar/utils/colors.dart';
import 'package:flutter/material.dart';

import 'dealer_account_screen/dealer_account_screen.dart';

class DealerFlow extends StatefulWidget {
  const DealerFlow({super.key});

  @override
  State<DealerFlow> createState() => _DealerFlowState();
}

class _DealerFlowState extends State<DealerFlow> {
  int _currentIndex = 0;

  List<Widget> pages = [
    const DealerAuctionHomeScreen(),
    const DealerAccountScreen(),
    const DealerAccountScreen(),
    const DealerAccountScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomNavigationBar(
        iconSize: 24.0,
        selectedColor: const Color(0xff9A2870),
        strokeColor: const Color(0x30040307),
        unSelectedColor: Colors.white,
        backgroundColor: AppColors.s1,
        items: [
          navBarItems(
            imagePath: "assets/auction_icon.png",
            title: "Auction House",
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
