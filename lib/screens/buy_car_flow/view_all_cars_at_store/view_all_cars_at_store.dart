import 'package:flikcar/common_widgets/custom_appbar.dart';
import 'package:flikcar/common_widgets/error_screen.dart';
import 'package:flikcar/common_widgets/loading_screen.dart';
import 'package:flikcar/common_widgets/loading_widget.dart';
import 'package:flikcar/firebase_models/firebase_buyer_car.dart';
import 'package:flikcar/firebase_models/firebase_delaer_listed_car.dart';
import 'package:flikcar/screens/buy_car_flow/car_detailed_view/car_detailed_view.dart';
import 'package:flikcar/screens/buy_car_flow/view_all_cars_at_store/widgets/store_cars_card.dart';
import 'package:flikcar/screens/home_screen/home_screen.dart';
import 'package:flikcar/services/get_car_details.dart';
import 'package:flikcar/utils/colors.dart';
import 'package:flikcar/utils/fonts.dart';
import 'package:flutter/material.dart';

class ViewAllCarsAtStore extends StatelessWidget {
  final String dealerId;
  const ViewAllCarsAtStore({super.key, required this.dealerId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.getAppBar(function: () {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => const HomeScreen(
              index: 0,
            ),
          ),
          (route) => false,
        );
      }),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 51,
              padding: const EdgeInsets.only(top: 0, left: 5),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(gradient: AppColors.gradient),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.chevron_left,
                    ),
                    color: AppColors.p2,
                  ),
                  Text(
                    "All Cars In The Store",
                    style: AppFonts.w700black16,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            FutureBuilder<List<FirebaseDealerListedCar>>(
              future: GetCarDetails().getCarsInStore(dealerId: dealerId),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const LoadingWidget();
                }
                if (snapshot.data != null) {
                  return ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => FutureBuilder<
                                            FirebaseBuyerCar?>(
                                        future: GetCarDetails().getCarById(
                                            carId: snapshot.data![index].id),
                                        builder: (context, snapshot) {
                                          if (snapshot.connectionState ==
                                              ConnectionState.waiting) {
                                            return const LoadingScreen();
                                          } else if (snapshot.data == null) {
                                            return const ErrorScreen();
                                          } else {
                                            return CarDetailedView(
                                                car: snapshot.data!);
                                          }
                                        })));
                          },
                          child: StoreCarsCard(car: snapshot.data![index]),
                        );
                      });
                } else {
                  return Text(
                    "No cars found",
                    style: AppFonts.w600black14,
                  );
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
