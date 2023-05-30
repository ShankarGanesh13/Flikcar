import 'package:flikcar/common_widgets/custom_appbar.dart';
import 'package:flikcar/screens/buy_car_flow/buy_car_flow_home_screen/widgets/homescreen_card.dart';
import 'package:flikcar/screens/buy_car_flow/car_detailed_view/widgets/address.dart';
import 'package:flikcar/screens/buy_car_flow/car_detailed_view/widgets/buy_car_details.dart';
import 'package:flikcar/screens/buy_car_flow/car_detailed_view/widgets/car_features.dart';
import 'package:flikcar/screens/buy_car_flow/car_detailed_view/widgets/image_viewer.dart';
import 'package:flikcar/screens/buy_car_flow/car_detailed_view/widgets/nav_button.dart';
import 'package:flikcar/screens/buy_car_flow/car_detailed_view/widgets/specifications.dart';
import 'package:flikcar/screens/buy_car_flow/schedule_test_drive/schedule_test_drive.dart';
import 'package:flikcar/utils/colors.dart';
import 'package:flikcar/utils/fonts.dart';
import 'package:flutter/material.dart';

class CarDetailedView extends StatelessWidget {
  const CarDetailedView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.getBuyCarAppBar(context),
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
                    builder: (context) => ScheduleTestDrive(),
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
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.chevron_left,
                      color: AppColors.p2,
                      size: 28,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Car Name",
                        style: AppFonts.w700black16,
                      ),
                      Text(
                        "Varient Name",
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
          ImageViewer(),
          const SizedBox(height: 12),
          const BuyCarDetails(),
          const CarAddress(),
          const CarFeatures(),
          const CarSpecification(),
          const SizedBox(height: 20),
          const HomeScreenCard(
              title: "Similar Cars You Might Like",
              filters: [],
              filterButton: false),
          const SizedBox(height: 100),
        ]),
      ),
    );
  }
}
