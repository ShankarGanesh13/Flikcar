import 'package:favorite_button/favorite_button.dart';
import 'package:flikcar/common_widgets/heading1.dart';
import 'package:flikcar/common_widgets/primary_button.dart';
import 'package:flikcar/screens/dealers_flow/auction_screens/dealer_car_detail_screen/detail_car_detail_screen.dart';
import 'package:flikcar/utils/colors.dart';
import 'package:flikcar/utils/fonts.dart';
import 'package:flutter/material.dart';

class DealerCarCard extends StatelessWidget {
  final List<String> filters;
  final String title;
  final bool filterButton;

  const DealerCarCard(
      {super.key,
      required this.filters,
      required this.title,
      required this.filterButton});
  static List<String> features = ["Petrol", "13000kms", "2014", "Manual"];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(
            left: 15,
          ),
          child: Heading1(title1: title, title2: ''),
        ),
        const SizedBox(height: 12),
        filterButton == true
            ? SizedBox(
                height: 30,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: filters.length,
                  itemBuilder: (context, index) => Container(
                    margin: const EdgeInsets.only(left: 15),
                    padding: const EdgeInsets.only(
                        top: 5, bottom: 5, left: 10, right: 10),
                    decoration: BoxDecoration(
                        color: AppColors.p2,
                        borderRadius: BorderRadius.circular(4)),
                    child: Text(
                      filters[index],
                      style: AppFonts.w500white14,
                    ),
                  ),
                ),
              )
            : const SizedBox(),
        SizedBox(height: filterButton == true ? 12 : 0),
        Container(
            padding: const EdgeInsets.only(left: 0, bottom: 15),
            height: 450,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 4,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const DealerCarDetailScreen()));
                    },
                    child: Container(
                      height: 400,
                      width: 268,
                      margin: const EdgeInsets.only(
                          right: 15, bottom: 20, top: 5, left: 15),
                      decoration: BoxDecoration(
                        boxShadow: const [
                          // BoxShadow(
                          //   color: Color.fromRGBO(0, 0, 0, 0.25),
                          //   offset: Offset(12, 12),
                          //   blurRadius: 10,
                          //   spreadRadius: -10,
                          // ),
                          BoxShadow(
                            color: Color.fromRGBO(0, 0, 0, 0.25),
                            offset: Offset(1, 1),
                            blurRadius: 20,
                            spreadRadius: 0,
                          ),
                        ],
                        color: const Color(0xffF2F2F2),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                            ),
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width,
                              height: 181,
                              child: Image.asset(
                                "assets/sample_car.png",
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 23,
                                  child: Row(
                                    children: [
                                      Text("Car Name",
                                          style: AppFonts.w700s140),
                                      const Spacer(),
                                      FavoriteButton(
                                          iconSize: 24, valueChanged: () {})
                                    ],
                                  ),
                                ),
                                Text("Varient Name",
                                    style: AppFonts.w500dark214),
                                const SizedBox(height: 10),
                                Wrap(
                                  spacing: 6,
                                  children: List.generate(
                                    4,
                                    (index) => Container(
                                      padding: const EdgeInsets.only(
                                          left: 6, right: 6, top: 5, bottom: 5),
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      child: Text(
                                        features[index],
                                        style: AppFonts.w500black12,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Current Bid ₹105897",
                                  style: AppFonts.w700black20,
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  "Fair market value ₹250000 ",
                                  style: AppFonts.w500black14,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 5),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 10.0, right: 10),
                            child: Row(
                              children: [
                                Text(
                                  "Auction ends in:\n3d 11h 23m 13s",
                                  style: AppFonts.w500red14,
                                ),
                                const Spacer(),
                                SizedBox(
                                  width: 122,
                                  height: 35,
                                  child: PrimaryButton(
                                    title: "Place Bid",
                                    function: () {},
                                    borderColor: Colors.black,
                                    textStyle: AppFonts.w500black14,
                                    backgroundColor: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                })),
        const SizedBox(
          height: 10,
        )
      ],
    );
  }
}
