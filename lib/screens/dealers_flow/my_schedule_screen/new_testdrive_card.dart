import 'package:favorite_button/favorite_button.dart';
import 'package:flikcar/common_widgets/primary_button.dart';
import 'package:flikcar/common_widgets/snackbar.dart';
import 'package:flikcar/models/dealer_testdrive.dart';
import 'package:flikcar/screens/dealers_flow/auction_screens/dealer_car_detail_screen/dealer_car_detail_screen.dart';
import 'package:flikcar/utils/fonts.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

class NewTestDriveCard extends StatelessWidget {
  final DealerTestDrive testDrive;
  NewTestDriveCard({super.key, required this.testDrive});
  static List<String> features = ["Petrol", "13000kms", "2014", "Manual"];
  final DateFormat formatter = DateFormat('MMMd');

  @override
  Widget build(BuildContext context) {
    features = [
      testDrive.car.fuel,
      "${testDrive.car.driveKms}km",
      testDrive.car.registrationYear,
      testDrive.car.transmission,
      testDrive.car.ownertype,
    ];
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => DealerCarDetailScreen()));
      },
      child: Container(
        height: 400,
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.only(right: 0, bottom: 30, top: 5, left: 0),
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.25),
              offset: Offset(2, 12),
              blurRadius: 18,
              spreadRadius: -8,
            ),
          ],
          color: const Color(0xffF2F2F2),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 181,
                child: Image.network(
                  testDrive.car.carImages.isNotEmpty
                      ? "http://webservice.flikcar.com:8000/public/${testDrive.car.carImages[0]}"
                      : "https://developers.google.com/static/maps/documentation/maps-static/images/error-image-generic.png",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 30,
                    child: Row(
                      children: [
                        SizedBox(
                            width: MediaQuery.of(context).size.width / 2,
                            child: Text(
                              testDrive.car.model,
                              style: AppFonts.w700s116,
                              maxLines: 1,
                            )),
                        const Spacer(),
                        SizedBox(
                          width: 130,
                          height: 30,
                          child: PrimaryButton(
                            title: "Contact Customer",
                            function: () async {
                              Uri phoneno = Uri(
                                scheme: 'tel',
                                path: '+91${testDrive.customerPhone}',
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
                            borderColor: Colors.black,
                            textStyle: AppFonts.w500black12,
                            backgroundColor: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(testDrive.car.brand, style: AppFonts.w500dark214),
                  const SizedBox(height: 6),
                  Wrap(
                    spacing: 5,
                    children: List.generate(
                      5,
                      (index) => Container(
                        width: index == 0 ? 45 : null,
                        padding: const EdgeInsets.only(
                            left: 0, right: 7, top: 3, bottom: 0),
                        decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(0)),
                        child: Text(
                          features[index],
                          maxLines: 1,
                          style: AppFonts.w500black12,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        "₹${testDrive.car.carPrice}",
                        style: AppFonts.w700black20,
                      ),
                      Spacer(),
                      Text(
                        "Date - ${formatter.format(DateTime.parse(testDrive.testDriveDate))}",
                        style: AppFonts.w700black14,
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 15),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Customer Details",
                        style: AppFonts.w700black16,
                      ),
                      const SizedBox(height: 5),
                      Row(
                        children: [
                          Text(
                            "Name - ",
                            style: AppFonts.w700black14,
                          ),
                          Text(
                            testDrive.customerName,
                            style: AppFonts.w500black14,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            "Phone - ",
                            style: AppFonts.w700black14,
                          ),
                          Text(
                            testDrive.customerPhone,
                            style: AppFonts.w500black14,
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
