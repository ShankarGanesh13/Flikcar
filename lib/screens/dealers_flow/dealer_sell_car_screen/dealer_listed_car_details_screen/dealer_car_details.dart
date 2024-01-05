import 'package:flikcar/firebase_models/firebase_buyer_car.dart';
import 'package:flikcar/utils/colors.dart';
import 'package:flikcar/utils/fonts.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DealerUploadCarDetails extends StatelessWidget {
  final FirebaseBuyerCar car;
  const DealerUploadCarDetails({super.key, required this.car});
  static List<String> icondata = [
    "assets/car_details_icon/location.png",
    "assets/car_details_icon/speedometer.png",
    "assets/car_details_icon/owner.png",
    "assets/car_details_icon/fuel_type.png",
    "assets/car_details_icon/calendar.png",
    "assets/car_details_icon/transmisson.png",
    // "assets/car_details_icon/location.png",
  ];

  @override
  Widget build(BuildContext context) {
    List data = [
      "RTO location: ${car.properties.RTOlocation.toUpperCase()}",
      "Km Driven: ${car.properties.kmsDriven.toString()}",
      "Owners: ${car.properties.ownerType}",
      "Fuel Type: ${car.properties.fuelType}",
      "Reg. Year: ${car.properties.registrationYear}",
      "Transmission: ${car.properties.transmission}",
      //  "RTO location: ${car.properties.RTOlocation}"
    ];
    final DateFormat formatter = DateFormat('MMMd');

    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        children: [
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  car.status.toLowerCase() == "available"
                      ? Text("Available", style: AppFonts.w500green14)
                      : Text(
                          "Sold Out",
                          style: AppFonts.w500red14,
                        ),
                  Text(
                    "Listed on ${formatter.format(DateTime.fromMillisecondsSinceEpoch(car.properties.uploadedAt))}",
                    style: AppFonts.w500black12,
                  )
                ],
              ),
              const Spacer(),
              Text(
                "₹ ${formatPrice(int.parse(car.carPrice))}",
                style: AppFonts.w700black20,
              ),
            ],
          ),
          const SizedBox(height: 30),
          Align(
            alignment: Alignment.topLeft,
            child: Wrap(
              runAlignment: WrapAlignment.spaceEvenly,
              alignment: WrapAlignment.spaceEvenly,
              spacing: 8,
              runSpacing: 15,
              crossAxisAlignment: WrapCrossAlignment.start,
              children: List.generate(
                  data.length,
                  (index) => SizedBox(
                        width: MediaQuery.of(context).size.width / 2.25,
                        child: Row(
                          children: [
                            Container(
                                padding: const EdgeInsets.all(5),
                                margin: const EdgeInsets.only(left: 9),
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
                              width: 8,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 3.15,
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

  String formatPrice(int price) {
    final currencyFormatter = NumberFormat.currency(
      locale: 'en_IN',
      symbol: '',
      decimalDigits: 0,
    );
    return currencyFormatter.format(price);
  }
}
