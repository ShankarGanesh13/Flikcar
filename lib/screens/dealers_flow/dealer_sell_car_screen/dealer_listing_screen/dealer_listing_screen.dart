import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flikcar/common_widgets/custom_appbar.dart';
import 'package:flikcar/common_widgets/heading1.dart';
import 'package:flikcar/common_widgets/primary_button.dart';
import 'package:flikcar/models/brand_model_varient.dart';
import 'package:flikcar/screens/dealers_flow/dealer_flow.dart';
import 'package:flikcar/screens/dealers_flow/dealer_sell_car_screen/dealer_listing_screen/listing_car_images/listing_car_images.dart';
import 'package:flikcar/screens/dealers_flow/dealer_sell_car_screen/dealer_listing_screen/listing_car_specification/listing_car_specification.dart';
import 'package:flikcar/screens/dealers_flow/dealer_sell_car_screen/dealer_listing_screen/widgets/brand_model_varient.dart';
import 'package:flikcar/screens/dealers_flow/dealer_sell_car_screen/dealer_listing_screen/widgets/details_dropdown.dart';
import 'package:flikcar/screens/dealers_flow/dealer_sell_car_screen/dealer_listing_screen/widgets/dropDownTextField.dart';
import 'package:flikcar/screens/dealers_flow/dealer_sell_car_screen/dealer_listing_screen/widgets/listing_text_field.dart';
import 'package:flikcar/screens/dealers_flow/dealer_sell_car_screen/dealer_listing_screen/widgets/rto_dropdown.dart';
import 'package:flikcar/services/dealer_upload_car.dart';
import 'package:flikcar/services/get_brand_model_varient.dart';
import 'package:flikcar/utils/colors.dart';
import 'package:flikcar/utils/fonts.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DealerListingScreen extends StatefulWidget {
  DealerListingScreen({super.key});

  @override
  State<DealerListingScreen> createState() => _DealerListingScreenState();
}

class _DealerListingScreenState extends State<DealerListingScreen> {
  @override
  void initState() {
    // TODO: implement initState
    GetBrandModelVarient.getRto();
    super.initState();
  }

  String? selectedValue;
  TextEditingController yearController = TextEditingController();
  TextEditingController kmsController = TextEditingController();
  TextEditingController sellingPriceController = TextEditingController();
  TextEditingController descController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  BrandModelVarient? selectedBrand;
  Model? selectedModel;
  Varient? selectedVariant;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.getAppBar(
        function: () {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => const DealerFlow(
                index: 0,
              ),
            ),
            (route) => false,
          );
        },
      ),
      bottomNavigationBar: SafeArea(
        child: Container(
          height: 55,
          width: MediaQuery.of(context).size.width,
          padding:
              const EdgeInsets.only(left: 15, right: 15, bottom: 10, top: 8),
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
                if (_formKey.currentState!.validate()) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ListingCarImages(),
                      ));
                }
              },
              textStyle: AppFonts.w500white14,
              title: "Next"),
        ),
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
                decoration: BoxDecoration(gradient: AppColors.gradient),
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
                    const BrandVarientModelDropDown(),
                    // const SizedBox(height: 20),
                    // RtoDropdown(),
                    const SizedBox(height: 20),
                    DetailsDropDown(),
                    const SizedBox(height: 20),
                    ListingTextField(
                      hint: "Eg. 2018",
                      maxlength: 4,
                      keyboardType: TextInputType.number,
                      title: "Make Year",
                      controller: yearController,
                      onChanged: (value) {
                        Provider.of<DealerUploadCar>(context, listen: false)
                            .getYearId(year: value);
                      },
                    ),
                    const SizedBox(height: 20),
                    ListingTextField(
                      hint: "Eg. 130015",
                      maxlength: 6,
                      keyboardType: TextInputType.number,
                      title: "Kilometers Driven",
                      controller: kmsController,
                      onChanged: (value) {
                        print(value);
                        Provider.of<DealerUploadCar>(context, listen: false)
                            .getKilometerDriven(kms: value);
                      },
                    ),
                    const SizedBox(height: 20),
                    ListingTextField(
                      hint: "Eg. 430000",
                      maxlength: 8,
                      title: "Selling Price",
                      keyboardType: TextInputType.number,
                      controller: sellingPriceController,
                      onChanged: (value) {
                        Provider.of<DealerUploadCar>(context, listen: false)
                            .getSellingPrice(price: value);
                      },
                    ),
                    const SizedBox(height: 20),
                    ListingTextField(
                      hint: "Description about car",
                      maxlength: 200,
                      title: "Description",
                      keyboardType: TextInputType.text,
                      controller: descController,
                      onChanged: (value) {
                        Provider.of<DealerUploadCar>(context, listen: false)
                            .getDescription(des: value);
                      },
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

  // List<String> getBrand(List<BrandModelVarient> list) {
  //   brand = [];

  //   for (var i = 0; i < list.length; i++) {
  //     brand.add(list[i].name);
  //   }

  //   return brand.toSet().toList();
  // }

  // Future<List<String>> getModel(String brand) async {
  //   print(brand);
  //   models = ["Select a brand"];
  //   List<BrandModelVarient> bvm =
  //       await GetBrandModelVarient().getBrandModelVarient();

  //   models = [];
  //   print(models);
  //   BrandModelVarient selectedbrand =
  //       bvm.firstWhere((element) => element.name.toLowerCase() == brand);
  //   selectedbrand.model.forEach((element) {
  //     models.add(element.name);
  //   });

  //   setState(() {});
  //   print(models);
  //   return models;
  // }
}
