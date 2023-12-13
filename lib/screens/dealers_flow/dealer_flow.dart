import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flikcar/screens/dealers_flow/auction_screens/dealer_auction_home_screen/dealer_auction_home_screen.dart';
import 'package:flikcar/screens/dealers_flow/dealer_sell_car_screen/dealer_sell_car_screen.dart';
import 'package:flikcar/screens/dealers_flow/my_bids_screen/my_bids_screen.dart';
import 'package:flikcar/screens/dealers_flow/my_schedule_screen/my_schedule_screen.dart';
import 'package:flikcar/screens/dealers_flow/one_click_buy_screen/one_click_buy_screen.dart';
import 'package:flikcar/services/firebase_auth_service/firebase_auth_service.dart';
import 'package:flikcar/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'dealer_account_screen/dealer_account_screen.dart';

class DealerFlow extends StatefulWidget {
  final int index;
  const DealerFlow({super.key, required this.index});

  @override
  State<DealerFlow> createState() => _DealerFlowState();
}

class _DealerFlowState extends State<DealerFlow> {
  @override
  void initState() {
    _currentIndex = widget.index;
    super.initState();
  }

  int _currentIndex = 0;

  List<Widget> pages = [
    const DealerAuctionHomeScreen(),
    const OneClickBuyScreen(),
    const MyBidsScreen(),
    const DealerSellCarScreen(),
    DealerAccountScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        color: AppColors.s1,
        child: SafeArea(
          child: CustomNavigationBar(
            iconSize: 22.0,
            selectedColor: const Color(0xff9A2870),
            strokeColor: const Color(0x30040307),
            unSelectedColor: Colors.white,
            backgroundColor: AppColors.s1,
            elevation: 0,
            items: [
              navBarItems(
                imagePath: "assets/auction_icon.png",
                title: "Auction House",
                index: 0,
              ),
              navBarItems(
                imagePath: "assets/car_details_icon/one_click_buy_ icon.png",
                title: "OCB",
                index: 1,
              ),
              navBarItems(
                imagePath: "assets/car_details_icon/Group.png",
                title: "My Bids",
                index: 2,
              ),
              navBarItems(
                imagePath: "assets/sell_car_icon.png",
                title: "Sell Car",
                index: 3,
              ),
              navBarItems(
                imagePath: "assets/account_icon.png",
                title: "Account",
                index: 4,
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
      ),
      body: pages.elementAt(_currentIndex),
    );
  }

  CustomNavigationBarItem navBarItems(
      {required String imagePath, required String title, required int index}) {
    return CustomNavigationBarItem(
      icon: SizedBox(
        height: 20,
        width: 20,
        child: Image.asset(
          imagePath,
          color: _currentIndex == index ? AppColors.p2 : Colors.white,
        ),
      ),
      title: Text(
        title,
        style: TextStyle(
          color: _currentIndex == index ? AppColors.p2 : Colors.white,
          fontSize: 10,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
