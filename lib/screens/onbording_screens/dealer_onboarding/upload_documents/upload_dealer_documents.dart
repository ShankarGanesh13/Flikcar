import 'package:flikcar/common_widgets/custom_appbar.dart';
import 'package:flikcar/common_widgets/primary_button.dart';
import 'package:flikcar/common_widgets/secondary_button.dart';
import 'package:flikcar/screens/dealers_flow/dealer_flow.dart';
import 'package:flikcar/screens/dealers_flow/auction_screens/dealer_auction_home_screen/dealer_auction_home_screen.dart';
import 'package:flikcar/screens/onbording_screens/dealer_onboarding/terms_and_condition.dart';
import 'package:flikcar/screens/onbording_screens/dealer_onboarding/upload_documents/widgets/address_details.dart';
import 'package:flikcar/screens/onbording_screens/dealer_onboarding/upload_documents/widgets/cancelled_cheque.dart';
import 'package:flikcar/screens/onbording_screens/dealer_onboarding/upload_documents/widgets/dealership_details.dart';
import 'package:flikcar/screens/onbording_screens/dealer_onboarding/upload_documents/widgets/selfie.dart';
import 'package:flikcar/screens/onbording_screens/dealer_onboarding/upload_documents/widgets/trade_licence.dart';
import 'package:flikcar/screens/onbording_screens/dealer_onboarding/upload_documents/widgets/udyog%20_aadhar.dart';
import 'package:flikcar/services/upload_dealer_documents_provider.dart';
import 'package:flikcar/utils/fonts.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'widgets/pan_details.dart';

class UploadDealerDocuments extends StatefulWidget {
  const UploadDealerDocuments({super.key});
  static List<String> documentTitle = [
    "PAN Card",
    "Address Proof",
    "Trade Licence",
    "Dealership Details",
    "Cancelled Cheque",
    "Uddyog Aadhar",
  ];

  @override
  State<UploadDealerDocuments> createState() => _UploadDealerDocumentsState();
}

class _UploadDealerDocumentsState extends State<UploadDealerDocuments> {
//  int selectedIndex = 0;
  double width = 100;
  final scrollController = ScrollController();
  void scrollToIndex(index) {
    scrollController.animateTo(width * (index + 0.5),
        duration: const Duration(milliseconds: 100), curve: Curves.easeIn);
  }

  List<Widget> documentSteps = [
    PanDetails(),
    AddressDetails(),
    TradeLicence(),
    const DealershipDetails(),
    CancelledCheque(),
    UdyogAadhar()
  ];
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    int selectedIndex =
        context.watch<UploadDealerDocumentsProvider>().selectedIndex;
    return Scaffold(
        appBar: CustomAppBar.getDealerOnboardingAppBar(
            context: context, title: "Upload Required Documents"),
        bottomNavigationBar: SafeArea(
            child: Container(
          padding: const EdgeInsets.all(15.0),
          decoration: BoxDecoration(color: Colors.white),
          child: selectedIndex == 0
              ? PrimaryButton(
                  title: "Next",
                  function: () {
                    if (formKey.currentState!.validate()) {
                      if (selectedIndex < 5) {
                        Provider.of<UploadDealerDocumentsProvider>(context,
                                listen: false)
                            .validateImages(
                                index: selectedIndex, context: context);
                        // selectedIndex++;
                        // setState(() {});
                      } else {
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //       builder: (context) => const TermsAndCondition(),
                        //     ));
                        Provider.of<UploadDealerDocumentsProvider>(context,
                                listen: false)
                            .validateForm(context);
                      }
                    }
                  },
                  borderColor: Colors.white,
                  backgroundColor: const Color(0xff161F31),
                  textStyle: AppFonts.w500white14)
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 2.35,
                        child: PrimaryButton(
                            borderColor: Colors.white,
                            backgroundColor: const Color(0xff161F31),
                            textStyle: AppFonts.w500white14,
                            title: "Back",
                            function: () {
                              Provider.of<UploadDealerDocumentsProvider>(
                                      context,
                                      listen: false)
                                  .backSelectedIndex();
                            }),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 2.35,
                        child: PrimaryButton(
                            borderColor: Colors.white,
                            backgroundColor: const Color(0xff161F31),
                            textStyle: AppFonts.w500white14,
                            title: "Next",
                            function: () {
                              if (formKey.currentState!.validate()) {
                                if (selectedIndex < 6) {
                                  Provider.of<UploadDealerDocumentsProvider>(
                                          context,
                                          listen: false)
                                      .validateImages(
                                          index: selectedIndex,
                                          context: context);
                                }
                              }
                              //  setState(() {});
                            }),
                      )
                    ]),
        )),
        body: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(children: [
              documentSteps[selectedIndex],
              const SizedBox(
                height: 20,
              ),
            ]),
          ),
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
}
