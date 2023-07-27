import 'package:flikcar/common_widgets/custom_appbar.dart';
import 'package:flikcar/models/auction_car_model.dart';
import 'package:flikcar/screens/dealers_flow/auction_screens/dealer_car_list_screen/widget/dealer_car_list_card.dart';
import 'package:flikcar/screens/dealers_flow/my_bids_screen/widgets/my_bids_screen_card.dart';
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
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<AuctionCar> cars = context.watch<AuctionService>().myBidCars;
    return Scaffold(
      appBar: CustomAppBar.getAppBar(),
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
          const SizedBox(
            height: 20,
          ),
          cars.isNotEmpty
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

          //   const DealerCarListCard()
        ]),
      ),
    );
  }
}
