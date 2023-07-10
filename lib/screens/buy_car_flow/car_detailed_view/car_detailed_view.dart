import 'package:flikcar/common_widgets/custom_appbar.dart';
import 'package:flikcar/common_widgets/primary_button.dart';
import 'package:flikcar/models/buyer_car_model.dart';
import 'package:flikcar/screens/buy_car_flow/buy_car_flow_home_screen/widgets/homescreen_card.dart';
import 'package:flikcar/screens/buy_car_flow/car_detailed_view/car_specifications/car_specifications.dart';
import 'package:flikcar/screens/buy_car_flow/car_detailed_view/widgets/address.dart';
import 'package:flikcar/screens/buy_car_flow/car_detailed_view/widgets/buy_car_details.dart';
import 'package:flikcar/screens/buy_car_flow/car_detailed_view/widgets/car_features.dart';
import 'package:flikcar/screens/buy_car_flow/car_detailed_view/widgets/image_viewer.dart';
import 'package:flikcar/screens/buy_car_flow/car_detailed_view/widgets/nav_button.dart';
import 'package:flikcar/screens/buy_car_flow/car_detailed_view/widgets/specifications.dart';
import 'package:flikcar/screens/buy_car_flow/filter_applied/filter_applied.dart';
import 'package:flikcar/screens/buy_car_flow/schedule_test_drive/schedule_test_drive.dart';
import 'package:flikcar/utils/colors.dart';
import 'package:flikcar/utils/fonts.dart';
import 'package:flutter/material.dart';

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
      bottomNavigationBar: Container(
        height: 63,
        width: MediaQuery.of(context).size.width,
        color: AppColors.s1,
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          BuyNavButton(
            icon: Icons.phone,
            title: "Contact Seller",
            function: () {},
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
                    builder: (context) => const ScheduleTestDrive(),
                  ));
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
                  const Spacer(),
                  const Icon(Icons.share),
                  const SizedBox(
                    width: 12,
                  ),
                  const Icon(Icons.flag),
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
          HomeScreenCard(
              title: "Similar Cars You Might Like",
              filters: [],
              cars: GetCarDetails.getAllCarDetails(),
              filterButton: false),
          const SizedBox(height: 100),
        ]),
      ),
    );
  }
}
