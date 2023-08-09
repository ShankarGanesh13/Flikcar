import 'dart:io';

import 'package:flikcar/common_widgets/custom_appbar.dart';
import 'package:flikcar/common_widgets/primary_button.dart';
import 'package:flikcar/common_widgets/snackbar.dart';
import 'package:flikcar/screens/dealers_flow/dealer_flow.dart';
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
    List<File> images = context.watch<DealerUploadCar>().fileToDisplay;
    return Scaffold(
      appBar: CustomAppBar.getAppBar(),
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
                if (images.length < 5) {
                  ScaffoldMessenger.of(context).showSnackBar(
                      MySnackbar.showSnackBar(
                          context, "Please upload atleast 5 images"));
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
                    Spacer(),
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
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(children: [
                Container(
                    height: 205,
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: const [
                          BoxShadow(
                              color: Color.fromRGBO(190, 190, 190, 0.239),
                              spreadRadius: 15,
                              blurRadius: 10,
                              offset: Offset(5, 5)),
                        ],
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Select Car Images",
                          style: AppFonts.w700black16,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        GestureDetector(
                            onTap: () {
                              Provider.of<DealerUploadCar>(context,
                                      listen: false)
                                  .pickCarImages(context: context);
                            },
                            child: const UploadImage()),
                      ],
                    )),
                Container(
                  height: 124,
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.all(15),
                  margin: const EdgeInsets.only(top: 30),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                            color: Color.fromRGBO(190, 190, 190, 0.239),
                            spreadRadius: 15,
                            blurRadius: 10,
                            offset: Offset(5, 5)),
                      ],
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Please Note:",
                          style: AppFonts.w700black16,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            const SizedBox(width: 20),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "\u2022",
                                      style: AppFonts.w700black16,
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width /
                                          1.4,
                                      child: Text(
                                        "Upload car images from all sides",
                                        style: AppFonts.w500black14,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "\u2022",
                                      style: AppFonts.w700black16,
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width /
                                          1.4,
                                      child: Text(
                                        "Add car interior images for better reach",
                                        style: AppFonts.w500black14,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                              ],
                            )
                          ],
                        )
                      ]),
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: const [
                      BoxShadow(
                          color: Color.fromRGBO(190, 190, 190, 0.239),
                          spreadRadius: 15,
                          blurRadius: 10,
                          offset: Offset(5, 5)),
                    ],
                  ),
                  child: Column(
                      children: List.generate(
                          images.length,
                          (index) => Container(
                              margin: EdgeInsets.only(bottom: 20),
                              height: 220,
                              width: MediaQuery.of(context).size.width,
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      const Spacer(),
                                      GestureDetector(
                                        onTap: () {
                                          Provider.of<DealerUploadCar>(context,
                                                  listen: false)
                                              .removeImage(
                                                  context: context,
                                                  image: images[index]);
                                        },
                                        child: const Icon(
                                          Icons.close,
                                          size: 20,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 200,
                                    width: MediaQuery.of(context).size.width,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(5),
                                      child: Image.file(
                                        images[index],
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                ],
                              )))),
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
