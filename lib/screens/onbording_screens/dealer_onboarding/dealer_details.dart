import 'package:flikcar/common_widgets/custom_appbar.dart';
import 'package:flikcar/common_widgets/primary_button.dart';
import 'package:flikcar/screens/onbording_screens/dealer_onboarding/upload_documents/upload_dealer_documents.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar.getDealerOnboardingAppBar(
            title: "Create Flikcar Dealer Account"),
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 50,
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
                      title: "Shop Address",
                      hint: "Enter Your Shop Address",
                      minLength: 5,
                      controller: addressController,
                      maxLength: 80),
                  textField(
                      context: context,
                      title: "GST number *",
                      controller: gstController,
                      hint: "Enter Your GST number",
                      minLength: 5,
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
                      textStyle: AppFonts.w500white14)
                ],
              ),
            ),
          ),
        ));
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
              return null;
            },
          ),
        ),
        const SizedBox(height: 20)
      ],
    );
  }
}
