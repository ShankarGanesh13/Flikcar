import 'package:fast_cached_network_image/fast_cached_network_image.dart';
import 'package:flikcar/common_widgets/heading1.dart';
import 'package:flikcar/common_widgets/loading_widget.dart';
import 'package:flikcar/common_widgets/primary_button.dart';
import 'package:flikcar/models/buyer_car_model.dart';
import 'package:flikcar/screens/buy_car_flow/car_detailed_view/car_detailed_view.dart';
import 'package:flikcar/utils/colors.dart';
import 'package:flikcar/utils/fonts.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class UpcomingTestDriveCard extends StatelessWidget {
  final List<BuyerCar> cars;
  const UpcomingTestDriveCard({super.key, required this.cars});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.all(15.0),
          child: Heading1(title1: "Upcoming Test Drive", title2: ""),
        ),
        SizedBox(
          height: 370,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 2,
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
                        right: 15, bottom: 20, top: 5, left: 15),
                    decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(
                          color: Color.fromRGBO(0, 0, 0, 0.25),
                          offset: Offset(1, 1),
                          blurRadius: 12,
                          spreadRadius: 0,
                        ),
                      ],
                      color: const Color(0xffF2F2F2),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 175,
                          child: ClipRRect(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                            ),
                            child: FastCachedImage(
                              url: cars[index].carImages.isNotEmpty
                                  ? "https://admin.flikcar.com/${cars[index].carImages[0]}"
                                  : "https://developers.google.com/static/maps/documentation/maps-static/images/error-image-generic.png",
                              fit: BoxFit.cover,
                              fadeInDuration: const Duration(seconds: 1),
                              errorBuilder: (context, exception, stacktrace) {
                                return Text(stacktrace.toString());
                              },
                              loadingBuilder: (context, progress) {
                                return SizedBox(
                                  width: 175.0,
                                  height: 100.0,
                                  child: Shimmer.fromColors(
                                      baseColor: Colors.black26,
                                      highlightColor: Colors.black26,
                                      child: const LoadingWidget()),
                                );
                              },
                            ),

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
                          padding: const EdgeInsets.only(left: 12.0, right: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 35,
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 160,
                                      child: Text(cars[index].carName,
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
                              Text(cars[index].brand,
                                  style: AppFonts.w500dark214),
                              const SizedBox(height: 4),
                              Wrap(
                                spacing: 6,
                                children: List.generate(
                                  4,
                                  (index) => Container(
                                    padding: const EdgeInsets.only(
                                        left: 0, right: 5, top: 5, bottom: 0),
                                    decoration: BoxDecoration(
                                        color: Colors.transparent,
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: Text(
                                      features[index],
                                      style: AppFonts.w500black12,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.calendar_month,
                                    color: AppColors.p2,
                                    size: 20,
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "30 May, Wed",
                                    style: AppFonts.w500s114,
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0, right: 10),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 180,
                                height: 35,
                                child: PrimaryButton(
                                  title: "Contact Dealer",
                                  function: () {},
                                  borderColor: AppColors.s1,
                                  textStyle: AppFonts.w500s114,
                                  backgroundColor: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
              }),
        ),
      ],
    );
  }
}
