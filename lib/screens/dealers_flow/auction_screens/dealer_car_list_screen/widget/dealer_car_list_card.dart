import 'package:favorite_button/favorite_button.dart';
import 'package:flikcar/common_widgets/primary_button.dart';
import 'package:flikcar/utils/fonts.dart';
import 'package:flutter/material.dart';

class DealerCarListCard extends StatelessWidget {
  const DealerCarListCard({super.key});
  static List<String> features = ["Petrol", "13000kms", "2014", "Manual"];
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.only(right: 15, bottom: 30, top: 5, left: 15),
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.25),
            offset: Offset(2, 12),
            blurRadius: 18,
            spreadRadius: -8,
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
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 23,
                  child: Row(
                    children: [
                      Text("Car Name", style: AppFonts.w700s116),
                      const Spacer(),
                      FavoriteButton(iconSize: 24, valueChanged: () {})
                    ],
                  ),
                ),
                const SizedBox(height: 4),
                Text("Varient Name", style: AppFonts.w500dark214),
                const SizedBox(height: 10),
                Wrap(
                  spacing: 6,
                  children: List.generate(
                    4,
                    (index) => Container(
                      padding: const EdgeInsets.only(
                          left: 0, right: 7, top: 5, bottom: 0),
                      decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(20)),
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
            padding: const EdgeInsets.only(left: 15.0, right: 15),
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
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(left: 15.0, right: 15),
            child: Row(
              children: [
                Text(
                  "Auction ends in:\n3d 11h 23m 13s",
                  style: AppFonts.w500red14,
                ),
                const Spacer(),
                SizedBox(
                  width: 122,
                  height: 40,
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
    );
  }
}
