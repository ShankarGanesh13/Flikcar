import 'package:favorite_button/favorite_button.dart';
import 'package:flikcar/common_widgets/heading1.dart';
import 'package:flikcar/common_widgets/primary_button.dart';
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
                        color: const Color(0xff9A2870),
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
                  return Container(
                    height: 361,
                    width: 268,
                    margin:
                        const EdgeInsets.only(right: 30, bottom: 20, top: 5),
                    decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(
                          color: Color.fromRGBO(0, 0, 0, 0.25),
                          offset: Offset(16, 15),
                          blurRadius: 18,
                          spreadRadius: -10,
                        ),
                      ],
                      color: const Color(0xffE0E0E0),
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
                                    Text("Car Name", style: AppFonts.w700s120),
                                    const Spacer(),
                                    FavoriteButton(
                                      iconSize: 24,
                                      valueChanged: (_) {},
                                    ),
                                  ],
                                ),
                              ),
                              Text("Varient Name", style: AppFonts.w500dark214),
                              const SizedBox(height: 8),
                              Text(
                                "₹ 130000",
                                style: AppFonts.w700s120,
                              ),
                              const SizedBox(height: 10),
                              Wrap(
                                spacing: 6,
                                children: List.generate(
                                  3,
                                  (index) => Container(
                                    padding: const EdgeInsets.only(
                                        left: 5, right: 5, top: 3, bottom: 3),
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: Text(
                                      "13258 kms",
                                      style: AppFonts.w500black10,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Spacer(),
                        PrimaryButton(title: "Contact Dealer", function: () {})
                      ],
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
