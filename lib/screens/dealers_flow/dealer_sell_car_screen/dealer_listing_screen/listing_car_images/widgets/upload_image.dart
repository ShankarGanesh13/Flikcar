import 'package:flikcar/screens/onbording_screens/dealer_onboarding/upload_documents/widgets/upload_image.dart';
import 'package:flikcar/services/dealer_upload_car.dart';
import 'package:flikcar/utils/fonts.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:io';

class UploadImageCard extends StatelessWidget {
  final String title;
  final List<File> images;
  const UploadImageCard({super.key, required this.title, required this.images});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(children: [
        Container(
            height: 205,
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.all(15),
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
                  title,
                  style: AppFonts.w700black16,
                ),
                const SizedBox(
                  height: 10,
                ),
                GestureDetector(
                    onTap: () {
                      Provider.of<DealerUploadCar>(context, listen: false)
                          .pickCarImages(context: context);
                    },
                    child: const UploadImage()),
              ],
            )),
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
    );
  }
}
