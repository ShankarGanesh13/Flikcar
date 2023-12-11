import 'package:flikcar/common_widgets/heading1.dart';
import 'package:flikcar/common_widgets/loading_widget.dart';
import 'package:flikcar/models/brand_model_varient.dart';
import 'package:flikcar/services/get_brand_model_varient.dart';
import 'package:flikcar/utils/colors.dart';
import 'package:flikcar/utils/fonts.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SelectBrand extends StatelessWidget {
  const SelectBrand({super.key});
  static List<String> images = [
    "assets/brand/tata.jpg",
    "assets/brand/hyundai.jpg",
    "assets/brand/kia.jpg",
    "assets/brand/mahindra.jpg",
    "assets/brand/maruthi.jpg",
    "assets/brand/toyota.jpg",
    "assets/brand/audi.jpg",
    "assets/brand/bmw.jpg",
    "assets/brand/volkswegen.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Heading1(title1: "Our popular brands", title2: ""),
        const SizedBox(height: 15),
        GridView.count(
          shrinkWrap: true,
          crossAxisCount: 3,
          mainAxisSpacing: 15,
          crossAxisSpacing: 30,
          childAspectRatio: 1.9 / 1.3,
          physics: const NeverScrollableScrollPhysics(),
          children: List.generate(images.length, (index) {
            return Container(
                padding: const EdgeInsets.only(top: 5, bottom: 5),
                height: 62,
                width: 86,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: AppColors.dark2,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 35,
                        child: Image.asset(
                          images[index],
                          fit: BoxFit.cover,
                          // loadingBuilder: (context, child, loadingProgress) {
                          //   if (loadingProgress == null) {
                          //     return child;
                          //   } else {
                          //     return const LoadingWidget();
                          //   }
                          // },
                        ),
                      ),
                      const SizedBox(height: 4),
                      // Text(
                      //   snaphot.data![index].name,
                      //   style: const TextStyle(
                      //     color: Color(0xff171717),
                      //     fontSize: 10,
                      //     fontWeight: FontWeight.w500,
                      //   ),
                      // ),
                    ],
                  ),
                ));
          }),
        ),
      ],
    );
  }
}
