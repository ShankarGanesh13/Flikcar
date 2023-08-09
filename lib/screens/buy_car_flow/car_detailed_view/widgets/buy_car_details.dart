import 'package:flikcar/models/buyer_car_model.dart';
import 'package:flikcar/utils/colors.dart';
import 'package:flikcar/utils/fonts.dart';
import 'package:flutter/material.dart';

class BuyCarDetails extends StatelessWidget {
  final BuyerCar car;
  const BuyCarDetails({super.key, required this.car});
  static List<String> icondata = [
    "assets/car_details_icon/location.png",
    "assets/car_details_icon/speedometer.png",
    "assets/car_details_icon/owner.png",
    "assets/car_details_icon/fuel_type.png",
    "assets/car_details_icon/engine.png",
    "assets/car_details_icon/transmisson.png"
  ];

  @override
  Widget build(BuildContext context) {
    List data = [
      "City: Kolkata",
      "Km Driven: ${car.driveKms.toString()}",
      "Owners: ${car.ownertype}",
      "Fuel Type: ${car.fuel}",
      "Engine: ${car.engine} bhp",
      "Transmission: ${car.transmission}"
    ];

    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                "${car.carPrice} ₹",
                style: AppFonts.w700black20,
              ),
              const Spacer(),
              Text(
                "Inspection Score:",
                style: AppFonts.w500black14,
              ),
              const SizedBox(width: 8),
              const Icon(Icons.star),
              const SizedBox(width: 3),
              Text(
                car.technicianRating,
                style: AppFonts.w700black20,
              )
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
                  6,
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
                                )),
                            const SizedBox(
                              width: 8,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 3.15,
                              child: Text(
                                data[index],
                                style: AppFonts.w500black10,
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
