import 'package:flikcar/common_widgets/loading_widget.dart';
import 'package:flikcar/firebase_models/firebase_buyer_car.dart';
import 'package:flikcar/utils/fonts.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ScheduleCarDetails extends StatelessWidget {
  final FirebaseBuyerCar car;
  const ScheduleCarDetails({super.key, required this.car});
  static List<String> features = ["Petrol", "13000kms", "2014", "Manual"];
  @override
  Widget build(BuildContext context) {
    features = [
      car.properties.fuelType,
      "${car.properties.kmsDriven}km",
      car.properties.registrationYear.toString(),
      car.properties.transmission
    ];
    return Row(
      children: [
        Container(
            width: MediaQuery.of(context).size.width / 2.6,
            height: 94,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                car.images[0].imageUrl,
                fit: BoxFit.fill,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) {
                    return child;
                  } else {
                    return const LoadingWidget();
                  }
                },
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
                car.properties.brand,
                style: AppFonts.w700dark216,
              ),
            ),
            const SizedBox(
              height: 2,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 2,
              child: Text(
                car.properties.model,
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
              "₹ ${formatPrice(int.parse(car.carPrice))}",
              style: AppFonts.w700black20,
            ),
          ],
        )
      ],
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
