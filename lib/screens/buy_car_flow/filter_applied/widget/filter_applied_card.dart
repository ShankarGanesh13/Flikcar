import 'package:favorite_button/favorite_button.dart';
import 'package:flikcar/utils/colors.dart';
import 'package:flikcar/utils/fonts.dart';
import 'package:flutter/material.dart';

class FilterAppliedCard extends StatefulWidget {
  final bool compare;
  const FilterAppliedCard({super.key, required this.compare});
  static List<String> features = ["Petrol", "13000kms", "2014", "Manual"];

  @override
  State<FilterAppliedCard> createState() => _FilterAppliedCardState();
}

class _FilterAppliedCardState extends State<FilterAppliedCard> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(left: 15, right: 15, bottom: 10),
          height: 104,
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
              width: MediaQuery.of(context).size.width / 2.4,
              height: 104,
              child: Image.asset("assets/sample_car/tigor1.png"),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        "Car Name",
                        style: AppFonts.w700black16,
                      ),
                      SizedBox(width: MediaQuery.of(context).size.width / 4.7),
                      SizedBox(
                        height: 20,
                        width: 20,
                        child: FavoriteButton(
                          valueChanged: () {},
                          iconSize: 20,
                        ),
                      )
                    ],
                  ),
                  Text(
                    "Varient Name",
                    style: AppFonts.w500dark214,
                  ),
                  SizedBox(height: 5),
                  Wrap(
                    spacing: 6,
                    children: List.generate(
                      4,
                      (index) => Container(
                        padding: const EdgeInsets.only(
                            left: 0, right: 0, top: 0, bottom: 0),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20)),
                        child: Text(
                          FilterAppliedCard.features[index],
                          style: AppFonts.w500black10,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "₹326000 ",
                    style: AppFonts.w700black20,
                  )
                ],
              ),
            )
          ]),
        ),
        widget.compare
            ? Container(
                padding: const EdgeInsets.only(left: 15),
                width: 200,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      isSelected = isSelected == false ? true : false;
                    });
                  },
                  child: Row(
                    children: [
                      Container(
                        height: 15,
                        width: 15,
                        decoration: BoxDecoration(
                            border: Border.all(color: const Color(0xff161F31))),
                        child: Center(
                            child: Icon(
                          Icons.check,
                          size: 14,
                          color: isSelected ? AppColors.s1 : Colors.transparent,
                          weight: 2,
                        )),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        "Select to compare",
                        style: AppFonts.w500dark214,
                      )
                    ],
                  ),
                ),
              )
            : const SizedBox(),
        const SizedBox(height: 20)
      ],
    );
  }
}
