import 'package:flikcar/common_widgets/custom_appbar.dart';
import 'package:flikcar/common_widgets/heading1.dart';
import 'package:flikcar/firebase_models/firebase_auction.dart';
import 'package:flikcar/screens/dealers_flow/one_click_buy_screen/widgets/ocb_card.dart';
import 'package:flikcar/screens/dealers_flow/one_click_buy_screen/widgets/ocb_header.dart';
import 'package:flikcar/services/firebase_auction_service/firebase_auction_service.dart';
import 'package:flikcar/utils/fonts.dart';
import 'package:flutter/material.dart';

class OneClickBuyScreen extends StatelessWidget {
  const OneClickBuyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.getAppBar(function: () {}),
      body: SingleChildScrollView(
        child: Column(children: [
          const OcbHeader(),
          Container(
            color: const Color.fromARGB(255, 83, 83, 83),
            child: Container(
              padding: const EdgeInsets.only(
                  left: 15, right: 15, top: 30, bottom: 30),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  )),
              child: Column(children: [
                const Heading1(title1: "One Click Buy", title2: ""),
                const SizedBox(
                  height: 20,
                ),
                StreamBuilder<List<FirebaseAuction?>>(
                  stream: FirebaseAuctionService().getOcbCarsStream(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const SizedBox(
                          height: 300,
                          child: Center(child: CircularProgressIndicator()));
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
                      List<FirebaseAuction> ocbCars = [];
                      for (int i = 0; i < snapshot.data!.length; i++) {
                        FirebaseAuction? e = snapshot.data![i];
                        if (e != null &&
                            e.oneClickBuyPrice != null &&
                            !e.isSoldOut) {
                          ocbCars.add(e);
                        }
                      }
                      if (ocbCars.isNotEmpty) {
                        return ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: ocbCars.length,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return OcbCard(
                                car: ocbCars[index],
                              );
                            });
                      } else {
                        return SizedBox(
                            height: 300,
                            child: Center(
                              child: Text(
                                "No cars found",
                                style: AppFonts.w700black16,
                              ),
                            ));
                      }
                    }
                  },
                )
              ]),
            ),
          )
        ]),
      ),
    );
  }
}
