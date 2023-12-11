import 'dart:io';

import 'package:flikcar/common_widgets/heading1.dart';
import 'package:flikcar/screens/onbording_screens/dealer_onboarding/upload_documents/widgets/document_textField.dart';
import 'package:flikcar/screens/onbording_screens/dealer_onboarding/upload_documents/widgets/upload_image.dart';
import 'package:flikcar/services/upload_dealer_documents_provider.dart';
import 'package:flikcar/utils/fonts.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UdyogAadhar extends StatelessWidget {
  UdyogAadhar({super.key});
  String panPath = "";
  final TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    panPath = context.watch<UploadDealerDocumentsProvider>().udyogAadharPath;

    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        children: [
          const Heading1(title1: "Udyog Aadhar Details", title2: ""),
          const SizedBox(
            height: 15,
          ),
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
                    title: "Udyog Aadhar Number (optional)",
                    controller: controller,
                    keyboard: TextInputType.text,
                    hint: "Eg. INKPS2134U",
                    max: 12,
                    validator: false,
                    onChanged: (value) {
                      Provider.of<UploadDealerDocumentsProvider>(context,
                              listen: false)
                          .getDocumentNumber(
                              documentNumber: controller.text,
                              documentType: "udyogAadhar");
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    "Udyog Aadhar (optional)",
                    style: AppFonts.w700black16,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      //pickFile(context: context);
                      Provider.of<UploadDealerDocumentsProvider>(context,
                              listen: false)
                          .pickFile(context: context, imageType: "udyogAadhar");
                    },
                    child: panPath == ""
                        ? const UploadImage()
                        : SizedBox(
                            height: 136,
                            width: 136,
                            child: Image.network(
                              panPath,
                              fit: BoxFit.cover,
                              width: double.infinity,
                            ),
                          ),
                  ),
                ],
              )),
          const SizedBox(
            height: 30,
          ),
          Container(
            height: 100,
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
                              "Photo must be clear with readable details",
                              style: AppFonts.w500black14,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
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
                      //         "PAN must have your signature otherwise it is considered invalid",
                      //         style: AppFonts.w500black14,
                      //       ),
                      //     ),
                      //   ],
                      // ),
                      // const SizedBox(
                      //   height: 10,
                      // ),
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
                      //         "If you are Partnership or Company, please upload Partnership or Company PAN Card",
                      //         style: AppFonts.w500black14,
                      //       ),
                      //     ),
                      //   ],
                      // ),
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
}
