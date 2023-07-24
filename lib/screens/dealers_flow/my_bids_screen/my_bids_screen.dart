import 'package:flikcar/common_widgets/custom_appbar.dart';
import 'package:flikcar/screens/dealers_flow/auction_screens/dealer_car_list_screen/widget/dealer_car_list_card.dart';
import 'package:flikcar/utils/fonts.dart';
import 'package:flutter/material.dart';

class MyBidsScreen extends StatelessWidget {
  const MyBidsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.getAppBar(),
      body: Column(children: [
        Container(
          height: 50,
          width: MediaQuery.of(context).size.width,
          color: const Color.fromARGB(255, 223, 255, 224),
          padding: const EdgeInsets.all(16),
          child: Text(
            "My Bids",
            style: AppFonts.w700black16,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        //   const DealerCarListCard()
      ]),
    );
  }
}
