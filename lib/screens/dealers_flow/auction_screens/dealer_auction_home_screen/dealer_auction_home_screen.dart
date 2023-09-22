import 'package:favorite_button/favorite_button.dart';
import 'package:flikcar/common_widgets/custom_appbar.dart';
import 'package:flikcar/common_widgets/heading1.dart';
import 'package:flikcar/common_widgets/loading_widget.dart';
import 'package:flikcar/common_widgets/primary_button.dart';
import 'package:flikcar/models/auction_car_model.dart';
import 'package:flikcar/screens/dealers_flow/auction_screens/dealer_auction_home_screen/widgets/dealer_header.dart';
import 'package:flikcar/screens/dealers_flow/auction_screens/dealer_car_list_screen/dealer_car_list_screen.dart';
import 'package:flikcar/screens/dealers_flow/auction_screens/dealer_car_list_screen/widget/dealer_car_list_card.dart';
import 'package:flikcar/screens/dealers_flow/dealer_flow.dart';
import 'package:flikcar/screens/sell_car_flow/sell_home_screen/widgets/frequent_question.dart';
import 'package:flikcar/services/auction_services.dart';
import 'package:flikcar/utils/colors.dart';
import 'package:flikcar/utils/fonts.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DealerAuctionHomeScreen extends StatefulWidget {
  const DealerAuctionHomeScreen({super.key});

  @override
  State<DealerAuctionHomeScreen> createState() =>
      _DealerAuctionHomeScreenState();
}

class _DealerAuctionHomeScreenState extends State<DealerAuctionHomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    Provider.of<AuctionService>(context, listen: false).connectToSocket();
    Provider.of<AuctionService>(context, listen: false).getAuctionCars();
    // Provider.of<AuctionService>(context, listen: false).connectSocket();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<AuctionCar> auctionCars = context.watch<AuctionService>().auctionCars;

    return Scaffold(
      backgroundColor: const Color(0xff171717),
      appBar: CustomAppBar.getAppBarWithContainerSearch(
          function2: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const DealerFlow(index: 0)));
          },
          back: false,
          context: context,
          function: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const DealerCarListScreen()));
          }),
      body: SingleChildScrollView(
        child: Column(children: [
          const DealerHeader(),
          Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.only(bottom: 20),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
            ),
            child: Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.only(top: 15.0, left: 15, right: 15),
                  child: Column(children: [
                    PrimaryButton(
                      title: "View All Cars",
                      function: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const DealerCarListScreen()));
                      },
                      backgroundColor: AppColors.s1,
                      borderColor: Colors.transparent,
                      textStyle: AppFonts.w500white14,
                    ),
                    const SizedBox(height: 20),
                  ]),
                ),
                Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(15.0),
                      child: Heading1(title1: "Auctions House", title2: ""),
                    ),
                    auctionCars.isNotEmpty
                        ? ListView.builder(
                            itemCount: auctionCars.length,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return DealerCarListCard(car: auctionCars[index]);
                            })
                        : SizedBox(
                            height: 300,
                            child: Center(
                              child: Text(
                                "No cars found",
                                style: AppFonts.w500black14,
                              ),
                            ),
                          ),
                  ],
                ),
                FrequentQuestions(),
              ],
            ),
          ),
        ]),
      ),
    );
  }  

  Widget loading() {
    Future.delayed(Duration(seconds: 10), () {
      return Text("No cars found");
    });
    return SizedBox();
  }
}
