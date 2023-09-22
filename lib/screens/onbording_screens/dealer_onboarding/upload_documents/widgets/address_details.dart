import 'package:flikcar/screens/onbording_screens/dealer_onboarding/upload_documents/upload_dealer_documents.dart';
import 'package:flikcar/screens/onbording_screens/dealer_onboarding/upload_documents/widgets/document_textField.dart';
import 'package:flikcar/screens/onbording_screens/dealer_onboarding/upload_documents/widgets/upload_image.dart';
import 'package:flikcar/services/upload_dealer_documents_provider.dart';
import 'package:flikcar/utils/fonts.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:io';

class AddressDetails extends StatelessWidget {
  AddressDetails({super.key});
  static List<String> addressProof = [
    "Aadhar Card",
    "Driving Licence",
    "Votercard"
  ];

  int selectedIndex = 0;

  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    String addressFront =
        context.watch<UploadDealerDocumentsProvider>().addressFrontImagePath;
    String addressBack =
        context.watch<UploadDealerDocumentsProvider>().addressBAckImagePath;
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        children: [
          // Container(
          //     height: 180,
          //     width: MediaQuery.of(context).size.width,
          //     margin: const EdgeInsets.only(bottom: 30),
          //     padding: const EdgeInsets.all(15),
          //     decoration: BoxDecoration(
          //         color: Colors.white,
          //         boxShadow: const [
          //           BoxShadow(
          //               color: Color.fromRGBO(190, 190, 190, 0.239),
          //               spreadRadius: 15,
          //               blurRadius: 10,
          //               offset: Offset(5, 5)),
          //         ],
          //         borderRadius: BorderRadius.circular(10)),
          //     child: Column(
          //         crossAxisAlignment: CrossAxisAlignment.start,
          //         children: [
          //           Text(
          //             "Select Address Proof",
          //             style: AppFonts.w700black16,
          //           ),
          //           const SizedBox(height: 20),
          //           ListView.builder(
          //               physics: NeverScrollableScrollPhysics(),
          //               shrinkWrap: true,
          //               itemCount: 3,
          //               itemBuilder: (context, index) {
          //                 return GestureDetector(
          //                   onTap: () {
          //                     setState(() {
          //                       selectedIndex = index;
          //                     });
          //                   },
          //                   child: selectAddressProof(
          //                       title: AddressDetails.addressProof[index],
          //                       index: index),
          //                 );
          //               })
          //         ])),
          Container(
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
                  DocumentTextfield(
                    title: "Document Number*",
                    controller: controller,
                    validator: true,
                    hint: "Eg. 999444888555",
                    max: 12,
                    onChanged: (value) {
                      Provider.of<UploadDealerDocumentsProvider>(context,
                              listen: false)
                          .getDocumentNumber(
                              documentNumber: controller.text,
                              documentType: "address");
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    "Address Proof*",
                    style: AppFonts.w700black16,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
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
                                Provider.of<UploadDealerDocumentsProvider>(
                                        context,
                                        listen: false)
                                    .pickFile(
                                        context: context,
                                        imageType: "addressFront");
                              },
                              child: addressFront == ""
                                  ? const UploadImage()
                                  : SizedBox(
                                      height: 136,
                                      width: 136,
                                      child: Image.file(
                                        File(addressFront),
                                        fit: BoxFit.cover,
                                        width: double.infinity,
                                      ),
                                    )),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Back",
                            style: AppFonts.w500black14,
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          GestureDetector(
                              onTap: () {
                                Provider.of<UploadDealerDocumentsProvider>(
                                        context,
                                        listen: false)
                                    .pickFile(
                                        context: context,
                                        imageType: "addressBack");
                              },
                              child: addressBack == ""
                                  ? const UploadImage()
                                  : SizedBox(
                                      height: 136,
                                      width: 136,
                                      child: Image.file(
                                        File(addressBack),
                                        fit: BoxFit.cover,
                                        width: double.infinity,
                                      ),
                                    )),
                        ],
                      ),
                    ],
                  ),
                ],
              )),
          Container(
            height: 189,
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
                              "Address Proof should be clearly visible",
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
                            width: MediaQuery.of(context).size.width / 1.35,
                            child: Text(
                              "Upload both sides (front + back)",
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
                            width: MediaQuery.of(context).size.width / 1.35,
                            child: Text(
                              "You can use upload your Aadhar Card, Driving License, Passport or Voter Id as the address proof",
                              style: AppFonts.w500black14,
                            ),
                          ),
                        ],
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

  Widget selectAddressProof({required String title, required int index}) {
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
