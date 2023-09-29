import 'package:file_picker/file_picker.dart';
import 'package:flikcar/screens/onbording_screens/dealer_onboarding/upload_documents/upload_dealer_documents.dart';
import 'package:flikcar/screens/onbording_screens/dealer_onboarding/upload_documents/widgets/document_textField.dart';
import 'package:flikcar/screens/onbording_screens/dealer_onboarding/upload_documents/widgets/upload_image.dart';
import 'package:flikcar/services/upload_dealer_documents_provider.dart';
import 'package:flikcar/utils/fonts.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:provider/provider.dart';

class CancelledCheque extends StatelessWidget {
  CancelledCheque({super.key});
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    String panPath =
        context.watch<UploadDealerDocumentsProvider>().cancelChequePath;

    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        children: [
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
                    keyboard: TextInputType.number,
                    title: "Cheque Number*",
                    controller: controller,
                    hint: "Eg. 984512823",
                    max: 14,
                    validator: true,
                    onChanged: (value) {
                      Provider.of<UploadDealerDocumentsProvider>(context,
                              listen: false)
                          .getDocumentNumber(
                              documentNumber: controller.text,
                              documentType: "cancelledCheque");
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    "Cancelled Cheque (required)*",
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
                          .pickFile(
                              context: context, imageType: "cancelledCheque");
                    },
                    child: panPath == ""
                        ? const UploadImage()
                        : SizedBox(
                            height: 136,
                            width: 136,
                            child: Image.file(
                              File(panPath),
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
            height: 150,
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
                              "Signature on cheques should be clearly visible",
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
