import 'package:flikcar/common_widgets/custom_appbar.dart';
import 'package:flikcar/common_widgets/heading1.dart';
import 'package:flikcar/common_widgets/primary_button.dart';
import 'package:flikcar/services/upload_dealer_documents_provider.dart';
import 'package:flikcar/utils/colors.dart';
import 'package:flikcar/utils/fonts.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TermsAndCondition extends StatefulWidget {
  const TermsAndCondition({super.key});

  @override
  State<TermsAndCondition> createState() => _TermsAndConditionState();
}

class _TermsAndConditionState extends State<TermsAndCondition> {
  bool terms = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.getDealerOnboardingAppBar(title: ""),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                const Heading1(title1: "Terms and Condition", title2: ""),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "Flikcar (the “Company”, “we”, “us” or “our”) owns and operates a website i.e. https://flikcar.com/including its mobile applications and Google assistant bot (the “Website”) that allows users to sell pre-owned cars. These terms and conditions (“Terms”) shall govern the use or access to the Website and Services (as defined below).These Terms constitute a binding and enforceable legal contract between the Company and the user of the website (“you, your or user”).\n\nCapitalised terms, unless defined herein, shall have the meaning ascribed to them under the Privacy Policy.\n\nNo information provided on the Website shall be considered a substitute for your independent investigation. These Terms are collectively an electronic record for the purpose of the Information Technology Act, 2000 (“IT Act”) and the rules made thereunder. These Terms do not require any digital or electronic signature. You must not modify the paper or digital copies of any materials you have printed, or downloaded from, our Websites in any way, and you must not use any illustrations, photographs, video or audio sequences or any graphics separately from any accompanying text.\n\nBy using our Website, you confirm that you accept these Terms and that you agree to comply with them. If you do not agree to the Terms, you must not access this Website",
                  style: AppFonts.w500dark214,
                  textAlign: TextAlign.justify,
                ),
                const SizedBox(
                  height: 25,
                ),
                const Heading1(
                    title1: "Disclaimers and Warranties", title2: ""),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "a. The use of the Services is at your sole risk.\nb. To the extent permitted by applicable law, the Services are provided on an “as is” and “as available” basis. The Company does not warrant that operation of the Services will be uninterrupted or error free or that the functions contained in the Services will meet your requirements.\nc. To the fullest extent permissible under applicable law, the Company expressly disclaims all warranties of any kind, express or implied, arising out of the Services, including warranties of merchantability, fitness for a particular purpose, satisfactory quality, accuracy, title and non-infringement, compatibility, applicability, usability, appropriateness, and any warranty that may arise out of course of performance, course of dealing, or usage of trade.\nd. You hereby accept full responsibility for any consequences that may arise from your use of the Services, and expressly agree and acknowledge that the Company shall have absolutely no liability with respect to the same.\ne. To the fullest extent permissible by law, the Company, its affiliates, and its related parties each disclaim all liability to you for any loss or damage arising out of or due to:\ni. Your use of or inability to use, or availability or unavailability of the Services, including any Third Party Services;\nii. the occurrence or existence of any defect, interruption, or delays in the operation or transmission of information to, from, or through the Services, communications failure, theft, destruction or unauthorised access to the Company's records, programs, services, server, or other infrastructure relating to the Services; or\niii. The failure of the Services to remain operational for any period of time.\nf. Notwithstanding anything to the contrary contained herein, neither the Company nor any of its affiliates or related parties shall have any liability to you or any third party for any indirect, incidental, special or consequential damages or any loss of revenue or profits arising under, directly or indirectly, or relating, in any manner whatsoever, to these Terms or the Services. To the maximum extent permitted by law, you agree to waive, release, discharge, and hold harmless the Company, its affiliated and subsidiary companies, its parent companies, and each of their directors, officers, employees, and agents, from any and all claims, losses, damages, liabilities, expenses and causes of action arising out of the Services.",
                  style: AppFonts.w500dark214,
                  textAlign: TextAlign.justify,
                ),
                const SizedBox(
                  height: 25,
                ),
                const Heading1(title1: "Fees/Charges", title2: ""),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "The Company reserves the right to charge convenience fee for the Services and non-payment may result in denial of Services and/or action under applicable law.",
                  style: AppFonts.w500dark214,
                  textAlign: TextAlign.justify,
                ),
                const SizedBox(
                  height: 25,
                ),
                Row(
                  children: [
                    Checkbox(
                        value: terms,
                        onChanged: (value) {
                          terms = value!;
                          setState(() {});
                        },
                        checkColor: Colors.white,
                        activeColor: AppColors.p2),
                    Text(
                      "I agree to the terms and conditions",
                      style: AppFonts.w500dark214,
                    ),
                  ],
                ),
                PrimaryButton(
                    title: "Agree and Continue",
                    function: () {
                      if (terms == true) {
                        Provider.of<UploadDealerDocumentsProvider>(context,
                                listen: false)
                            .uploadDealerDocuments(context);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            duration: Duration(seconds: 1),
                            backgroundColor: Color(0xFF45C08D),
                            content: Text(
                              "Please accept the terms and condition",
                            ),
                          ),
                        );
                      }
                    },
                    borderColor: Colors.white,
                    backgroundColor: AppColors.s1,
                    textStyle: AppFonts.w500white14)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
