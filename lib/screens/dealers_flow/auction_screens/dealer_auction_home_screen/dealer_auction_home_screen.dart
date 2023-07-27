import 'package:favorite_button/favorite_button.dart';
import 'package:flikcar/common_widgets/custom_appbar.dart';
import 'package:flikcar/common_widgets/heading1.dart';
import 'package:flikcar/common_widgets/loading_widget.dart';
import 'package:flikcar/common_widgets/primary_button.dart';
import 'package:flikcar/models/auction_car_model.dart';
import 'package:flikcar/screens/dealers_flow/auction_screens/dealer_auction_home_screen/widgets/dealer_header.dart';
import 'package:flikcar/screens/dealers_flow/auction_screens/dealer_car_list_screen/dealer_car_list_screen.dart';
import 'package:flikcar/screens/dealers_flow/auction_screens/dealer_car_list_screen/widget/dealer_car_list_card.dart';
import 'package:flikcar/screens/sell_car_flow/sell_home_screen/widgets/frequent_question.dart';
import 'package:flikcar/services/auction_services.dart';
import 'package:flikcar/utils/colors.dart';
import 'package:flikcar/utils/fonts.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:socket_io_client/socket_io_client.dart' as io;

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
      backgroundColor: Colors.white,
      appBar: CustomAppBar.getAppBarWithContainerSearch(
          context: context,
          function: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const DealerCarListScreen()));
          },
          back: false),
      body: SingleChildScrollView(
        child: SizedBox(
          height: (800 + (auctionCars.length * 400)).toDouble(),
          child: Stack(
            children: [
              const DealerHeader(),
              Positioned(
                top: 220,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(16),
                          topRight: Radius.circular(16))),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 30.0, left: 15, right: 15, bottom: 30),
                        child: PrimaryButton(
                            title: "View All",
                            function: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const DealerCarListScreen()));
                              // Provider.of<AuctionService>(context,
                              //         listen: false)
                              //     .getAuctionCars();
                              // GetBrandModelVarient().getBrandModelVarient();
                            },
                            borderColor: Colors.transparent,
                            backgroundColor: AppColors.s1,
                            textStyle: AppFonts.w500white14),
                      ),
                      // const DealerCarCard(
                      //   filters: ["Sedan", "Hatchback", "MUV", "SUV"],
                      //   title: "Cars by body type",
                      //   filterButton: true,
                      // ),
                      // const DealerCarCard(
                      //   filters: [
                      //     "1-5 lakh",
                      //     "5-10 lakh",
                      //     "10-15 lakh",
                      //     "15-20 lakh",
                      //     "20-25 lakh"
                      //   ],
                      //   title: "Cars by budget",
                      //   filterButton: true,
                      // ),
                      // const DealerCarCard(
                      //   filters: [
                      //     "2012 & above",
                      //     "2014 & above",
                      //     "2016 & above",
                      //     "2018 & above",
                      //     "2020 & above"
                      //   ],
                      //   title: "Cars by year",
                      //   filterButton: true,
                      // ),
                      Column(
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(15.0),
                            child: Heading1(
                                title1: "Ongoing Auctions", title2: ""),
                          ),
                          auctionCars.isNotEmpty
                              ? ListView.builder(
                                  itemCount: auctionCars.length,
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    return DealerCarListCard(
                                        car: auctionCars[index]);
                                  })
                              : const SizedBox(
                                  height: 300,
                                  child: LoadingWidget(),
                                ),
                        ],
                      ),
                      FrequentQuestions(),
                      const SizedBox(
                        height: 50,
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
