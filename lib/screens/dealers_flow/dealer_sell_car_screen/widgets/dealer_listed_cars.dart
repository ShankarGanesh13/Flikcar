import 'package:favorite_button/favorite_button.dart';
import 'package:flikcar/common_widgets/primary_button.dart';
import 'package:flikcar/screens/buy_car_flow/filter_applied/widget/filter_applied_card.dart';
import 'package:flikcar/screens/dealers_flow/dealer_sell_car_screen/widgets/edit_listing_bottom_sheet.dart';
import 'package:flikcar/utils/colors.dart';
import 'package:flikcar/utils/fonts.dart';
import 'package:flutter/material.dart';

class DealerListedCars extends StatelessWidget {
  const DealerListedCars({super.key});
  static List<String> features = ["Petrol", "13000kms", "2014", "Manual"];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 4,
        itemBuilder: (context, index) {
          return Container(
            height: 137,
            margin: const EdgeInsets.only(bottom: 30),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                    color: Color.fromRGBO(0, 0, 0, 0.25),
                    offset: Offset(1, 1),
                    blurRadius: 20,
                    spreadRadius: 0,
                  ),
                ],
                borderRadius: BorderRadius.circular(5)),
            child: Row(children: [
              SizedBox(
                width: MediaQuery.of(context).size.width / 2.45,
                height: 137,
                child: Image.asset(
                  "assets/sample_car/tigor1.png",
                  fit: BoxFit.fill,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(7.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Car Name",
                          style: AppFonts.w700black16,
                        ),
                        SizedBox(
                            width: MediaQuery.of(context).size.width / 4.6),
                        GestureDetector(
                          onTap: () {
                            showModalBottomSheet<void>(
                              isScrollControlled: true,
                              context: context,
                              builder: (BuildContext context) {
                                return const EditListingBottomSheet();
                              },
                            );
                          },
                          child: const Icon(
                            Icons.more_horiz,
                            size: 22,
                          ),
                        )
                      ],
                    ),
                    Text(
                      "Varient Name",
                      style: AppFonts.w500dark214,
                    ),
                    const SizedBox(height: 4),
                    Wrap(
                      spacing: 7,
                      children: List.generate(
                        4,
                        (index) => Container(
                          padding: const EdgeInsets.only(
                              left: 0, right: 0, top: 0, bottom: 0),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20)),
                          child: Text(
                            features[index],
                            style: AppFonts.w500black10,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      "₹ 326000 ",
                      style: AppFonts.w700black20,
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        SizedBox(
                          width: 100,
                          height: 30,
                          child: PrimaryButton(
                              title: "Mark as Sold",
                              function: () {},
                              borderColor: AppColors.s1,
                              backgroundColor: Colors.white,
                              textStyle: AppFonts.w500s110),
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Available", style: AppFonts.w500green14),
                            Text(
                              "Listed on 25/36",
                              style: AppFonts.w500black10,
                            )
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              )
            ]),
          );
        });
  }
}
