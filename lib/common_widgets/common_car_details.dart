import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/material.dart';

import '../screens/buy_car_flow/filter_applied/widget/filter_applied_card.dart';
import '../utils/fonts.dart';

class CommonCarDetails extends StatelessWidget {
  const CommonCarDetails({super.key});
  static List<String> features = ["Petrol", "13000kms", "2014", "Manual"];
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 0, right: 15, bottom: 0),
      height: 104,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: Colors.white,
          // boxShadow: const [
          //   BoxShadow(
          //     color: Color.fromRGBO(0, 0, 0, 0.25),
          //     offset: Offset(1, 1),
          //     blurRadius: 20,
          //     spreadRadius: 0,
          //   ),
          // ],
          borderRadius: BorderRadius.circular(5)),
      child: Row(children: [
        SizedBox(
          width: MediaQuery.of(context).size.width / 2.35,
          height: 100,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: Image.asset(
              "assets/sample_car/tigor1.png",
              fit: BoxFit.fill,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(6.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    "Car Name",
                    style: AppFonts.w700black16,
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width / 5.5),
                  // SizedBox(
                  //   height: 20,
                  //   width: 20,
                  //   child: FavoriteButton(
                  //     valueChanged: () {},
                  //     iconSize: 20,
                  //   ),
                  //  )
                ],
              ),
              Text(
                "Varient Name",
                style: AppFonts.w500dark214,
              ),
              const SizedBox(height: 5),
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
                      features[index],
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
    );
  }
}
