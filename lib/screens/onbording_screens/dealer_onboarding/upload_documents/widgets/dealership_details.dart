import 'dart:io';
import 'package:flikcar/screens/onbording_screens/dealer_onboarding/upload_documents/widgets/upload_image.dart';
import 'package:flikcar/services/upload_dealer_documents_provider.dart';
import 'package:flikcar/utils/fonts.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DealershipDetails extends StatefulWidget {
  const DealershipDetails({super.key});

  @override
  State<DealershipDetails> createState() => _DealershipDetailsState();
}

class _DealershipDetailsState extends State<DealershipDetails> {
  List<String> proof = ["Shop Photo", "Visiting Card"];
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    String dealershipProof =
        context.watch<UploadDealerDocumentsProvider>().dealershipImagePath;
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        children: [
          Container(
              height: 241,
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
                    "Shop Photo (required)*",
                    style: AppFonts.w700black16,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Front",
                        style: AppFonts.w500black14,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      GestureDetector(
                          onTap: () {
                            Provider.of<UploadDealerDocumentsProvider>(context,
                                    listen: false)
                                .pickFile(
                                    context: context,
                                    imageType: "dealershipImage");
                          },
                          child: dealershipProof == ""
                              ? const UploadImage()
                              : SizedBox(
                                  height: 136,
                                  width: 136,
                                  child: Image.file(
                                    File(dealershipProof),
                                    fit: BoxFit.cover,
                                    width: double.infinity,
                                  ),
                                )),
                    ],
                  ),
                ],
              )),
          Container(
            height: 120,
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.only(top: 30),
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
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
                      // Row(
                      //   crossAxisAlignment: CrossAxisAlignment.start,
                      //   children: [
                      //     Text(
                      //       "\u2022",
                      //       style: AppFonts.w700black16,
                      //     ),
                      //     const SizedBox(
                      //       width: 5,
                      //     ),
                      //     SizedBox(
                      //       width: MediaQuery.of(context).size.width / 1.35,
                      //       child: Text(
                      //         "Visiting Card should have dealer & dealership name clearly visible",
                      //         style: AppFonts.w500black14,
                      //       ),
                      //     ),
                      //   ],
                      // ),
                      // const SizedBox(
                      //   height: 10,
                      // ),
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
                            width: MediaQuery.of(context).size.width / 1.35,
                            child: Text(
                              "Front Shop photo should clearly show the dealership name",
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
          )
        ],
      ),
    );
  }

  Widget selectDealerProof({required String title, required int index}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      child: Row(
        children: [
          Container(
            height: 18,
            width: 18,
            padding: const EdgeInsets.all(2),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(9),
                border: Border.all(
                    color: selectedIndex == index
                        ? const Color(0xffFF7A00)
                        : const Color(0xff171717),
                    width: 2)),
            child: CircleAvatar(
                backgroundColor: selectedIndex == index
                    ? const Color(0xffFF7A00)
                    : Colors.transparent),
          ),
          const SizedBox(width: 10),
          Text(
            title,
            style: AppFonts.w500black14,
          )
        ],
      ),
    );
  }
}
