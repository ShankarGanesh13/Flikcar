import 'package:flikcar/common_widgets/custom_appbar.dart';
import 'package:flikcar/common_widgets/primary_button.dart';
import 'package:flikcar/models/buyer_car_model.dart';
import 'package:flikcar/screens/buy_car_flow/car_detailed_view/car_specifications/car_specifications.dart';
import 'package:flikcar/screens/buy_car_flow/car_detailed_view/widgets/buy_car_details.dart';
import 'package:flikcar/screens/buy_car_flow/car_detailed_view/widgets/car_features.dart';
import 'package:flikcar/screens/buy_car_flow/car_detailed_view/widgets/image_viewer.dart';
import 'package:flikcar/screens/buy_car_flow/car_detailed_view/widgets/nav_button.dart';
import 'package:flikcar/screens/buy_car_flow/car_detailed_view/widgets/specifications.dart';
import 'package:flikcar/screens/dealers_flow/auction_screens/dealer_car_detail_screen/widgets/dealer_car_details.dart';
import 'package:flikcar/screens/dealers_flow/dealer_sell_car_screen/dealer_listed_car_details_screen/dealer_car_details.dart';
import 'package:flikcar/screens/dealers_flow/dealer_sell_car_screen/edit_dealer_uploaded_car/edit_dealer_uploaded_car.dart';
import 'package:flikcar/services/get_dealer_uploaded_car.dart';
import 'package:flikcar/utils/colors.dart';
import 'package:flikcar/utils/fonts.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DealerListedCarDetailsScreen extends StatelessWidget {
  final BuyerCar car;
  const DealerListedCarDetailsScreen({super.key, required this.car});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.getAppBar(),
      bottomNavigationBar: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.only(bottom: 10, top: 5),
        color: AppColors.s1,
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.p2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              padding: const EdgeInsets.only(left: 10, right: 10),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
            child: Row(
              children: [
                const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                  size: 18,
                ),
                const SizedBox(width: 4),
                Text(
                  "Back",
                  style: AppFonts.w500white14,
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          BuyNavButton(
            icon: Icons.check,
            title: "Mark as Sold",
            function: () {
              Provider.of<GetDealerUploadCars>(context, listen: false)
                  .markAsSold(context: context, carId: car.id.toString());
              // Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //         builder: (context) => EditDealerUploadedCar(
              //               car: car,
              //             )));
            },
          )
        ]),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
              padding: const EdgeInsets.all(12),
              width: MediaQuery.of(context).size.width,
              color: const Color.fromARGB(255, 240, 255, 249),
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
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        car.brand,
                        style: AppFonts.w700black16,
                      ),
                      Text(
                        car.model,
                        style: AppFonts.w500dark214,
                      ),
                    ],
                  ),
                  // const Spacer(),
                  // const Icon(Icons.share),
                  // const SizedBox(
                  //   width: 12,
                  // ),
                  // const Icon(Icons.flag),
                ],
              )),
          ImageViewer(
            car: car,
          ),
          const SizedBox(height: 12),
          DealerUploadCarDetails(
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
                title: "View All Specification",
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

          const SizedBox(height: 100),
        ]),
      ),
    );
  }
}
