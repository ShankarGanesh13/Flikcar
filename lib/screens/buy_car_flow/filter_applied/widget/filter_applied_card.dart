import 'package:favorite_button/favorite_button.dart';
import 'package:flikcar/common_widgets/loading_widget.dart';
import 'package:flikcar/firebase_models/firebase_buyer_car.dart';
import 'package:flikcar/services/wishlist_service.dart';
import 'package:flikcar/utils/colors.dart';
import 'package:flikcar/utils/fonts.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class FilterAppliedCard extends StatefulWidget {
  final FirebaseBuyerCar car;
  const FilterAppliedCard({super.key, required this.car});

  @override
  State<FilterAppliedCard> createState() => _FilterAppliedCardState();
}

class _FilterAppliedCardState extends State<FilterAppliedCard> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    List<String> features = [
      widget.car.properties.fuelType,
      "${widget.car.properties.kmsDriven}kms",
      widget.car.properties.registrationYear.toString(),
      widget.car.properties.transmission
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(left: 15, right: 15, bottom: 10),
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
              width: MediaQuery.of(context).size.width / 2.5,
              height: 104,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Image.network(
                  widget.car.images[0].imageUrl,
                  fit: BoxFit.contain,
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
                          width: MediaQuery.of(context).size.width / 3.2,
                          child: Text(widget.car.properties.brand,
                              style: AppFonts.w500dark214)),
                      Text(
                        widget.car.status,
                        style: (widget.car.status).toLowerCase() == "available"
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
                          "${widget.car.properties.model} ${widget.car.properties.variant}",
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
                    "₹ ${formatPrice(int.parse(widget.car.carPrice))}",
                    style: AppFonts.w700black20,
                  )
                ],
              ),
            )
          ]),
        ),
        const SizedBox(height: 20)
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
