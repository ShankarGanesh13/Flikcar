import 'package:flikcar/common_widgets/loading_widget.dart';
import 'package:flikcar/firebase_models/firebase_delaer_listed_car.dart';
import 'package:flikcar/utils/fonts.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class StoreCarsCard extends StatelessWidget {
  final FirebaseDealerListedCar car;
  const StoreCarsCard({super.key, required this.car});

  @override
  Widget build(BuildContext context) {
    List<String> features = [
      car.fuelType,
      "${car.kmsDriven}kms",
      car.registrationYear.toString(),
      car.transmission
    ];
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Container(
        margin: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
        height: 105,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: const [
              BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.25),
                offset: Offset(1, 1),
                blurRadius: 20,
                spreadRadius: 0,
              ),
            ],
            borderRadius: BorderRadius.circular(5)),
        child: Row(children: [
          SizedBox(
            width: MediaQuery.of(context).size.width / 2.4,
            height: 104,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Image.network(
                car.imagePath,
                fit: BoxFit.fill,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) {
                    return child;
                  } else {
                    return const LoadingWidget();
                  }
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(7.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    SizedBox(
                        width: MediaQuery.of(context).size.width / 3.6,
                        child: Text(car.brand, style: AppFonts.w500dark214)),

                    const SizedBox(
                      width: 4,
                    ),
                    // SizedBox(
                    //   height: 20,
                    //   width: 20,
                    //   child: FavoriteButton(
                    //     iconColor: const Color(0xffE0E0E0),
                    //     iconDisabledColor: const Color(0xffE0E0E0),
                    //     valueChanged: (_) {
                    //       Provider.of<WishlistService>(context, listen: false)
                    //           .addToWishlist(
                    //               carId: widget.car.id, context: context);
                    //     },
                    //     iconSize: 20,
                    //   ),
                    // ),
                    Text(
                      car.status,
                      style: (car.status).toLowerCase() == "available"
                          ? AppFonts.w500green12
                          : AppFonts.w500red12,
                    )
                  ],
                ),
                const SizedBox(
                  height: 2,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2.5,
                      child: Text(
                        "${car.model} ${car.variant}",
                        maxLines: 1,
                        style: AppFonts.w700black14,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 7),
                Wrap(
                  spacing: 4,
                  children: List.generate(
                    4,
                    (index) => Container(
                      width: index == 0 ? 38 : null,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20)),
                      child: Text(
                        features[index],
                        style: AppFonts.w500black10,
                        maxLines: 1,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  "₹ ${formatPrice(int.parse(car.carPrice))}",
                  style: AppFonts.w700black20,
                )
              ],
            ),
          )
        ]),
      )
    ]);
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
