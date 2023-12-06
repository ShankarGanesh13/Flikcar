import 'package:flikcar/common_widgets/heading1.dart';
import 'package:flikcar/common_widgets/loading_widget.dart';
import 'package:flikcar/common_widgets/secondary_button.dart';
import 'package:flikcar/models/brand_model_varient.dart';
import 'package:flikcar/screens/sell_car_flow/selling_process/provider/selling_process_provider.dart';
import 'package:flikcar/screens/sell_car_flow/selling_process/widgets/my_text_field.dart';
import 'package:flikcar/services/get_brand_model_varient.dart';
import 'package:flikcar/utils/colors.dart';
import 'package:flikcar/utils/fonts.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SelectBrandCard extends StatelessWidget {
  final PageController controller;
  const SelectBrandCard({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    int selectedIndex = context.watch<SellingProcessProvider>().brandIndex;
    return SizedBox(
      child: SingleChildScrollView(
        child: Column(
          children: [
            const Heading1(title1: "Select your car brand", title2: ""),
            const SizedBox(height: 15),
            // MyTextField(
            //   hint: "Search your car brand",
            //   maxlength: 20,
            //   onChanged: (value) {},
            // ),
            // const SizedBox(height: 15),
            FutureBuilder<List<BrandModelVarient>>(
                future: GetBrandModelVarient.getBrandModelVarientCust(),
                builder: (context, snapshot) {
                  if (snapshot.data != null) {
                    return Wrap(
                      spacing: 25,
                      runSpacing: 15,
                      children: List.generate(
                        snapshot.data!.length,
                        (index) => InkWell(
                          onTap: () {
                            Provider.of<SellingProcessProvider>(context,
                                    listen: false)
                                .setBrand(
                                    brandId:
                                        snapshot.data![index].name.toString(),
                                    index: index,
                                    brand: snapshot.data![index].name,
                                    models: snapshot.data![index].models);
                          },
                          child: Container(
                              padding: const EdgeInsets.only(top: 5, bottom: 5),
                              height: 70,
                              width: 95,
                              decoration: BoxDecoration(
                                color: selectedIndex == index
                                    ? Colors.white
                                    : Colors.white,
                                border: Border.all(
                                  width: 2,
                                  color: selectedIndex == index
                                      ? AppColors.p2
                                      : AppColors.grey,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    // SizedBox(
                                    //   height: 35,
                                    //   child: Image.network(
                                    //     "https://webservice.flikcar.com/public/${snapshot.data![index].image}",
                                    //     fit: BoxFit.fill,
                                    //     loadingBuilder:
                                    //         (context, child, loadingProgress) {
                                    //       if (loadingProgress == null) {
                                    //         return child;
                                    //       } else {
                                    //         return const LoadingWidget();
                                    //       }
                                    //     },
                                    //   ),
                                    // ),
                                    const SizedBox(height: 4),
                                    Text(snapshot.data![index].name,
                                        style: selectedIndex == index
                                            ? AppFonts.w500black10
                                            : AppFonts.w500black10),
                                  ],
                                ),
                              )),
                        ),
                      ),
                    );
                  } else {
                    return const Padding(
                      padding: EdgeInsets.only(top: 50.0),
                      child: LoadingWidget(),
                    );
                  }
                }),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}

// GridView.count(
          //   shrinkWrap: true,
          //   crossAxisCount: 3,
          //   mainAxisSpacing: 15,
          //   crossAxisSpacing: 30,
          //   childAspectRatio: 1.9 / 1.3,
          //   physics: const NeverScrollableScrollPhysics(),
          //   children: List.generate(9, (index) {
          //     return Container(
          //         padding: EdgeInsets.only(top: 5, bottom: 5),
          //         height: 62,
          //         width: 86,
          //         decoration: BoxDecoration(
          //           border: Border.all(
          //             color: Color(0xff606060),
          //           ),
          //           borderRadius: BorderRadius.circular(10),
          //         ),
          //         child: Center(
          //           child: Column(
          //             mainAxisAlignment: MainAxisAlignment.center,
          //             children: [
          //               SizedBox(
          //                 height: 30,
          //                 width: 30,
          //                 child: Image.asset("assets/bmw_logo.png"),
          //               ),
          //               const SizedBox(height: 4),
          //               const Text(
          //                 "BMW",
          //                 style: TextStyle(
          //                   color: Color(0xff171717),
          //                   fontSize: 10,
          //                   fontWeight: FontWeight.w500,
          //                 ),
          //               ),
          //             ],
          //           ),
          //         ));
          //   }),
          // ),