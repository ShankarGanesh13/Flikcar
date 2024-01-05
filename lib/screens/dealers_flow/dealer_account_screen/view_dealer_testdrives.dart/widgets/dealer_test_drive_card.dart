import 'package:flikcar/common_widgets/loading_widget.dart';
import 'package:flikcar/common_widgets/primary_button.dart';
import 'package:flikcar/common_widgets/snackbar.dart';
import 'package:flikcar/firebase_models/firebase_buyer_car.dart';
import 'package:flikcar/firebase_models/firebase_testdrive.dart';
import 'package:flikcar/screens/buy_car_flow/car_detailed_view/car_detailed_view.dart';
import 'package:flikcar/services/get_car_details.dart';
import 'package:flikcar/utils/colors.dart';
import 'package:flikcar/utils/fonts.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

class DealerTestDriveCard extends StatelessWidget {
  final FirebaseTestDrive testdrive;
  DealerTestDriveCard({super.key, required this.testdrive});
  final DateFormat formatter = DateFormat('MMMEd');

  @override
  Widget build(BuildContext context) {
    List<String> features = [
      testdrive.carDetails.fuelType,
      "${testdrive.carDetails.kmsDriven} kms",
      "${testdrive.carDetails.registrationYear}",
      testdrive.carDetails.transmission,
      testdrive.carDetails.ownerType,
    ];
    return GestureDetector(
      onTap: () {
        // Navigator.push(
        //     context,
        //     MaterialPageRoute(
        //       builder: (context) => FutureBuilder<FirebaseBuyerCar?>(
        //           future: GetCarDetails()
        //               .getCarById(carId: testdrive.carDetails.id),
        //           builder: (context, snapshot) {
        //             return CarDetailedView(car: snapshot.data);
        //           }),
        //     ));
      },
      child: Container(
        height: 321,
        margin: const EdgeInsets.only(right: 15, bottom: 20, top: 15, left: 15),
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
              height: 185,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
                child: Image.network(
                  testdrive.carDetails.imagePath,
                  fit: BoxFit.fill,
                  width: MediaQuery.of(context).size.width,
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
              padding: const EdgeInsets.only(left: 12.0, right: 10, top: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 160,
                        child: Text(testdrive.carDetails.brand,
                            style: AppFonts.w500dark214),
                      ),
                      const Spacer(),
                      Text(
                        testdrive.carDetails.price != null
                            ? "₹ ${testdrive.carDetails.price}"
                            : "",
                        style: AppFonts.w700s116,
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Text(
                        "${testdrive.carDetails.model} ${testdrive.carDetails.variant}",
                        maxLines: 1,
                        style: AppFonts.w700s140),
                  ),
                  const SizedBox(height: 4),
                  Wrap(
                    spacing: 6,
                    children: List.generate(
                      5,
                      (index) => Container(
                        width: index == 0 ? 48 : null,
                        padding: const EdgeInsets.only(
                            left: 0, right: 2, top: 5, bottom: 0),
                        decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(20)),
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
                        formatter.format(DateTime.fromMillisecondsSinceEpoch(
                            testdrive.date)),
                        style: AppFonts.w500s114,
                      ),
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 10.0,
                        ),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 160,
                              height: 35,
                              child: PrimaryButton(
                                title: "Contact Customer",
                                function: () async {
                                  Uri phoneno = Uri(
                                    scheme: 'tel',
                                    path: '+91${testdrive.dealerDetails.phone}',
                                  );
                                  if (await launchUrl(phoneno)) {
                                  } else {
                                    if (context.mounted) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(MySnackbar.showSnackBar(
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
                          ],
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}