import 'package:favorite_button/favorite_button.dart';
import 'package:flikcar/common_widgets/custom_appbar.dart';
import 'package:flikcar/common_widgets/primary_button.dart';
import 'package:flikcar/models/buyer_car_model.dart';
import 'package:flikcar/screens/wishlist_screen/widgets/wishlist_card.dart';
import 'package:flikcar/services/wishlist_service.dart';
import 'package:flikcar/utils/colors.dart';
import 'package:flikcar/utils/fonts.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WishlistScreen extends StatefulWidget {
  const WishlistScreen({super.key});

  @override
  State<WishlistScreen> createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  @override
  void initState() {
    // TODO: implement initState
    Provider.of<WishlistService>(context, listen: false)
        .getWishlistCars(context: context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<BuyerCar> wishlistCars = context.watch<WishlistService>().wishlistCars;
    print(wishlistCars);
    return Scaffold(
      appBar: CustomAppBar.getAppBar(),
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 51,
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(gradient: AppColors.gradient),
            child: Text(
              "Your Wishlist",
              style: AppFonts.w700black16,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          wishlistCars.isEmpty
              ? Padding(
                  padding: const EdgeInsets.only(top: 60.0),
                  child: Center(
                    child: Text(
                      "No cars to show",
                      style: AppFonts.w700black16,
                    ),
                  ),
                )
              : ListView.builder(
                  itemCount: wishlistCars.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return WishlistCard(
                      car: wishlistCars[index],
                    );
                  })
        ]),
      ),
    );
  }
}
