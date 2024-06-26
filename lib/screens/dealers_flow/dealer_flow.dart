import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flikcar/screens/dealers_flow/auction_screens/dealer_auction_home_screen/dealer_auction_home_screen.dart';
import 'package:flikcar/screens/dealers_flow/dealer_sell_car_screen/dealer_sell_car_screen.dart';
import 'package:flikcar/screens/dealers_flow/my_bids_screen/my_bids_screen.dart';
import 'package:flikcar/screens/dealers_flow/my_schedule_screen/my_schedule_screen.dart';
import 'package:flikcar/services/auction_services.dart';
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
    const DealerSellCarScreen(),
    const MyScheduleScreen(),
    const MyBidsScreen(),
    const DealerAccountScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Provider.of<AuctionService>(context, listen: false).disconnectSocket();
        return true;
      },
      child: Scaffold(
        bottomNavigationBar: SafeArea(
          child: CustomNavigationBar(
            iconSize: 22.0,
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
                imagePath: "assets/car_details_icon/my_schedule.png",
                title: "My Schedule",
                index: 2,
              ),
              navBarItems(
                imagePath: "assets/car_details_icon/Group.png",
                title: "My Bids",
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
        body: pages.elementAt(_currentIndex),
      ),
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
