import 'package:favorite_button/favorite_button.dart';
import 'package:flikcar/common_widgets/heading1.dart';
import 'package:flikcar/common_widgets/primary_button.dart';
import 'package:flikcar/screens/buy_car_flow/car_detailed_view/car_detailed_view.dart';
import 'package:flikcar/utils/colors.dart';
import 'package:flikcar/utils/fonts.dart';
import 'package:flutter/material.dart';

class HomeScreenCard extends StatelessWidget {
  final String title;
  final bool filterButton;
  final List<String> filters;
  const HomeScreenCard({
    super.key,
    required this.title,
    required this.filters,
    required this.filterButton,
  });
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
            padding: const EdgeInsets.only(left: 15, bottom: 15),
            height: 380,
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
                            builder: (context) => CarDetailedView(),
                          ));
                    },
                    child: Container(
                      height: 361,
                      width: 268,
                      margin:
                          const EdgeInsets.only(right: 30, bottom: 20, top: 5),
                      decoration: BoxDecoration(
                        boxShadow: const [
                          BoxShadow(
                            color: Color.fromRGBO(0, 0, 0, 0.25),
                            offset: Offset(12, 12),
                            blurRadius: 10,
                            spreadRadius: -10,
                          ),
                        ],
                        color: const Color(0xffF2F2F2),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
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
                                          style: AppFonts.w700s120),
                                      const Spacer(),
                                      Text(
                                        "₹ 130000",
                                        style: AppFonts.w700s120,
                                      ),
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
                          SizedBox(height: 10),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 10.0, right: 10),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 180,
                                  height: 35,
                                  child: PrimaryButton(
                                      title: "Contact Dealer", function: () {}),
                                ),
                                Spacer(),
                                FavoriteButton(
                                  iconSize: 30,
                                  valueChanged: (_) {},
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
