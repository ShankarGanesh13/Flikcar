import 'package:flikcar/models/buyer_car_model.dart';
import 'package:flikcar/utils/fonts.dart';
import 'package:flutter/material.dart';

class ScheduleCarDetails extends StatelessWidget {
  final BuyerCar car;
  const ScheduleCarDetails({super.key, required this.car});
  static List<String> features = ["Petrol", "13000kms", "2014", "Manual"];
  @override
  Widget build(BuildContext context) {
    features = [
      car.fuel,
      "${car.driveKms}km",
      car.registrationYear,
      car.transmission
    ];
    return Row(
      children: [
        Container(
            width: MediaQuery.of(context).size.width / 2.5,
            height: 94,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                car.carImages.isNotEmpty
                    ? "http://webservice.flikcar.com:8000/public/${car.carImages[0]}"
                    : "https://developers.google.com/static/maps/documentation/maps-static/images/error-image-generic.png",
                fit: BoxFit.cover,
              ),
            )),
        const Spacer(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width / 2,
              child: Text(
                car.model,
                style: AppFonts.w700black16,
              ),
            ),
            Wrap(
              spacing: 2,
              children: List.generate(
                4,
                (index) => Container(
                  width: index == 0 ? 45 : null,
                  padding: const EdgeInsets.only(
                      left: 0, right: 3, top: 10, bottom: 10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)),
                  child: Text(
                    features[index],
                    style: AppFonts.w500black12,
                    maxLines: 1,
                  ),
                ),
              ),
            ),
            Text(
              "₹105897",
              style: AppFonts.w700black20,
            ),
          ],
        )
      ],
    );
  }
}
