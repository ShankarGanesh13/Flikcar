import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flikcar/common_widgets/custom_appbar.dart';
import 'package:flikcar/common_widgets/heading1.dart';
import 'package:flikcar/common_widgets/primary_button.dart';
import 'package:flikcar/screens/dealers_flow/dealer_sell_car_screen/dealer_listing_screen/listing_car_specification/listing_car_specification.dart';
import 'package:flikcar/screens/dealers_flow/dealer_sell_car_screen/dealer_listing_screen/widgets/dropDownTextField.dart';
import 'package:flikcar/screens/dealers_flow/dealer_sell_car_screen/dealer_listing_screen/widgets/listing_text_field.dart';
import 'package:flikcar/utils/colors.dart';
import 'package:flikcar/utils/fonts.dart';
import 'package:flutter/material.dart';

class DealerListingScreen extends StatelessWidget {
  DealerListingScreen({super.key});

  String? selectedValue;

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.getAppBar(),
      bottomNavigationBar: Container(
        height: 55,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.only(left: 15, right: 15, bottom: 10, top: 8),
        decoration: const BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.25),
            offset: Offset(0, -10),
            blurRadius: 18,
          )
        ]),
        child: PrimaryButton(
            backgroundColor: AppColors.s1,
            borderColor: Colors.transparent,
            function: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ListingCarSpecification(),
                  ));
            },
            textStyle: AppFonts.w500white14,
            title: "Next"),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Container(
                height: 70,
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.all(15),
                color: const Color.fromRGBO(237, 255, 238, 1),
                child: Row(children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.chevron_left,
                      color: AppColors.p2,
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    "Enter basic car details you\nwant to list",
                    style: AppFonts.w700black16,
                  ),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 15),
                    const ListingTextField(
                      hint: "Eg. Honda",
                      maxlength: 20,
                      title: "Make",
                    ),
                    const SizedBox(height: 20),
                    const ListingTextField(
                      hint: "Eg. Civic",
                      maxlength: 20,
                      title: "Model",
                    ),
                    const SizedBox(height: 20),
                    const ListingTextField(
                      hint: "Eg. VX CVT",
                      maxlength: 20,
                      title: "Varient",
                    ),
                    const SizedBox(height: 20),
                    const ListingTextField(
                      hint: "Eg. 2018",
                      maxlength: 4,
                      title: "Make Year",
                    ),
                    const SizedBox(height: 20),
                    const DropDownTextField(
                        title: "Body Type",
                        hint: "Eg. Sedan",
                        error: "Select car body type",
                        selectedValue: "suzuki",
                        items: ["Sedan", "Hatchback", "SUV", "MUV", "LUV"]),
                    const SizedBox(height: 20),
                    const DropDownTextField(
                        title: "Fuel Type",
                        hint: "Eg. Petrol",
                        error: "Select car fuel type",
                        selectedValue: "suzuki",
                        items: [
                          "Petrol",
                          "Diesel",
                          "Electric",
                          "LPG",
                          "Others"
                        ]),
                    const SizedBox(height: 20),
                    const DropDownTextField(
                        title: "Transmisson",
                        hint: "Eg. HONDA",
                        error: "Select car transmisson",
                        selectedValue: "suzuki",
                        items: ["Automatic", "Manual"]),
                    const SizedBox(height: 20),
                    const DropDownTextField(
                        title: "Ownership",
                        hint: "Eg. 1st Owner",
                        error: "Select car ownership",
                        selectedValue: "suzuki",
                        items: ["1st Owner", "2nd Owner", "3rd Owner"]),
                    const SizedBox(height: 20),

                    //
                    //
                    const ListingTextField(
                      hint: "Eg. Red",
                      maxlength: 20,
                      title: "Color",
                    ),
                    const SizedBox(height: 20),

                    const ListingTextField(
                      hint: "Eg. 130015",
                      maxlength: 6,
                      title: "Kilometers Driven",
                    ),
                    const SizedBox(height: 20),
                    const ListingTextField(
                      hint: "430000",
                      maxlength: 8,
                      title: "Selling Price",
                    ),
                    const SizedBox(height: 20),
                    const ListingTextField(
                      hint: "Description about car",
                      maxlength: 200,
                      title: "Description",
                    ),

                    Container(
                      width: MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.all(12),
                      margin: const EdgeInsets.only(top: 30, bottom: 30),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: const Color(0xffE0E0E0),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.lightbulb_outline_rounded,
                            size: 30,
                          ),
                          const Spacer(),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 1.3,
                            child: Text(
                              "Include any details and imperfections that might help people understand the car you’re selling. A detailed description may help you sell faster.",
                              style: AppFonts.w500dark214,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}