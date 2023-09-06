import 'dart:io';

import 'package:flikcar/common_widgets/custom_appbar.dart';
import 'package:flikcar/common_widgets/primary_button.dart';
import 'package:flikcar/common_widgets/snackbar.dart';
import 'package:flikcar/screens/dealers_flow/dealer_flow.dart';
import 'package:flikcar/screens/dealers_flow/dealer_sell_car_screen/dealer_listing_screen/listing_car_images/widgets/upload_image.dart';
import 'package:flikcar/screens/onbording_screens/dealer_onboarding/upload_documents/widgets/upload_image.dart';
import 'package:flikcar/services/dealer_upload_car.dart';
import 'package:flikcar/utils/colors.dart';
import 'package:flikcar/utils/fonts.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListingCarImages extends StatelessWidget {
  const ListingCarImages({super.key});

  @override
  Widget build(BuildContext context) {
    List<File> interiorImages =
        context.watch<DealerUploadCar>().interiorFileToDisplay;
    List<File> exteriorImages =
        context.watch<DealerUploadCar>().exteriorFileToDisplay;
    List<File> tyreImages = context.watch<DealerUploadCar>().tyreToDisplay;
    List<File> engineImages =
        context.watch<DealerUploadCar>().engineFileToDisplay;
    List<File> dentImages = context.watch<DealerUploadCar>().dentsFileToDisplay;
    List<File> thumbnailImages =
        context.watch<DealerUploadCar>().thumbnailFileToDisplay;
    List<File> otherImages =
        context.watch<DealerUploadCar>().otherFileToDisplay;

    return Scaffold(
      appBar: CustomAppBar.getAppBar(
        function: () {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => const DealerFlow(
                index: 0,
              ),
            ),
            (route) => false,
          );
        },
      ),
      bottomNavigationBar: SafeArea(
        child: Container(
          height: 55,
          width: MediaQuery.of(context).size.width,
          padding:
              const EdgeInsets.only(left: 15, right: 15, bottom: 10, top: 8),
          decoration: const BoxDecoration(color: Colors.white, boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.25),
              offset: Offset(0, -10),
              blurRadius: 18,
            )
          ]),
          child: PrimaryButton(
              backgroundColor: AppColors.s1,
              borderColor: Colors.transparent,
              function: () {
                if (interiorImages.isEmpty ||
                    exteriorImages.isEmpty ||
                    otherImages.isEmpty ||
                    tyreImages.isEmpty ||
                    engineImages.isEmpty ||
                    thumbnailImages.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                      MySnackbar.showSnackBar(
                          context, "Please upload all the required images"));
                } else {
                  Provider.of<DealerUploadCar>(context, listen: false)
                      .uploadCar(context);
                }
              },
              textStyle: AppFonts.w500white14,
              title: "Upload Car"),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                height: 50,
                padding: const EdgeInsets.all(15),
                width: MediaQuery.of(context).size.width,
                color: const Color.fromARGB(255, 241, 255, 249),
                child: Row(
                  children: [
                    GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(Icons.chevron_left, color: AppColors.p2)),
                    const SizedBox(width: 8),
                    Text(
                      "Upload Car Images",
                      style: AppFonts.w700black16,
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        showDialog<String>(
                          context: context,
                          builder: (BuildContext context) => AlertDialog(
                            title: const Text('Cancel car upload'),
                            content: const Text(
                                'This step cannot be undone, click ok to continue'),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () =>
                                    Navigator.pop(context, 'Cancel'),
                                child: const Text('Close'),
                              ),
                              TextButton(
                                onPressed: () => Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const DealerFlow(index: 1)),
                                  (route) => false,
                                ),
                                child: const Text('OK'),
                              ),
                            ],
                          ),
                        );
                      },
                      child: Text(
                        "Cancel",
                        style: AppFonts.w500black12,
                      ),
                    )
                  ],
                )),
            const SizedBox(
              height: 30,
            ),
            UploadImageCard(
              title: "Thumbnail Image*",
              images: thumbnailImages,
              title2: "(Upto 1 image)",
              type: "thumbnail",
              function: () {
                Provider.of<DealerUploadCar>(context, listen: false)
                    .pickCarImages(context: context, type: "thumbnail");
              },
            ),
            UploadImageCard(
              title: "Interior Images*",
              images: interiorImages,
              type: "interior",
              title2: "(Upto 15 images)",
              function: () {
                Provider.of<DealerUploadCar>(context, listen: false)
                    .pickCarImages(context: context, type: "interior");
              },
            ),
            UploadImageCard(
              title: "Exterior Images*",
              images: exteriorImages,
              type: "exterior",
              title2: "(Upto 15 images)",
              function: () {
                Provider.of<DealerUploadCar>(context, listen: false)
                    .pickCarImages(context: context, type: "exterior");
              },
            ),
            UploadImageCard(
              title: "Engine Images*",
              images: engineImages,
              type: "engine",
              title2: "(Upto 15 images)",
              function: () {
                Provider.of<DealerUploadCar>(context, listen: false)
                    .pickCarImages(context: context, type: "engine");
              },
            ),
            UploadImageCard(
              title: "Tyres Images*",
              images: tyreImages,
              type: "tyres",
              title2: "(Upto 15 images)",
              function: () {
                Provider.of<DealerUploadCar>(context, listen: false)
                    .pickCarImages(context: context, type: "tyres");
              },
            ),
            UploadImageCard(
              title: "Other Images*",
              images: otherImages,
              type: "others",
              title2: "(Upto 15 images)",
              function: () {
                Provider.of<DealerUploadCar>(context, listen: false)
                    .pickCarImages(context: context, type: "others");
              },
            ),
            UploadImageCard(
              title: "Dents Images",
              images: dentImages,
              type: "dents",
              title2: "(Optional Upto 15 images)",
              function: () {
                Provider.of<DealerUploadCar>(context, listen: false)
                    .pickCarImages(context: context, type: "dents");
              },
            )
          ],
        ),
      ),
    );
  }
}
