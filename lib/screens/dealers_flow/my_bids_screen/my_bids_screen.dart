import 'package:flikcar/common_widgets/custom_appbar.dart';
import 'package:flikcar/models/auction_car_model.dart';
import 'package:flikcar/screens/dealers_flow/auction_screens/dealer_car_list_screen/widget/dealer_car_list_card.dart';
import 'package:flikcar/screens/dealers_flow/dealer_flow.dart';
import 'package:flikcar/screens/dealers_flow/my_bids_screen/widgets/my_bids_screen_card.dart';
import 'package:flikcar/screens/dealers_flow/my_bids_screen/widgets/winning_card.dart';
import 'package:flikcar/services/auction_services.dart';
import 'package:flikcar/utils/colors.dart';
import 'package:flikcar/utils/fonts.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyBidsScreen extends StatefulWidget {
  const MyBidsScreen({super.key});

  @override
  State<MyBidsScreen> createState() => _MyBidsScreenState();
}

class _MyBidsScreenState extends State<MyBidsScreen> {
  @override
  void initState() {
    // TODO: implement initState
    Provider.of<AuctionService>(context, listen: false).getMyBid();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<AuctionService>(context, listen: false).filterMyBids();
    });

    super.initState();
  }

  bool live = true;

  @override
  Widget build(BuildContext context) {
    List<AuctionCar> cars = context.watch<AuctionService>().liveMyBidsCars;
    List<AuctionCar> yourWinnings =
        context.watch<AuctionService>().yourWinnings;
    return Scaffold(
      appBar: CustomAppBar.getAppBar(
        function: () {
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
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
            height: 50,
            width: MediaQuery.of(context).size.width,
            //color: const Color.fromARGB(255, 223, 255, 224),
            decoration: BoxDecoration(gradient: AppColors.gradient),
            padding: const EdgeInsets.all(16),
            child: Text(
              "My Bids",
              style: AppFonts.w700black16,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    if (live == false) {
                      live = true;
                      setState(() {});
                    }
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
                    if (live == true) {
                      live = false;
                      setState(() {});
                    }
                  },
                  child: menu(
                      image: "assets/auction_icon.png",
                      title: "Winnings",
                      color: live == false
                          ? const Color(0xff45C08D)
                          : const Color(0xff161F31),
                      style: live == false
                          ? AppFonts.w700p216
                          : AppFonts.w700s116),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          live == true
              ? cars.isNotEmpty
                  ? ListView.builder(
                      shrinkWrap: true,
                      itemCount: cars.length,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return MyBidsScreenCard(car: cars[index]);
                      })
                  : Column(
                      children: [
                        const SizedBox(
                          height: 30,
                        ),
                        Text(
                          "No cars to show",
                          style: AppFonts.w700black16,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Here you can find all the cars where you have placed bids",
                          style: AppFonts.w500dark212,
                        )
                      ],
                    )
              : yourWinnings.isNotEmpty
                  ? ListView.builder(
                      shrinkWrap: true,
                      itemCount: yourWinnings.length,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return WinningCard(car: yourWinnings[index]);
                      })
                  : Column(
                      children: [
                        const SizedBox(
                          height: 30,
                        ),
                        Text(
                          "No cars to show",
                          style: AppFonts.w700black16,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Here you can find all the cars where you have placed bids",
                          style: AppFonts.w500dark212,
                        )
                      ],
                    )

          //   const DealerCarListCard()
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
