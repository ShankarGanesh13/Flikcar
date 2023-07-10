import 'package:flikcar/common_widgets/custom_appbar.dart';
import 'package:flikcar/screens/buy_car_flow/car_detailed_view/widgets/nav_button.dart';
import 'package:flikcar/screens/dealers_flow/auction_screens/dealer_car_detail_screen/widgets/dealer_car_details.dart';
import 'package:flikcar/screens/dealers_flow/auction_screens/dealer_car_detail_screen/widgets/dealer_car_features.dart';
import 'package:flikcar/screens/dealers_flow/auction_screens/dealer_car_detail_screen/widgets/dealer_car_specification.dart';
import 'package:flikcar/screens/dealers_flow/auction_screens/dealer_car_detail_screen/widgets/dealer_image_viewer.dart';
import 'package:flikcar/screens/dealers_flow/auction_screens/dealer_car_detail_screen/widgets/inspection_report.dart';
import 'package:flikcar/screens/dealers_flow/auction_screens/dealer_auction_home_screen/widgets/dealer_car_card.dart';
import 'package:flikcar/screens/dealers_flow/auction_screens/dealer_car_list_screen/dealer_car_list_screen.dart';
import 'package:flikcar/screens/dealers_flow/provider/dealer_provider.dart';
import 'package:flikcar/utils/colors.dart';
import 'package:flikcar/utils/fonts.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DealerCarDetailScreen extends StatelessWidget {
  const DealerCarDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar.getAppBarWithContainerSearch(
            context: context,
            function: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const DealerCarListScreen(),
                  ));
            },
            back: true),
        bottomNavigationBar: Container(
          height: 63,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.only(left: 15, right: 15),
          color: AppColors.s1,
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            bidButton(
                icon: Icons.remove,
                function: () {
                  Provider.of<DealerProvider>(context, listen: false)
                      .reduceBidAmount();
                }),
            Text(
              "  ₹ ${context.watch<DealerProvider>().bidAmount}  ",
              style: AppFonts.w700white16,
            ),
            bidButton(
                icon: Icons.add,
                function: () {
                  Provider.of<DealerProvider>(context, listen: false)
                      .increaseBidAmount();
                }),
            const Spacer(),
            BuyNavButton(
              icon: Icons.chevron_right,
              title: "Place Bid",
              function: () {},
            )
          ]),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                  padding: const EdgeInsets.all(12),
                  width: MediaQuery.of(context).size.width,
                  color: const Color.fromARGB(255, 240, 255, 249),
                  child: Row(
                    children: [
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
              DealerImageViewer(),
              const DealerCarDetails(),
              const SizedBox(
                height: 10,
              ),
              const InspectionReport(),
              const SizedBox(
                height: 10,
              ),
              const DealerCarFeatures(),
              const SizedBox(
                height: 15,
              ),
              const DealerCarSpecification(),
              const SizedBox(
                height: 25,
              ),
              const DealerCarCard(
                filters: [],
                title: "Auctions ending soon",
                filterButton: false,
              ),
              const SizedBox(
                height: 30,
              ),
            ],
          ),
        ));
  }

  Widget bidButton({required IconData icon, required Function() function}) {
    return GestureDetector(
      onTap: function,
      child: Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
            color: const Color(0xffffffff),
            borderRadius: BorderRadius.circular(4)),
        child: Icon(
          icon,
          size: 24,
          weight: 900,
          color: Color(0xff606060),
        ),
      ),
    );
  }
}
