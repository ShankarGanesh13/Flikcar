import 'package:flikcar/common_widgets/custom_appbar.dart';
import 'package:flikcar/common_widgets/loading_screen.dart';
import 'package:flikcar/common_widgets/primary_button.dart';
import 'package:flikcar/firebase_models/firebase_buyer_car.dart';
import 'package:flikcar/screens/buy_car_flow/car_detailed_view/widgets/buy_car_details.dart';
import 'package:flikcar/screens/buy_car_flow/car_detailed_view/widgets/car_detail_bottom_nav.dart';
import 'package:flikcar/screens/buy_car_flow/car_detailed_view/widgets/car_features.dart';
import 'package:flikcar/screens/buy_car_flow/car_detailed_view/widgets/image_viewer.dart';
import 'package:flikcar/screens/buy_car_flow/car_detailed_view/widgets/specifications.dart';
import 'package:flikcar/screens/buy_car_flow/filter_applied/view_all_buyer_cars_screen.dart';
import 'package:flikcar/screens/buy_car_flow/view_all_cars_at_store/view_all_cars_at_store.dart';
import 'package:flikcar/screens/home_screen/home_screen.dart';
import 'package:flikcar/utils/colors.dart';
import 'package:flikcar/utils/fonts.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CarDetailedView extends StatelessWidget {
  final FirebaseBuyerCar? car;
  const CarDetailedView({super.key, required this.car});

  @override
  Widget build(BuildContext context) {
    return car == null
        ? const LoadingScreen()
        : Scaffold(
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
                      builder: (context) => const ViewAllBuyerCarsScreen(),
                    ));
              },
            ),
            bottomNavigationBar: CarDetailBottomNav(
              car: car!,
            ),
            body: SingleChildScrollView(
              child: Column(children: [
                Container(
                    padding: const EdgeInsets.all(12),
                    width: MediaQuery.of(context).size.width,
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
                                car!.properties.brand,
                                style: AppFonts.w500dark214,
                              ),
                              Text(
                                "${car!.properties.model} ${car!.properties.variant}",
                                style: AppFonts.w700black16,
                                maxLines: 1,
                              ),
                            ],
                          ),
                        ),
                        const Spacer(),
                        // FavoriteButton(
                        //   iconSize: 30,
                        //   isFavorite: car.properties.isFavourite,
                        //   iconColor: const Color.fromARGB(255, 255, 0, 0),
                        //   iconDisabledColor: const Color.fromARGB(255, 138, 138, 138),
                        //   valueChanged: (_) {
                        //     Provider.of<WishlistService>(context, listen: false)
                        //         .addRemoveWishlist(
                        //             carId: snapshot.data!.id, context: context);
                        //     // Provider.of<GetCarDetails>(context, listen: false)
                        //     //     .changeWishlistStatus(carId: car.id);
                        //   },
                        // ),
                        // const Icon(Icons.flag),
                      ],
                    )),
                ImageViewer(
                  car: car!,
                ),
                const SizedBox(height: 12),
                BuyCarDetails(
                  car: car!,
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: PrimaryButton(
                      title: "View All Cars at This Store",
                      function: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ViewAllCarsAtStore(
                                      dealerId: car!.dealer.id,
                                    )));
                      },
                      borderColor: Colors.white,
                      backgroundColor: AppColors.p2,
                      textStyle: AppFonts.w500white14),
                ),
                //  const CarAddress(),
                CarFeatures(
                  car: car!,
                ),
                CarSpecification(
                  car: car!,
                ),

                const SizedBox(height: 80),
                // similarCars.isNotEmpty
                //     ? HomeScreenCard(
                //         title: "Similar Cars You Might Like",
                //         filters: [],
                //         filter: "",
                //         cars: similarCars,
                //         selectedindex: 1,
                //         filterButton: false)
                //     : const SizedBox(),
                // const SizedBox(height: 60),
              ]),
            ),
          );
  }
}
