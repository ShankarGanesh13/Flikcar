import 'package:flikcar/common_widgets/custom_appbar.dart';
import 'package:flikcar/common_widgets/primary_button.dart';
import 'package:flikcar/screens/onbording_screens/dealer_onboarding/upload_documents/upload_dealer_documents.dart';
import 'package:flikcar/utils/colors.dart';
import 'package:flikcar/utils/fonts.dart';
import 'package:flutter/material.dart';

class DealerDetails extends StatelessWidget {
  DealerDetails({super.key});
  final _formKey = GlobalKey<FormState>();

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
                      maxLength: 20),
                  textField(
                      context: context,
                      title: "Email *",
                      hint: "Enter Your Email",
                      minLength: 8,
                      maxLength: 30),
                  textField(
                      context: context,
                      title: "Mobile Number *",
                      minLength: 10,
                      hint: "Enter Your Mobile Number",
                      maxLength: 10),
                  textField(
                      context: context,
                      title: "Shop Name *",
                      hint: "Enter Your Shop Name",
                      minLength: 5,
                      maxLength: 30),
                  textField(
                      context: context,
                      title: "GST number *",
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
