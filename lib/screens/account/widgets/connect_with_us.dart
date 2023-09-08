import 'package:flikcar/utils/colors.dart';
import 'package:flikcar/utils/fonts.dart';
import 'package:flutter/material.dart';

class ConnectWithUs extends StatelessWidget {
  const ConnectWithUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Colors.transparent,
          padding: const EdgeInsets.all(15.0),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Connect With Us",
                    style: AppFonts.w700black16,
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      Image.asset(
                        "assets/car_details_icon/facebook.png",
                        height: 18,
                        width: 18,
                        color: AppColors.dark2,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Image.asset(
                        "assets/car_details_icon/instagram.png",
                        height: 18,
                        width: 18,
                        color: AppColors.dark2,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Image.asset(
                        "assets/car_details_icon/twitter.png",
                        color: AppColors.dark2,
                        height: 18,
                        width: 18,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Image.asset(
                        "assets/car_details_icon/youtube.png",
                        height: 18,
                        width: 18,
                        color: AppColors.dark2,
                      )
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
        const Divider(
          height: 0,
          color: Color.fromARGB(255, 177, 177, 177),
        )
      ],
    );
    ;
  }
}
