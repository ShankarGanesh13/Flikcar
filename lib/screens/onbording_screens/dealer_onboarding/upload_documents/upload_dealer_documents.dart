import 'package:flikcar/common_widgets/custom_appbar.dart';
import 'package:flikcar/common_widgets/primary_button.dart';
import 'package:flikcar/screens/dealers_flow/dealer_flow.dart';
import 'package:flikcar/screens/dealers_flow/auction_screens/dealer_auction_home_screen/dealer_auction_home_screen.dart';
import 'package:flikcar/screens/onbording_screens/dealer_onboarding/upload_documents/widgets/address_details.dart';
import 'package:flikcar/screens/onbording_screens/dealer_onboarding/upload_documents/widgets/dealership_details.dart';
import 'package:flikcar/screens/onbording_screens/dealer_onboarding/upload_documents/widgets/selfie.dart';
import 'package:flikcar/services/get_car_details.dart';
import 'package:flikcar/utils/fonts.dart';
import 'package:flutter/material.dart';

import 'widgets/pan_details.dart';

class UploadDealerDocuments extends StatefulWidget {
  const UploadDealerDocuments({super.key});
  static List<String> documentTitle = [
    "Pan Card",
    "Address Proof",
    "Dealership Details",
    "Selfie"
  ];

  @override
  State<UploadDealerDocuments> createState() => _UploadDealerDocumentsState();
}

class _UploadDealerDocumentsState extends State<UploadDealerDocuments> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar.getDealerOnboardingAppBar(
            title: "Upload Required Documents"),
        body: SingleChildScrollView(
          child: Column(children: [
            Container(
                height: 49,
                width: MediaQuery.of(context).size.width,
                color: const Color.fromARGB(255, 185, 216, 241),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 4,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedIndex = index;
                        });
                      },
                      child: doucument(
                          title: UploadDealerDocuments.documentTitle[index],
                          context: context,
                          color: selectedIndex == index
                              ? Color(0xff45C08D)
                              : Colors.transparent),
                    );
                  },
                )),
            const SizedBox(
              height: 50,
            ),
            steps(),
            const SizedBox(
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: PrimaryButton(
                  title: selectedIndex == 3 ? "Submit" : "Next",
                  function: () {
                    if (selectedIndex < 3) {
                      selectedIndex++;
                      setState(() {});
                    } else {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const DealerFlow(),
                        ),
                        (route) => false,
                      );
                    }
                  },
                  borderColor: Colors.white,
                  backgroundColor: const Color(0xff161F31),
                  textStyle: AppFonts.w500white14),
            )
          ]),
        ));
  }

  Widget doucument(
      {required String title,
      required BuildContext context,
      required Color color}) {
    return Container(
      margin: const EdgeInsets.only(right: 18),
      padding: const EdgeInsets.only(top: 3, bottom: 3, left: 8, right: 8),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: color,
            width: 5.0,
          ),
        ),
      ),
      //  width: width,
      child: Column(
        children: [
          const SizedBox(
            height: 12,
          ),
          Text(
            title,
            style: AppFonts.w700black16,
          ),
          const Spacer(),
        ],
      ),
    );
  }

  Widget steps() {
    if (selectedIndex == 0) {
      return const PanDetails();
    }
    if (selectedIndex == 1) {
      return const AddressDetails();
    }
    if (selectedIndex == 2) {
      return const DealershipDetails();
    }
    if (selectedIndex == 3) {
      return const Selfie();
    }
    return const SizedBox();
  }
}
