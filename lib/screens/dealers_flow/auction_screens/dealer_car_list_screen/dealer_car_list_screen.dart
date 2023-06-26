import 'package:flikcar/common_widgets/custom_appbar.dart';
import 'package:flikcar/common_widgets/primary_button.dart';
import 'package:flikcar/screens/dealers_flow/dealer_car_list_screen/widget/dealer_car_list_card.dart';
import 'package:flikcar/screens/dealers_flow/dealer_car_list_screen/widget/upcoming_auction_dealer_card.dart';
import 'package:flikcar/screens/dealers_flow/provider/dealer_provider.dart';
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
  Widget build(BuildContext context) {
    bool live = context.watch<DealerProvider>().live;
    return Scaffold(
      appBar: CustomAppBar.getAppBarWithSearch(
          context: context,
          back: true,
          function: () {
            print("mmbro");
          }),
      body: SingleChildScrollView(
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    Provider.of<DealerProvider>(context, listen: false)
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
                    Provider.of<DealerProvider>(context, listen: false)
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
                Container(
                  width: 2,
                  height: 20,
                  color: const Color(0xffE0E0E0),
                ),
                GestureDetector(
                  onTap: () {},
                  child: menu(
                      image: "assets/car_details_icon/filter.png",
                      title: "Filters",
                      color: const Color(0xff161F31),
                      style: AppFonts.w700s116),
                ),
              ],
            ),
          ),
          live == true
              ? ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 10,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return const DealerCarListCard();
                  })
              : ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 10,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return const UpcomingAuctionDealerCard();
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
