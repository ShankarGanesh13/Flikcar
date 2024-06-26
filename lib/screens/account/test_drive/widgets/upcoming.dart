import 'package:favorite_button/favorite_button.dart';
import 'package:flikcar/common_widgets/common_car_details.dart';
import 'package:flikcar/common_widgets/loading_widget.dart';
import 'package:flikcar/common_widgets/primary_button.dart';
import 'package:flikcar/common_widgets/snackbar.dart';
import 'package:flikcar/models/customer_testdrive.dart';
import 'package:flikcar/services/facebook_events.dart';
import 'package:flikcar/services/firebase_events.dart';
import 'package:flikcar/utils/colors.dart';
import 'package:flikcar/utils/fonts.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

class UpcomingTestDrive extends StatelessWidget {
  final List<CustomerTestDrive> testdrive;
  UpcomingTestDrive({super.key, required this.testdrive});
  final DateFormat formatter = DateFormat('MMMEd');

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        testdrive.isNotEmpty
            ? ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: testdrive.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  List<String> features = [
                    testdrive[index].car.fuel,
                    "${testdrive[index].car.driveKms}km",
                    testdrive[index].car.registrationYear,
                    testdrive[index].car.transmission
                  ];
                  return Container(
                    margin: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: const [
                          BoxShadow(
                            color: Color.fromRGBO(0, 0, 0, 0.25),
                            offset: Offset(5, 5),
                            blurRadius: 20,
                            spreadRadius: 5,
                          ),
                        ]),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(
                              left: 0, right: 8, bottom: 0),
                          height: 104,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5)),
                          child: Row(children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 2.36,
                              height: 100,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(5),
                                child: Image.network(
                                  testdrive[index].car.carImages.isNotEmpty
                                      ? "https://webservice.flikcar.com/public/${testdrive[index].car.carImages[0].imageUrl}"
                                      : "https://developers.google.com/static/maps/documentation/maps-static/images/error-image-generic.png",
                                  fit: BoxFit.fill,
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
                              padding: const EdgeInsets.all(6.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                2.3,
                                        child: Text(
                                          testdrive[index].car.model,
                                          style: AppFonts.w700black16,
                                          maxLines: 1,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    testdrive[index].car.brand,
                                    style: AppFonts.w500dark214,
                                  ),
                                  const SizedBox(height: 5),
                                  Wrap(
                                    spacing: 4,
                                    children: List.generate(
                                      4,
                                      (index) => Container(
                                        width: index == 0 ? 40 : null,
                                        padding: const EdgeInsets.only(
                                            left: 0,
                                            right: 0,
                                            top: 0,
                                            bottom: 0),
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        child: Text(
                                          features[index],
                                          style: AppFonts.w500black10,
                                          maxLines: 1,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    "₹ ${testdrive[index].car.carPrice}",
                                    style: AppFonts.w700black20,
                                  )
                                ],
                              ),
                            )
                          ]),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 15.0, right: 15, bottom: 10),
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 5,
                              ),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.calendar_month,
                                    color: Color(0xff606060),
                                    size: 20,
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    formatter.format(DateTime.parse(
                                        testdrive[index].testDriveDate)),
                                    style: AppFonts.w500dark214,
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width / 1.2,
                                child: PrimaryButton(
                                  backgroundColor: Colors.white,
                                  borderColor: AppColors.p2,
                                  textStyle: AppFonts.w500p215,
                                  title: "Contact Dealer",
                                  function: () async {
                                    FirebaseEvents().customerCallDealer(
                                        customerPhone: "customer",
                                        dealerPhone:
                                            testdrive[index].customerPhone);
                                    FacebookEvents().customerCallDealer(
                                        customerPhone: "customer",
                                        dealerPhone:
                                            testdrive[index].customerPhone);
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
                                                MySnackbar.showSnackBar(context,
                                                    "Unable to open dailer"));
                                      }
                                    }
                                  },
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                })
            : Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 80.0),
                  child: Text(
                    "No test drives to show",
                    style: AppFonts.w700black16,
                  ),
                ),
              ),
      ],
    );
  }
}
