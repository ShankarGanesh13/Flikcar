import 'package:flikcar/common_widgets/loading_widget.dart';
import 'package:flikcar/common_widgets/primary_button.dart';
import 'package:flikcar/firebase_models/firebase_delaer_listed_car.dart';
import 'package:flikcar/screens/dealers_flow/dealer_sell_car_screen/dealer_listed_car_details_screen/dealer_listed_car_deatils_screen.dart';
import 'package:flikcar/utils/colors.dart';
import 'package:flikcar/utils/fonts.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DealerListedCarCard extends StatelessWidget {
  FirebaseDealerListedCar car;
  DealerListedCarCard({super.key, required this.car});
  static List<String> features = ["Petrol", "13000kms", "2014", "Manual"];
  final DateFormat formatter = DateFormat('MMMd');
  @override
  Widget build(BuildContext context) {
    features = [
      car.fuelType,
      "${car.kmsDriven}km",
      car.transmission,
      car.registrationYear.toString(),
    ];
    return GestureDetector(
        onTap: () {
          // Navigator.push(
          //     context,
          //     MaterialPageRoute(
          //         builder: (context) =>
          //             DealerListedCarDetailsScreen(car: cars[index])));
        },
        child: Container(
          height: 137,
          margin: const EdgeInsets.only(bottom: 30),
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
              width: MediaQuery.of(context).size.width / 2.46,
              height: 137,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Image.network(
                  car.imagePath,
                  //cars[index].carImages,
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
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 2.5,
                        child: Text(
                          car.model,
                          style: AppFonts.w700black16,
                          maxLines: 1,
                        ),
                      ),
                      // GestureDetector(
                      //   onTap: () {
                      //     showModalBottomSheet<void>(
                      //       isScrollControlled: true,
                      //       context: context,
                      //       builder: (BuildContext context) {
                      //         return const EditListingBottomSheet();
                      //       },
                      //     );
                      //   },
                      //   child: const Icon(
                      //     Icons.more_horiz,
                      //     size: 22,
                      //   ),
                      // )
                    ],
                  ),
                  Text(
                    car.brand,
                    style: AppFonts.w500dark214,
                  ),
                  const SizedBox(height: 4),
                  Wrap(
                    spacing: 5,
                    children: List.generate(
                      4,
                      (index) => Container(
                        height: 10,
                        width: index == 0 ? 40 : null,
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
                    "₹ ${car.carPrice} ",
                    style: AppFonts.w700black20,
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      SizedBox(
                        width: 90,
                        height: 30,
                        child: PrimaryButton(
                            title: "View Car",
                            function: () {
                              // Provider.of<GetDealerUploadCars>(context,
                              //         listen: false)
                              //     .markAsSold(
                              //         context: context,
                              //         carId: cars[index].id.toString());
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          DealerListedCarDetailsScreen(
                                              carId: car.id)));
                            },
                            borderColor: AppColors.s1,
                            backgroundColor: Colors.white,
                            textStyle: AppFonts.w500s110),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
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
                            "Listed on ${formatter.format(DateTime.fromMillisecondsSinceEpoch(car.createdAt))}",
                            style: AppFonts.w500black10,
                          )
                        ],
                      )
                    ],
                  ),
                ],
              ),
            )
          ]),
        ));
  }
}
