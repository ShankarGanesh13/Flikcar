import 'package:favorite_button/favorite_button.dart';
import 'package:flikcar/common_widgets/loading_widget.dart';
import 'package:flikcar/common_widgets/primary_button.dart';
import 'package:flikcar/models/buyer_car_model.dart';
import 'package:flikcar/screens/buy_car_flow/filter_applied/widget/filter_applied_card.dart';
import 'package:flikcar/screens/dealers_flow/dealer_flow.dart';
import 'package:flikcar/screens/dealers_flow/dealer_sell_car_screen/dealer_listed_car_details_screen/dealer_listed_car_deatils_screen.dart';
import 'package:flikcar/screens/dealers_flow/dealer_sell_car_screen/edit_dealer_uploaded_car/edit_dealer_uploaded_car.dart';
import 'package:flikcar/screens/dealers_flow/dealer_sell_car_screen/widgets/edit_listing_bottom_sheet.dart';
import 'package:flikcar/services/get_dealer_uploaded_car.dart';
import 'package:flikcar/utils/colors.dart';
import 'package:flikcar/utils/fonts.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class DealerListedCars extends StatelessWidget {
  final List<BuyerCar> cars;
  DealerListedCars({super.key, required this.cars});
  static List<String> features = ["Petrol", "13000kms", "2014", "Manual"];
  final DateFormat formatter = DateFormat('MMMd');
  @override
  Widget build(BuildContext context) {
    return cars.isNotEmpty
        ? ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: cars.length,
            itemBuilder: (context, index) {
              features = [
                cars[index].fuel,
                "${cars[index].driveKms}km",
                cars[index].transmission,
                cars[index].registrationYear,
              ];
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              DealerListedCarDetailsScreen(car: cars[index])));
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
                          cars[index].carImages.isNotEmpty
                              ? "https://webservice.flikcar.com/public/${cars[index].carImages[0].imageUrl}"
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
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width / 2.5,
                                child: Text(
                                  cars[index].model,
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
                            cars[index].brand,
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
                            "₹ ${cars[index].carPrice} ",
                            style: AppFonts.w700black20,
                          ),
                          const SizedBox(height: 4),
                          Row(
                            children: [
                              SizedBox(
                                width: 100,
                                height: 30,
                                child: PrimaryButton(
                                    title: cars[index].saleStatus == "Available"
                                        ? "Mark as Sold"
                                        : "Mark Available",
                                    function: () {
                                      Provider.of<GetDealerUploadCars>(context,
                                              listen: false)
                                          .markAsSold(
                                              context: context,
                                              carId: cars[index].id.toString());
                                    },
                                    borderColor: AppColors.s1,
                                    backgroundColor: Colors.white,
                                    textStyle: AppFonts.w500s110),
                              ),
                              const SizedBox(
                                width: 4,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(cars[index].saleStatus,
                                      style:
                                          cars[index].saleStatus == "Available"
                                              ? AppFonts.w500green14
                                              : AppFonts.w500red14),
                                  Text(
                                    "Listed on ${formatter.format(DateTime.parse(cars[index].updatedAt))}",
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
                ),
              );
            })
        : Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 80.0),
              child: Text(
                "No cars to show",
                style: AppFonts.w700black16,
              ),
            ),
          );
  }
}
