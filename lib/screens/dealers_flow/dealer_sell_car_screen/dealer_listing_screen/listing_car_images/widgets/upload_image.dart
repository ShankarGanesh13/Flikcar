import 'package:flikcar/screens/onbording_screens/dealer_onboarding/upload_documents/widgets/upload_image.dart';
import 'package:flikcar/services/dealer_upload_car.dart';
import 'package:flikcar/utils/colors.dart';
import 'package:flikcar/utils/fonts.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:io';

class UploadImageCard extends StatelessWidget {
  final String title;
  final String title2;
  final String type;
  final List<File> images;
  final Function() function;
  const UploadImageCard(
      {super.key,
      required this.title,
      required this.title2,
      required this.type,
      required this.images,
      required this.function});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0, right: 10, bottom: 15),
      child: Container(
          height: 185,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: const [
                BoxShadow(
                    color: Color.fromRGBO(190, 190, 190, 0.239),
                    spreadRadius: 10,
                    blurRadius: 10,
                    offset: Offset(5, 5)),
              ],
              borderRadius: BorderRadius.circular(10)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    title,
                    style: AppFonts.w700black16,
                  ),
                  Text(
                    " $title2",
                    style: AppFonts.w500black14,
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    SizedBox(
                      height: 123,
                      width: 120,
                      child: GestureDetector(
                          onTap: () {
                            function();
                            // Provider.of<DealerUploadCar>(context, listen: false)
                            //     .pickCarImages(context: context);
                          },
                          child: const UploadImage()),
                    ),
                    Row(
                      children: List.generate(
                        images.length,
                        (index) => Container(
                          margin: const EdgeInsets.only(left: 10),
                          height: 128,
                          width: MediaQuery.of(context).size.width / 2.1,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: AppColors.grey, width: 0.5)),
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
                                              type: type,
                                              image: images[index]);
                                    },
                                    child: const Icon(
                                      Icons.close,
                                      size: 16,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 109,
                                width: MediaQuery.of(context).size.width / 2.1,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(5),
                                  child: Image.file(
                                    images[index],
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
