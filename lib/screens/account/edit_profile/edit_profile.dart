import 'package:flikcar/common_widgets/custom_appbar.dart';
import 'package:flikcar/common_widgets/heading1.dart';
import 'package:flikcar/common_widgets/primary_button.dart';
import 'package:flikcar/screens/home_screen/home_screen.dart';
import 'package:flikcar/services/auth_service.dart';
import 'package:flikcar/utils/colors.dart';
import 'package:flikcar/utils/fonts.dart';
import 'package:flutter/material.dart';

class EditProfile extends StatelessWidget {
  String phoneNumber;
  EditProfile({super.key, required this.phoneNumber});
  TextEditingController fNameController = TextEditingController();
  TextEditingController lNameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.getAppBar(
        function: () {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => const HomeScreen(
                index: 0,
              ),
            ),
            (route) => false,
          );
        },
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                const Heading1(title1: "Edit Profile", title2: ""),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "First Name",
                  style: AppFonts.w700s116,
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: TextFormField(
                    controller: fNameController,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.only(
                          left: 12, right: 12, top: 6, bottom: 6),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      counterText: "",
                      counterStyle: const TextStyle(color: Colors.transparent),
                      hintText: "Eg. John",
                    ),
                    maxLength: 20,
                    validator: (value) {
                      if (value!.length < 3) {
                        return "Enter a valid data";
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  "Last Name",
                  style: AppFonts.w700s116,
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: TextFormField(
                    controller: lNameController,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.only(
                          left: 12, right: 12, top: 6, bottom: 6),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      counterText: "",
                      counterStyle: const TextStyle(color: Colors.transparent),
                      hintText: "Eg. Doe",
                    ),
                    maxLength: 20,
                    validator: (value) {
                      if (value!.length < 1) {
                        return "Enter a valid data";
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  "Phone Number",
                  style: AppFonts.w700s116,
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: TextFormField(
                    readOnly: true,
                    initialValue: phoneNumber,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.only(
                          left: 12, right: 12, top: 6, bottom: 6),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      counterText: "",
                      counterStyle: const TextStyle(color: Colors.transparent),
                      hintText: "Eg. 8945152454",
                    ),
                    maxLength: 10,
                    validator: (value) {
                      if (value!.length < 1) {
                        return "Enter a valid data";
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(height: 60),
                PrimaryButton(
                    title: "Submit",
                    function: () {
                      if (_formKey.currentState!.validate()) {
                        AuthService.editProfile(
                            fName: fNameController.text,
                            lName: lNameController.text,
                            contact: phoneNumber,
                            context: context);
                      }
                    },
                    borderColor: Colors.transparent,
                    backgroundColor: AppColors.p2,
                    textStyle: AppFonts.w500white14)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
