import 'package:favorite_button/favorite_button.dart';
import 'package:flikcar/common_widgets/custom_appbar.dart';
import 'package:flikcar/common_widgets/loading_widget.dart';
import 'package:flikcar/common_widgets/primary_button.dart';
import 'package:flikcar/screens/home_screen/home_screen.dart';
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
    loading();
    super.initState();
  }

  bool _isLoading = true;

  loading() {
    Future.delayed(const Duration(seconds: 5), () {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    List wishlistCars = context.watch<WishlistService>().wishlistCars;
    return Scaffold(
      appBar: CustomAppBar.getAppBar(
        function: () {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => const HomeScreen(
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
                  child: SizedBox(
                      height: 100,
                      child: Center(
                        child: _isLoading
                            ? const LoadingWidget()
                            : Text(
                                "No cars found",
                                style: AppFonts.w700black16,
                              ),
                      )),
                )
              : ListView.builder(
                  itemCount: wishlistCars.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Container();
                  })
        ]),
      ),
    );
  }
}
