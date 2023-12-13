import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flikcar/common_widgets/snackbar.dart';
import 'package:flikcar/firebase_models/firebase_auction_car_details.dart';
import 'package:flikcar/models/auction_car_model.dart';
import 'package:flikcar/screens/buy_car_flow/car_detailed_view/widgets/nav_button.dart';

import 'package:flikcar/screens/dealers_flow/auction_screens/dealer_car_list_screen/widget/ongoing_timer2.dart';
import 'package:flikcar/screens/dealers_flow/auction_screens/dealer_car_list_screen/widget/timer_text.dart';
import 'package:flikcar/screens/dealers_flow/auction_screens/dealer_car_list_screen/widget/upcoming_timer2.dart';
import 'package:flikcar/screens/dealers_flow/auction_screens/firebase_auction_car_detail_screen/widgets/bid_textfield.dart';
import 'package:flikcar/screens/dealers_flow/auction_screens/firebase_auction_car_detail_screen/widgets/current_bid_widget.dart';
import 'package:flikcar/utils/colors.dart';
import 'package:flikcar/utils/fonts.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class FirebaseDealerCarDetails extends StatelessWidget {
  final FirebaseAuctionCarDetails car;

  FirebaseDealerCarDetails({super.key, required this.car});
  static List<String> icondata = [
    "assets/car_details_icon/location.png",
    "assets/car_details_icon/speedometer.png",
    "assets/car_details_icon/owner.png",
    "assets/car_details_icon/fuel_type.png",
    "assets/car_details_icon/calendar.png",
    "assets/car_details_icon/transmisson.png",
    "assets/car_details_icon/roadTax.png",
    "assets/car_details_icon/insurance.png",
    "assets/car_details_icon/noc.png",
    "assets/car_details_icon/location.png",
  ];

  final DateFormat formatter = DateFormat('yMMM');

  List<String> data = [];
  //TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    data = [
      "City: Kolkata",
      "Km Driven: ${car.properties.kmsDriven}",
      "Owners: ${car.properties.ownerType}",
      "Fuel Type: ${car.properties.fuelType}",
      "Reg. Year: ${car.properties.registerationYear}",
      "Transmission: ${car.properties.transmission}",
      "Road Tax \nValidity: ${car.properties.roadTaxValidity == null ? "N/A" : formatter.format(DateTime.fromMillisecondsSinceEpoch(car.properties.roadTaxValidity!))}",
      "Insurance\nValidity: ${car.properties.insuranceValidity == null ? "N/A" : formatter.format(DateTime.fromMillisecondsSinceEpoch(car.properties.insuranceValidity!))}",
      "NOC: ${car.properties.noc}",
      "RTO Location: ${car.properties.rtoLocation}"
    ];
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Wrap(
              runAlignment: WrapAlignment.spaceEvenly,
              alignment: WrapAlignment.start,
              spacing: 15,
              runSpacing: 15,
              crossAxisAlignment: WrapCrossAlignment.start,
              children: List.generate(
                  10,
                  (index) => SizedBox(
                        width: MediaQuery.of(context).size.width / 2.35,
                        child: Row(
                          children: [
                            Container(
                                padding: const EdgeInsets.all(5),
                                margin: const EdgeInsets.only(left: 5),
                                height: 26,
                                width: 30,
                                decoration: BoxDecoration(
                                  color: AppColors.p2,
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(5),
                                    bottomLeft: Radius.circular(5),
                                  ),
                                ),
                                child: Image.asset(
                                  icondata[index],
                                  color: Colors.white,
                                )),
                            const SizedBox(
                              width: 6,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 3.2,
                              child: Text(
                                data[index],
                                style: AppFonts.w500black12,
                              ),
                            )
                          ],
                        ),
                      )),
            ),
          )
        ],
      ),
    );
  }
}
