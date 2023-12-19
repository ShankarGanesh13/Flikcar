import 'package:flikcar/common_widgets/custom_appbar.dart';
import 'package:flikcar/common_widgets/loading_widget.dart';
import 'package:flikcar/firebase_models/firebase_auction.dart';
import 'package:flikcar/screens/dealers_flow/auction_screens/view_all_auction_cars/widget/auction_car_card.dart';
import 'package:flikcar/screens/dealers_flow/dealer_flow.dart';
import 'package:flikcar/services/firebase_auction_service/firebase_auction_service.dart';
import 'package:flikcar/utils/fonts.dart';
import 'package:flutter/material.dart';

class ViewAllAuctionScreen extends StatefulWidget {
  const ViewAllAuctionScreen({super.key});

  @override
  State<ViewAllAuctionScreen> createState() => _ViewAllAuctionScreenState();
}

class _ViewAllAuctionScreenState extends State<ViewAllAuctionScreen> {
  bool live = false;

  @override
  Widget build(BuildContext context) {
    // context.watch<AuctionService>().live;
    return Scaffold(
      appBar: CustomAppBar.getAppBar(function: () {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => const DealerFlow(
              index: 0,
            ),
          ),
          (route) => false,
        );
      }),

      //  CustomAppBar.getAppBarWithSearch(
      //   function2: () {
      //     Navigator.pushAndRemoveUntil(
      //       context,
      //       MaterialPageRoute(
      //         builder: (context) => const DealerFlow(
      //           index: 0,
      //         ),
      //       ),
      //       (route) => false,
      //     );
      //   },
      //   context: context,
      //   back: true,
      //   function: () {},
      //   onchange: (value) {
      //     // Provider.of<AuctionService>(context, listen: false)
      //     //     .searchAuctionCarList(query: value);
      //   },
      // ),
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    live = true;
                    setState(() {});
                  },
                  child: menu(
                      image: "assets/car_details_icon/live_icon.png",
                      title: "Live",
                      color: live == true
                          ? const Color(0xff45C08D)
                          : const Color(0xff161F31),
                      style:
                          live == true ? AppFonts.w700p216 : AppFonts.w700s116),
                ),
                Container(
                  width: 2,
                  height: 20,
                  color: const Color(0xffE0E0E0),
                ),
                GestureDetector(
                  onTap: () {
                    live = false;
                    setState(() {});
                  },
                  child: menu(
                      image: "assets/car_details_icon/upcoming.png",
                      title: "Upcoming",
                      color: live == false
                          ? const Color(0xff45C08D)
                          : const Color(0xff161F31),
                      style: live == false
                          ? AppFonts.w700p216
                          : AppFonts.w700s116),
                ),
                // Container(
                //   width: 2,
                //   height: 20,
                //   color: const Color(0xffE0E0E0),
                // ),
                // GestureDetector(
                //   onTap: () {
                //     showModalBottomSheet<void>(
                //         context: context,
                //         isScrollControlled: true,
                //         builder: (BuildContext context) {
                //           return MediaQuery(
                //               data: MediaQueryData.fromView(
                //                   WidgetsBinding.instance.window),
                //               child: const DealerFilterScreen());
                //         });
                //   },
                //   child: menu(
                //       image: "assets/car_details_icon/filter.png",
                //       title: "Filters",
                //       color: const Color(0xff161F31),
                //       style: AppFonts.w700s116),
                // ),
              ],
            ),
          ),
          // Row(
          //   children: [
          //     const SizedBox(
          //       width: 12,
          //     ),
          //     Text(
          //       live == true
          //           ? "${liveAuctionCars.length}"
          //           : "${upcomingAuctionCars.length}",
          //       style: AppFonts.w700black14,
          //     ),
          //     Text(
          //       " Flikcar Certified Cars Found",
          //       style: AppFonts.w500black14,
          //     ),
          //   ],
          // ),
          const SizedBox(
            height: 8,
          ),
          live == true
              ? StreamBuilder<List<FirebaseAuction?>>(
                  stream: FirebaseAuctionService().getLiveAuctionCarsStream(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Padding(
                        padding: EdgeInsets.only(top: 200.0),
                        child: Center(child: LoadingWidget()),
                      );
                    } else if (snapshot.data == null ||
                        snapshot.data!.isEmpty) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 200.0),
                        child: Center(
                          child: Text(
                            "No cars to show",
                            style: AppFonts.w700black16,
                          ),
                        ),
                      );
                    } else {
                      return ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: snapshot.data!.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return AuctionCarCard(
                              car: snapshot.data![index]!,
                            );
                          });
                    }
                  })
              : StreamBuilder<List<FirebaseAuction?>>(
                  stream:
                      FirebaseAuctionService().getUpcomingAuctionCarsStream(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Padding(
                        padding: EdgeInsets.only(top: 200.0),
                        child: Center(child: LoadingWidget()),
                      );
                    } else if (snapshot.data == null ||
                        snapshot.data!.isEmpty) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 200.0),
                        child: Center(
                          child: Text(
                            "No cars to show",
                            style: AppFonts.w700black16,
                          ),
                        ),
                      );
                    } else {
                      return ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: snapshot.data!.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return AuctionCarCard(
                              car: snapshot.data![index]!,
                            );
                          });
                    }
                  }),
        ]),
      ),
    );
  }

  Widget menu(
      {required String image,
      required String title,
      required Color color,
      required TextStyle style}) {
    return Row(
      children: [
        SizedBox(
            height: 15, width: 20, child: Image.asset(image, color: color)),
        const SizedBox(width: 8),
        Text(title, style: style),
      ],
    );
  }
}
