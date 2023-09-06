import 'package:flikcar/common_widgets/custom_appbar.dart';
import 'package:flikcar/common_widgets/primary_button.dart';
import 'package:flikcar/models/auction_car_model.dart';
import 'package:flikcar/screens/dealers_flow/auction_screens/dealer_car_list_screen/widget/dealer_car_list_card.dart';
import 'package:flikcar/screens/dealers_flow/dealer_flow.dart';
import 'package:flikcar/services/auction_services.dart';
import 'package:flikcar/utils/colors.dart';
import 'package:flikcar/utils/fonts.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DealerCarListScreen extends StatefulWidget {
  const DealerCarListScreen({super.key});

  @override
  State<DealerCarListScreen> createState() => _DealerCarListScreenState();
}

class _DealerCarListScreenState extends State<DealerCarListScreen> {
  @override
  void initState() {
    // TODO: implement initState
    Provider.of<AuctionService>(context, listen: false).setAuctionCarList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<AuctionCar> liveAuctionCars =
        context.watch<AuctionService>().searchLiveAuctionCars;
    List<AuctionCar> upcomingAuctionCars =
        context.watch<AuctionService>().searchUpcomingAuctionCars;

    bool live = context.watch<AuctionService>().live;
    return Scaffold(
      appBar: CustomAppBar.getAppBarWithSearch(
        function2: () {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => const DealerFlow(
                index: 0,
              ),
            ),
            (route) => false,
          );
        },
        context: context,
        back: true,
        function: () {},
        onchange: (value) {
          Provider.of<AuctionService>(context, listen: false)
              .searchAuctionCarList(query: value);
        },
      ),
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    Provider.of<AuctionService>(context, listen: false)
                        .changeSection(isLive: true);
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
                    Provider.of<AuctionService>(context, listen: false)
                        .changeSection(isLive: false);
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
          Row(
            children: [
              const SizedBox(
                width: 12,
              ),
              Text(
                live == true
                    ? "${liveAuctionCars.length}"
                    : "${upcomingAuctionCars.length}",
                style: AppFonts.w700black14,
              ),
              Text(
                " Flikcar Certified Cars Found",
                style: AppFonts.w500black14,
              ),
            ],
          ),
          const SizedBox(
            height: 12,
          ),
          live == true
              ? liveAuctionCars.isNotEmpty
                  ? ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: liveAuctionCars.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return DealerCarListCard(
                          car: liveAuctionCars[index],
                        );
                      })
                  : Padding(
                      padding: const EdgeInsets.only(top: 200.0),
                      child: Center(
                        child: Text(
                          "No cars to show",
                          style: AppFonts.w700black16,
                        ),
                      ),
                    )
              : upcomingAuctionCars.isNotEmpty
                  ? ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: upcomingAuctionCars.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return DealerCarListCard(
                          car: upcomingAuctionCars[index],
                        );
                      })
                  : Padding(
                      padding: const EdgeInsets.only(top: 200.0),
                      child: Center(
                        child: Text(
                          "No cars to show",
                          style: AppFonts.w700black16,
                        ),
                      ),
                    ),
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
