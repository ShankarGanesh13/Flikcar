import 'package:favorite_button/favorite_button.dart';
import 'package:flikcar/common_widgets/custom_appbar.dart';
import 'package:flikcar/common_widgets/loading_widget.dart';
import 'package:flikcar/common_widgets/primary_button.dart';
import 'package:flikcar/models/buyer_car_display.dart';
import 'package:flikcar/models/buyer_car_model.dart';
import 'package:flikcar/screens/buy_car_flow/buy_car_flow_home_screen/widgets/homescreen_card.dart';
import 'package:flikcar/screens/buy_car_flow/car_detailed_view/car_specifications/car_specifications.dart';
import 'package:flikcar/screens/buy_car_flow/car_detailed_view/widgets/buy_car_details.dart';
import 'package:flikcar/screens/buy_car_flow/car_detailed_view/widgets/car_detail_bottom_nav.dart';
import 'package:flikcar/screens/buy_car_flow/car_detailed_view/widgets/car_features.dart';
import 'package:flikcar/screens/buy_car_flow/car_detailed_view/widgets/image_viewer.dart';
import 'package:flikcar/screens/buy_car_flow/car_detailed_view/widgets/nav_button.dart';
import 'package:flikcar/screens/buy_car_flow/car_detailed_view/widgets/specifications.dart';
import 'package:flikcar/screens/buy_car_flow/filter_applied/filter_applied.dart';
import 'package:flikcar/screens/home_screen/home_screen.dart';
import 'package:flikcar/services/wishlist_service.dart';
import 'package:flikcar/utils/colors.dart';
import 'package:flikcar/utils/fonts.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../services/get_car_details.dart';

class CarDetailedView extends StatelessWidget {
  final Future<BuyerCar> car;
  const CarDetailedView({super.key, required this.car});

  @override
  Widget build(BuildContext context) {
    List<BuyerCarDisplay> similarCars =
        context.watch<GetCarDetails>().similarCars;
    return FutureBuilder<BuyerCar>(
        future: car,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Scaffold(
                appBar: CustomAppBar.getAppBarWithContainerSearch(
                  function2: () {
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
                  back: true,
                  context: context,
                  function: () {},
                ),
                bottomNavigationBar: SafeArea(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.only(bottom: 10, top: 5),
                    color: AppColors.s1,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          BuyNavButton(
                              icon: Icons.phone,
                              title: "Contact Dealer",
                              function: () {}),
                          const SizedBox(
                            width: 15,
                          ),
                          BuyNavButton(
                            icon: Icons.watch_later,
                            title: "Schedule Test Drive",
                            function: () {},
                          )
                        ]),
                  ),
                ),
                body: const LoadingWidget());
          }
          if (snapshot.data != null) {
            return Scaffold(
              appBar: CustomAppBar.getAppBarWithContainerSearch(
                back: true,
                function2: () {
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
                context: context,
                function: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const FilterApplied()));
                },
              ),
              bottomNavigationBar: CarDetailBottomNav(
                car: snapshot.data!,
              ),
              body: SingleChildScrollView(
                child: Column(children: [
                  Container(
                      padding: const EdgeInsets.all(12),
                      width: MediaQuery.of(context).size.width,
                      //color: const Color.fromARGB(255, 240, 255, 249),
                      decoration: BoxDecoration(gradient: AppColors.gradient),
                      child: Row(
                        children: [
                          const SizedBox(width: 10),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 1.3,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  snapshot.data!.brand,
                                  style: AppFonts.w500dark214,
                                ),
                                Text(
                                  "${snapshot.data!.model} ${snapshot.data!.variant}",
                                  style: AppFonts.w700black16,
                                  maxLines: 1,
                                ),
                              ],
                            ),
                          ),
                          const Spacer(),
                          FavoriteButton(
                            iconSize: 30,
                            isFavorite: snapshot.data!.isFavourite,
                            iconColor: const Color.fromARGB(255, 255, 0, 0),
                            iconDisabledColor:
                                const Color.fromARGB(255, 138, 138, 138),
                            valueChanged: (_) {
                              Provider.of<WishlistService>(context,
                                      listen: false)
                                  .addRemoveWishlist(
                                      carId: snapshot.data!.id,
                                      context: context);
                              // Provider.of<GetCarDetails>(context, listen: false)
                              //     .changeWishlistStatus(carId: car.id);
                            },
                          ),
                          // const Icon(Icons.flag),
                        ],
                      )),
                  ImageViewer(
                    car: snapshot.data!,
                  ),
                  const SizedBox(height: 12),
                  BuyCarDetails(
                    car: snapshot.data!,
                  ),
                  //  const CarAddress(),
                  CarFeatures(
                    car: snapshot.data!,
                  ),
                  CarSpecification(
                    car: snapshot.data!,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: PrimaryButton(
                        title: "View Specification",
                        function: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CarSpecificationScreen(
                                      car: snapshot.data!)));
                        },
                        borderColor: Colors.white,
                        backgroundColor: AppColors.p2,
                        textStyle: AppFonts.w500white14),
                  ),
                  const SizedBox(height: 20),
                  similarCars.isNotEmpty
                      ? HomeScreenCard(
                          title: "Similar Cars You Might Like",
                          filters: [],
                          filter: "",
                          cars: similarCars,
                          selectedindex: 1,
                          filterButton: false)
                      : const SizedBox(),
                  const SizedBox(height: 60),
                ]),
              ),
            );
          } else {
            return const LoadingWidget();
          }
        });
  }
}
