import 'package:favorite_button/favorite_button.dart';
import 'package:flikcar/common_widgets/primary_button.dart';
import 'package:flikcar/screens/buy_car_flow/schedule_test_drive/schedule_test_drive.dart';
import 'package:flikcar/utils/colors.dart';
import 'package:flikcar/utils/fonts.dart';
import 'package:flutter/material.dart';

class WishlistCard extends StatelessWidget {
  const WishlistCard({super.key});
  static List<String> features = ["Petrol", "13000kms", "2014", "Manual"];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 15, right: 15, bottom: 20),
      height: 164,
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
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        children: [
          Row(children: [
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
                          isFavorite: true,
                        ),
                      )
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
          const Spacer(),
          Padding(
            padding:
                const EdgeInsets.only(top: 8.0, bottom: 8, left: 20, right: 20),
            child: PrimaryButton(
                title: "Book Test Drive",
                function: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ScheduleTestDrive()));
                },
                borderColor: Colors.transparent,
                backgroundColor: AppColors.p2,
                textStyle: AppFonts.w500white14),
          )
        ],
      ),
    );
  }
}
