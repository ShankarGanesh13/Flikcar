import 'package:favorite_button/favorite_button.dart';
import 'package:flikcar/common_widgets/custom_appbar.dart';
import 'package:flikcar/common_widgets/primary_button.dart';
import 'package:flikcar/common_widgets/snackbar.dart';
import 'package:flikcar/models/buyer_car_model.dart';
import 'package:flikcar/screens/buy_car_flow/buy_car_flow_home_screen/widgets/homescreen_card.dart';
import 'package:flikcar/screens/buy_car_flow/car_detailed_view/car_specifications/car_specifications.dart';
import 'package:flikcar/screens/buy_car_flow/car_detailed_view/widgets/buy_car_details.dart';
import 'package:flikcar/screens/buy_car_flow/car_detailed_view/widgets/car_features.dart';
import 'package:flikcar/screens/buy_car_flow/car_detailed_view/widgets/image_viewer.dart';
import 'package:flikcar/screens/buy_car_flow/car_detailed_view/widgets/nav_button.dart';
import 'package:flikcar/screens/buy_car_flow/car_detailed_view/widgets/specifications.dart';
import 'package:flikcar/screens/buy_car_flow/filter_applied/filter_applied.dart';
import 'package:flikcar/screens/buy_car_flow/schedule_test_drive/schedule_test_drive.dart';
import 'package:flikcar/services/facebook_events.dart';
import 'package:flikcar/services/firebase_events.dart';
import 'package:flikcar/services/wishlist_service.dart';
import 'package:flikcar/utils/colors.dart';
import 'package:flikcar/utils/fonts.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../services/get_car_details.dart';

class CarDetailedView extends StatelessWidget {
  final BuyerCar car;
  const CarDetailedView({super.key, required this.car});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.getAppBarWithContainerSearch(
        back: true,
        context: context,
        function: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const FilterApplied()));
        },
      ),
      bottomNavigationBar: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.only(bottom: 10, top: 5),
          color: AppColors.s1,
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            BuyNavButton(
              icon: Icons.phone,
              title: "Contact Dealer",
              function: () async {
                FirebaseEvents().customerCallDealer(
                    customerPhone: "customer",
                    dealerPhone: car.dealerPhoneNumber!);
                FacebookEvents().customerCallDealer(
                    customerPhone: "customer",
                    dealerPhone: car.dealerPhoneNumber!);

                Uri phoneno = Uri(
                  scheme: 'tel',
                  path: '+91${car.dealerPhoneNumber}',
                );
                if (await launchUrl(phoneno)) {
                } else {
                  if (context.mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        MySnackbar.showSnackBar(
                            context, "Unable to open dailer"));
                  }
                }
              },
            ),
            const SizedBox(
              width: 15,
            ),
            BuyNavButton(
              icon: Icons.watch_later,
              title: "Schedule Test Drive",
              function: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ScheduleTestDrive(
                        car: car,
                      ),
                    ));
              },
            )
          ]),
        ),
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
                  // GestureDetector(
                  //   onTap: () {
                  //     Navigator.pop(context);
                  //   },
                  //   child: Icon(
                  //     Icons.chevron_left,
                  //     color: AppColors.p2,
                  //     size: 28,
                  //   ),
                  // ),
                  const SizedBox(width: 10),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 1.3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          car.brand,
                          style: AppFonts.w500dark214,
                        ),
                        Text(
                          "${car.model} ${car.variant}",
                          style: AppFonts.w700black16,
                          maxLines: 1,
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  FavoriteButton(
                    iconSize: 30,
                    iconColor: const Color.fromARGB(255, 255, 0, 0),
                    iconDisabledColor: const Color.fromARGB(255, 138, 138, 138),
                    valueChanged: (_) {
                      Provider.of<WishlistService>(context, listen: false)
                          .addToWishlist(carId: car.id, context: context);
                    },
                  ),
                  // const Icon(Icons.flag),
                ],
              )),
          ImageViewer(
            car: car,
          ),
          const SizedBox(height: 12),
          BuyCarDetails(
            car: car,
          ),
          //  const CarAddress(),
          CarFeatures(
            car: car,
          ),
          CarSpecification(
            car: car,
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: PrimaryButton(
                title: "View Specification",
                function: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              CarSpecificationScreen(car: car)));
                },
                borderColor: Colors.white,
                backgroundColor: AppColors.p2,
                textStyle: AppFonts.w500white14),
          ),
          const SizedBox(height: 20),
          // HomeScreenCard(
          //     title: "Similar Cars You Might Like",
          //     filters: [],
          //     cars: GetCarDetails.getAllCarDetails(),
          //     filterButton: false),
          // const SizedBox(height: 100),
        ]),
      ),
    );
  }
}
