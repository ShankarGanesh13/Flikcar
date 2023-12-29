import 'package:flikcar/common_widgets/custom_appbar.dart';
import 'package:flikcar/common_widgets/heading1.dart';
import 'package:flikcar/common_widgets/primary_button.dart';
import 'package:flikcar/screens/onbording_screens/dealer_onboarding/upload_documents/upload_dealer_documents.dart';
import 'package:flikcar/services/dealer_auth_service.dart';
import 'package:flikcar/services/upload_dealer_documents_provider.dart';
import 'package:flikcar/utils/colors.dart';
import 'package:flikcar/utils/fonts.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DealerDetails extends StatelessWidget {
  DealerDetails({super.key});
  final _formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController shopNameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController gstController = TextEditingController();
  TextEditingController pincodeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
          appBar: CustomAppBar.getDealerOnboardingAppBar(
              context: context, title: "Create Flikcar Dealer Account"),
          body: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 15,
                    ),
                    const Heading1(
                        title1: "You have to be a dealer to",
                        title2: "access this feature"),
                    const SizedBox(
                      height: 20,
                    ),
                    textField(
                        context: context,
                        title: "Name *",
                        hint: "Enter Your Name",
                        minLength: 3,
                        controller: nameController,
                        maxLength: 20),
                    textField(
                        context: context,
                        title: "Email *",
                        hint: "Enter Your Email",
                        minLength: 8,
                        controller: emailController,
                        maxLength: 30),
                    textField(
                        context: context,
                        title: "Shop Name *",
                        hint: "Enter Your Shop Name",
                        minLength: 5,
                        controller: shopNameController,
                        maxLength: 30),
                    textField(
                        context: context,
                        title: "Shop Address *",
                        hint: "Enter Your Shop Address",
                        minLength: 5,
                        controller: addressController,
                        maxLength: 80),
                    textField(
                        context: context,
                        title: "Pincode *",
                        hint: "Enter Your Pincode",
                        minLength: 4,
                        controller: pincodeController,
                        maxLength: 7),
                    textField(
                        context: context,
                        title: "GST number (optional)",
                        controller: gstController,
                        hint: "Enter Your GST number",
                        minLength: 0,
                        maxLength: 20),
                    const SizedBox(
                      height: 30,
                    ),
                    PrimaryButton(
                        title: "Next",
                        function: () {
                          if (_formKey.currentState!.validate()) {
                            Provider.of<UploadDealerDocumentsProvider>(context,
                                    listen: false)
                                .getBasicDetails(
                                    pincod: pincodeController.text,
                                    name: nameController.text,
                                    email: emailController.text,
                                    gstNumber: gstController.text,
                                    address: addressController.text,
                                    shopName: shopNameController.text);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const UploadDealerDocuments(),
                                ));
                          }
                        },
                        borderColor: Colors.transparent,
                        backgroundColor: AppColors.s1,
                        textStyle: AppFonts.w500white14),
                    const SizedBox(
                      height: 50,
                    ),
                    GestureDetector(
                      onTap: () {
                        DealerAuthService.dealerLogout(context);
                      },
                      child: Row(
                        children: [
                          const Spacer(),
                          const Icon(Icons.logout),
                          const SizedBox(
                            width: 4,
                          ),
                          Text(
                            "Logout",
                            style: AppFonts.w500black12,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              ),
            ),
          )),
    );
  }

  Widget textField(
      {required BuildContext context,
      required String title,
      required String hint,
      required TextEditingController controller,
      required int minLength,
      required int maxLength}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppFonts.w700s116,
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: TextFormField(
            controller: controller,
            decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.only(left: 12, right: 12, top: 6, bottom: 6),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              counterText: "",
              counterStyle: const TextStyle(color: Colors.transparent),
              hintText: hint,
            ),
            maxLength: maxLength,
            validator: (value) {
              if (value!.length < minLength) {
                return "Enter a valid data";
              }
              if (title == "Email *") {
                if (!isValidEmail(value)) {
                  return 'Invalid email address';
                }
              }
              return null;
            },
          ),
        ),
        const SizedBox(height: 20)
      ],
    );
  }

  bool isValidEmail(String email) {
    // Regular expression for a valid email pattern
    final RegExp emailRegExp = RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$');
    return emailRegExp.hasMatch(email);
  }
}
