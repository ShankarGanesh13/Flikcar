import 'package:fast_cached_network_image/fast_cached_network_image.dart';
import 'package:favorite_button/favorite_button.dart';
import 'package:flikcar/common_widgets/heading1.dart';
import 'package:flikcar/common_widgets/loading_widget.dart';
import 'package:flikcar/common_widgets/primary_button.dart';
import 'package:flikcar/common_widgets/snackbar.dart';
import 'package:flikcar/models/buyer_car_model.dart';
import 'package:flikcar/screens/buy_car_flow/car_detailed_view/car_detailed_view.dart';
import 'package:flikcar/screens/buy_car_flow/filter_applied/filter_applied.dart';
import 'package:flikcar/screens/buy_car_flow/provider/buy_car_provider.dart';
import 'package:flikcar/services/facebook_events.dart';
import 'package:flikcar/services/firebase_events.dart';
import 'package:flikcar/services/get_car_details.dart';
import 'package:flikcar/services/wishlist_service.dart';
import 'package:flikcar/utils/colors.dart';
import 'package:flikcar/utils/fonts.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreenCard extends StatelessWidget {
  final String title;
  final bool filterButton;
  final String filter;
  final List<String> filters;
  final List<BuyerCar> cars;
  final int selectedindex;

  const HomeScreenCard({
    super.key,
    required this.title,
    required this.filters,
    required this.cars,
    required this.selectedindex,
    required this.filter,
    required this.filterButton,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(
            left: 15,
          ),
          child: Heading1(title1: title, title2: ''),
        ),
        const SizedBox(height: 12),
        filterButton == true
            ? SizedBox(
                height: 30,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: filters.length,
                  itemBuilder: (context, index) => GestureDetector(
                    onTap: () {
                      Provider.of<GetCarDetails>(context, listen: false)
                          .filterCars(
                              filterType: filter,
                              filter: filters[index],
                              index: index);
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => const FilterApplied()));
                      //  print(filters[index]);
                    },
                    child: Container(
                      margin: const EdgeInsets.only(left: 15),
                      padding: const EdgeInsets.only(
                          top: 5, bottom: 5, left: 10, right: 10),
                      decoration: BoxDecoration(
                          color: selectedindex == index
                              ? AppColors.s1
                              : AppColors.p2,
                          borderRadius: BorderRadius.circular(4)),
                      child: Text(
                        filters[index],
                        style: AppFonts.w500white14,
                      ),
                    ),
                  ),
                ),
              )
            : const SizedBox(),
        SizedBox(height: filterButton == true ? 12 : 0),
        const SizedBox(
          height: 5,
        ),
        Container(
          padding: const EdgeInsets.only(bottom: 15),
          height: 355,
          child: cars.isNotEmpty
              ? ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: cars.length > 8 ? 8 : cars.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    List<String> features = [
                      cars[index].fuel,
                      "${cars[index].driveKms} kms",
                      "${cars[index].registrationYear}",
                      cars[index].transmission,
                    ];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CarDetailedView(
                                car: cars[index],
                              ),
                            ));
                      },
                      child: Container(
                        height: 361,
                        width: 268,
                        margin: const EdgeInsets.only(
                            right: 15, bottom: 20, top: 10, left: 15),
                        decoration: BoxDecoration(
                          boxShadow: const [
                            // BoxShadow(
                            //   color: Color.fromRGBO(0, 0, 0, 0.25),
                            //   offset: Offset(2, 12),
                            //   blurRadius: 18,
                            //   spreadRadius: -8,
                            // ),
                            BoxShadow(
                              color: Color.fromRGBO(0, 0, 0, 0.25),
                              offset: Offset(1, 1),
                              blurRadius: 12,
                              spreadRadius: 0,
                            ),
                          ],
                          color: const Color(0xffF2F2F2),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 170,
                              width: MediaQuery.of(context).size.width,
                              child: ClipRRect(
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(15),
                                    topRight: Radius.circular(15),
                                  ),
                                  child: Image.network(
                                    cars[index].carImages.isNotEmpty
                                        ? "https://webservice.flikcar.com:8000/public/${cars[index].carImages[0]}"
                                        : "https://developers.google.com/static/maps/documentation/maps-static/images/error-image-generic.png",
                                    fit: BoxFit.fill,
                                  )

                                  //  FastCachedImage(
                                  //   url: cars[index].carImages.isNotEmpty
                                  //       ? "https://webservice.flikcar.com:8000/public/${cars[index].carImages[0]}"
                                  //       : "https://developers.google.com/static/maps/documentation/maps-static/images/error-image-generic.png",
                                  //   fit: BoxFit.cover,
                                  //   width: MediaQuery.of(context).size.width,
                                  //   fadeInDuration: const Duration(seconds: 1),
                                  //   errorBuilder:
                                  //       (context, exception, stacktrace) {
                                  //     return const Center(
                                  //       child: Text("Image cannot be loaded"),
                                  //     );
                                  //   },
                                  //   loadingBuilder: (context, progress) {
                                  //     return SizedBox(
                                  //       width: 200.0,
                                  //       height: 100.0,
                                  //       child: Shimmer.fromColors(
                                  //           baseColor: Colors.black26,
                                  //           highlightColor: Colors.black26,
                                  //           child: const LoadingWidget()),
                                  //     );
                                  //   },
                                  // ),

                                  // SizedBox(
                                  //   width: MediaQuery.of(context).size.width,
                                  //   height: 181,
                                  //   child: Image.asset(
                                  //     "assets/sample_car.png",
                                  //     fit: BoxFit.fill,
                                  //   ),
                                  // ),
                                  ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 10.0, right: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 35,
                                    child: Row(
                                      children: [
                                        SizedBox(
                                          width: 160,
                                          child: Text(cars[index].model,
                                              maxLines: 1,
                                              style: AppFonts.w700s140),
                                        ),
                                        const Spacer(),
                                        Text(
                                          "₹ ${cars[index].carPrice}",
                                          style: AppFonts.w700s140,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Text(cars[index].brand,
                                          style: AppFonts.w500dark214),
                                      const Spacer(),
                                      Text(
                                        cars[index].saleStatus,
                                        style: (cars[index].saleStatus)
                                                    .toLowerCase() ==
                                                "available"
                                            ? AppFonts.w500green12
                                            : AppFonts.w500red12,
                                      )
                                    ],
                                  ),
                                  const SizedBox(height: 4),
                                  Wrap(
                                    spacing: 6,
                                    children: List.generate(
                                      4,
                                      (index) => Container(
                                        width: index == 0 ? 45 : null,
                                        padding: const EdgeInsets.only(
                                            left: 0,
                                            right: 5,
                                            top: 5,
                                            bottom: 0),
                                        decoration: BoxDecoration(
                                            color: Colors.transparent,
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        child: Text(
                                          features[index],
                                          style: AppFonts.w500black12,
                                          maxLines: 1,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 10),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 10.0, right: 10),
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 180,
                                    height: 35,
                                    child: PrimaryButton(
                                      title: "Contact Dealer",
                                      function: () async {
                                        FirebaseEvents().customerCallDealer(
                                            customerPhone: "customer",
                                            dealerPhone:
                                                cars[index].dealerPhoneNumber!);
                                        FacebookEvents().customerCallDealer(
                                            customerPhone: "customer",
                                            dealerPhone:
                                                cars[index].dealerPhoneNumber!);

                                        Uri phoneno = Uri(
                                          scheme: 'tel',
                                          path:
                                              '+91${cars[index].dealerPhoneNumber}',
                                        );
                                        if (await launchUrl(phoneno)) {
                                        } else {
                                          if (context.mounted) {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                                    MySnackbar.showSnackBar(
                                                        context,
                                                        "Unable to open dailer"));
                                          }
                                        }
                                      },
                                      borderColor: AppColors.s1,
                                      textStyle: AppFonts.w500s114,
                                      backgroundColor: Colors.white,
                                    ),
                                  ),
                                  const Spacer(),
                                  FavoriteButton(
                                    iconSize: 30,
                                    iconColor: Color.fromARGB(255, 255, 0, 0),
                                    isFavorite: cars[index].isFavourite,
                                    iconDisabledColor: const Color(0xffE0E0E0),
                                    valueChanged: (_) {
                                      Provider.of<WishlistService>(context,
                                              listen: false)
                                          .addToWishlist(
                                              carId: cars[index].id,
                                              context: context);
                                    },
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  })
              : SizedBox(
                  height: 350,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 100.0),
                    child: Text(
                      "No cars found for the selected filter",
                      style: AppFonts.w700black14,
                    ),
                  ),
                ),
        ),
        const SizedBox(
          height: 10,
        )
      ],
    );
  }
}
