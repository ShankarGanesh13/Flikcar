import 'package:favorite_button/favorite_button.dart';
import 'package:flikcar/common_widgets/custom_appbar.dart';
import 'package:flikcar/common_widgets/heading1.dart';
import 'package:flikcar/common_widgets/loading_widget.dart';
import 'package:flikcar/common_widgets/primary_button.dart';
import 'package:flikcar/firebase_models/firebase_auction.dart';
import 'package:flikcar/models/auction_car_model.dart';
import 'package:flikcar/screens/dealers_flow/auction_screens/dealer_auction_home_screen/widgets/dealer_header.dart';
import 'package:flikcar/screens/dealers_flow/auction_screens/dealer_car_list_screen/view_all_auction_screen.dart';
import 'package:flikcar/screens/dealers_flow/auction_screens/dealer_car_list_screen/widget/auction_car_card.dart';
import 'package:flikcar/screens/dealers_flow/dealer_flow.dart';
import 'package:flikcar/screens/sell_car_flow/sell_home_screen/widgets/frequent_question.dart';
import 'package:flikcar/screens/start_screen/start_screen.dart';
import 'package:flikcar/services/firebase_auction_service/firebase_auction_service.dart';
import 'package:flikcar/services/firebase_auth_service/firebase_auth_service.dart';
import 'package:flikcar/utils/colors.dart';
import 'package:flikcar/utils/fonts.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DealerAuctionHomeScreen extends StatelessWidget {
  const DealerAuctionHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff171717),
      appBar: CustomAppBar.getAppBar(function: () {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => StartScreen(),
          ),
          (route) => false,
        );
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
                      const EdgeInsets.only(top: 20.0, left: 15, right: 15),
                  child: Column(children: [
                    PrimaryButton(
                      title: "View All Cars",
                      function: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const ViewAllAuctionScreen()));
                      },
                      backgroundColor: AppColors.s1,
                      borderColor: Colors.transparent,
                      textStyle: AppFonts.w500white14,
                    ),
                    const SizedBox(height: 10),
                  ]),
                ),
                Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 15.0, top: 25, bottom: 15),
                      child: Heading1(title1: "Auctions House", title2: ""),
                    ),
                    StreamBuilder<List<FirebaseAuction?>>(
                      stream: FirebaseAuctionService().getAuctionCarsStream(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const SizedBox(
                              height: 300,
                              child:
                                  Center(child: CircularProgressIndicator()));
                        } else if (snapshot.hasError) {
                          debugPrint("=================${snapshot.error}");
                          return SizedBox(
                              height: 300,
                              child: Center(
                                child: Text(
                                  "Error",
                                  style: AppFonts.w700black16,
                                ),
                              ));
                        } else if (snapshot.data == null) {
                          return SizedBox(
                              height: 300,
                              child: Center(
                                child: Text(
                                  "No cars found",
                                  style: AppFonts.w700black16,
                                ),
                              ));
                        } else if (snapshot.data!.isEmpty) {
                          return SizedBox(
                              height: 300,
                              child: Center(
                                child: Text(
                                  "No cars found",
                                  style: AppFonts.w700black16,
                                ),
                              ));
                        } else {
                          return ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: snapshot.data!.length,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                if (snapshot.data![index]!.oneClickBuyPrice ==
                                    null) {
                                  return AuctionCarCard(
                                    car: snapshot.data![index]!,
                                  );
                                } else {
                                  return const SizedBox();
                                }
                              });
                        }
                      },
                    )
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
}
