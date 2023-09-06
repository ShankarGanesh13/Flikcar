import 'package:flikcar/common_widgets/heading1.dart';
import 'package:flikcar/common_widgets/loading_widget.dart';
import 'package:flikcar/common_widgets/primary_button.dart';
import 'package:flikcar/common_widgets/snackbar.dart';
import 'package:flikcar/models/customer_testdrive.dart';
import 'package:flikcar/screens/buy_car_flow/car_detailed_view/car_detailed_view.dart';
import 'package:flikcar/screens/buy_car_flow/provider/buy_car_provider.dart';
import 'package:flikcar/services/facebook_events.dart';
import 'package:flikcar/services/firebase_events.dart';
import 'package:flikcar/services/get_car_details.dart';
import 'package:flikcar/utils/colors.dart';
import 'package:flikcar/utils/fonts.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class UpcomingTestDriveCard extends StatelessWidget {
  UpcomingTestDriveCard({super.key});
  final DateFormat formatter = DateFormat('MMMEd');
  @override
  Widget build(BuildContext context) {
    List<CustomerTestDrive> testdrive =
        context.watch<BuyCarProvider>().upcomingTestDriveCars;
    return testdrive.isNotEmpty
        ? Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 15.0, right: 15, top: 15),
                child: Heading1(title1: "Upcoming Test Drive", title2: ""),
              ),
              SizedBox(
                height: 365,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: testdrive.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      List<String> features = [
                        testdrive[index].car.fuel,
                        "${testdrive[index].car.driveKms} kms",
                        "${testdrive[index].car.registrationYear}",
                        testdrive[index].car.transmission,
                      ];
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CarDetailedView(
                                  car: Provider.of<GetCarDetails>(context)
                                      .getCarById(
                                          id: testdrive[index]
                                              .car
                                              .id
                                              .toString()),
                                ),
                              ));
                        },
                        child: Container(
                          height: 351,
                          width: 268,
                          margin: const EdgeInsets.only(
                              right: 15, bottom: 20, top: 15, left: 15),
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
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 175,
                                child: ClipRRect(
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(15),
                                    topRight: Radius.circular(15),
                                  ),
                                  child: Image.network(
                                    testdrive[index].car.carImages.isNotEmpty
                                        ? "https://webservice.flikcar.com:8000/public/${testdrive[index].car.carImages[0].imageUrl}"
                                        : "https://developers.google.com/static/maps/documentation/maps-static/images/error-image-generic.png",
                                    fit: BoxFit.cover,
                                    width: MediaQuery.of(context).size.width,
                                    loadingBuilder:
                                        (context, child, loadingProgress) {
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
                                padding: const EdgeInsets.only(
                                    left: 12.0, right: 10, top: 8),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        SizedBox(
                                          width: 160,
                                          child: Text(
                                              testdrive[index].car.brand,
                                              style: AppFonts.w500dark214),
                                        ),
                                        const Spacer(),
                                        Text(
                                          "₹ ${testdrive[index].car.carPrice}",
                                          style: AppFonts.w700s140,
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 4),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width,
                                      child: Text(
                                          "${testdrive[index].car.model} ${testdrive[index].car.variant}",
                                          maxLines: 1,
                                          style: AppFonts.w700s140),
                                    ),
                                    const SizedBox(height: 4),
                                    Wrap(
                                      spacing: 6,
                                      children: List.generate(
                                        4,
                                        (index) => Container(
                                          width: index == 0 ? 48 : null,
                                          padding: const EdgeInsets.only(
                                              left: 0,
                                              right: 2,
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
                                    const SizedBox(
                                      height: 8,
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
                                          formatter.format(DateTime.parse(
                                              testdrive[index].testDriveDate)),
                                          style: AppFonts.w500s114,
                                        )
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 10.0, right: 10),
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 160,
                                      height: 35,
                                      child: PrimaryButton(
                                        title: "Contact Dealer",
                                        function: () async {
                                          FirebaseEvents().customerCallDealer(
                                              customerPhone: "customer",
                                              dealerPhone: testdrive[index]
                                                  .customerPhone);
                                          FacebookEvents().customerCallDealer(
                                              customerPhone: "customer",
                                              dealerPhone: testdrive[index]
                                                  .customerPhone);
                                          Uri phoneno = Uri(
                                            scheme: 'tel',
                                            path:
                                                '+91${testdrive[index].customerPhone}',
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
                                    Text(
                                      testdrive[index].car.saleStatus,
                                      style: (testdrive[index].car.saleStatus)
                                                  .toLowerCase() ==
                                              "available"
                                          ? AppFonts.w500green12
                                          : AppFonts.w500red12,
                                    )
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
          )
        : const SizedBox();
  }
}
