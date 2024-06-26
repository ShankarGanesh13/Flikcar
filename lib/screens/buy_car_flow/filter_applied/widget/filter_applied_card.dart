import 'package:favorite_button/favorite_button.dart';
import 'package:flikcar/common_widgets/loading_widget.dart';
import 'package:flikcar/models/buyer_car_display.dart';
import 'package:flikcar/models/buyer_car_model.dart';
import 'package:flikcar/services/wishlist_service.dart';
import 'package:flikcar/utils/colors.dart';
import 'package:flikcar/utils/fonts.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FilterAppliedCard extends StatefulWidget {
  final bool compare;
  final BuyerCarDisplay car;
  const FilterAppliedCard(
      {super.key, required this.compare, required this.car});

  @override
  State<FilterAppliedCard> createState() => _FilterAppliedCardState();
}

class _FilterAppliedCardState extends State<FilterAppliedCard> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    List<String> features = [
      widget.car.fuelType,
      "${widget.car.driveKms}kms",
      widget.car.registerationYear.toString(),
      widget.car.transmission
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
              width: MediaQuery.of(context).size.width / 2.4,
              height: 104,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Image.network(
                  widget.car.images.isNotEmpty
                      ? "https://webservice.flikcar.com/public/${widget.car.images[0]}"
                      : "https://developers.google.com/static/maps/documentation/maps-static/images/error-image-generic.png",
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
                          width: MediaQuery.of(context).size.width / 3.2,
                          child: Text(widget.car.brand,
                              style: AppFonts.w500dark214)),

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
                        widget.car.saleStatus,
                        style:
                            (widget.car.saleStatus).toLowerCase() == "available"
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
                          "${widget.car.model} ${widget.car.variant}",
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
                    "₹ ${widget.car.price}",
                    style: AppFonts.w700black20,
                  )
                ],
              ),
            )
          ]),
        ),
        widget.compare
            ? Container(
                padding: const EdgeInsets.only(left: 15),
                width: 200,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      isSelected = isSelected == false ? true : false;
                    });
                  },
                  child: Row(
                    children: [
                      Container(
                        height: 15,
                        width: 15,
                        decoration: BoxDecoration(
                            border: Border.all(color: const Color(0xff161F31))),
                        child: Center(
                            child: Icon(
                          Icons.check,
                          size: 14,
                          color: isSelected ? AppColors.s1 : Colors.transparent,
                          weight: 2,
                        )),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        "Select to compare",
                        style: AppFonts.w500dark214,
                      )
                    ],
                  ),
                ),
              )
            : const SizedBox(),
        const SizedBox(height: 20)
      ],
    );
  }
}
