import 'package:favorite_button/favorite_button.dart';
import 'package:flikcar/common_widgets/common_car_details.dart';
import 'package:flikcar/common_widgets/primary_button.dart';
import 'package:flikcar/common_widgets/snackbar.dart';
import 'package:flikcar/models/customer_testdrive.dart';
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
        ListView.builder(
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
                      margin:
                          const EdgeInsets.only(left: 0, right: 8, bottom: 0),
                      height: 104,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5)),
                      child: Row(children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 2.35,
                          height: 100,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(5),
                            child: Image.network(
                              testdrive[index].car.carImages.isNotEmpty
                                  ? "https://webservice.flikcar.com:8000/public/${testdrive[index].car.carImages[0]}"
                                  : "https://developers.google.com/static/maps/documentation/maps-static/images/error-image-generic.png",
                              fit: BoxFit.fill,
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
                                        MediaQuery.of(context).size.width / 2.3,
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
                                spacing: 6,
                                children: List.generate(
                                  4,
                                  (index) => Container(
                                    width: index == 0 ? 42 : null,
                                    padding: const EdgeInsets.only(
                                        left: 0, right: 0, top: 0, bottom: 0),
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
                                Uri phoneno = Uri(
                                  scheme: 'tel',
                                  path: '+91${testdrive[index].customerPhone}',
                                );
                                if (await launchUrl(phoneno)) {
                                } else {
                                  if (context.mounted) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        MySnackbar.showSnackBar(
                                            context, "Unable to open dailer"));
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
            }),
      ],
    );
  }
}
