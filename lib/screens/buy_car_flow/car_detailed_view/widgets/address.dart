import 'package:flikcar/common_widgets/primary_button.dart';
import 'package:flikcar/utils/colors.dart';
import 'package:flikcar/utils/fonts.dart';
import 'package:flutter/material.dart';

class CarAddress extends StatelessWidget {
  const CarAddress({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        children: [
          Row(
            children: [
              const Icon(
                Icons.home,
                size: 20,
              ),
              const SizedBox(width: 5),
              Text(
                "Home Delivery Available",
                style: AppFonts.w700black16,
              )
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              const Icon(
                Icons.location_on,
                size: 20,
              ),
              const SizedBox(width: 5),
              Text("Available at Store", style: AppFonts.w700black16),
              const Spacer(),
              Text(
                "Get Direction",
                style: AppFonts.w500black14,
              ),
              const SizedBox(width: 5),
              const Icon(
                Icons.directions_sharp,
                color: Colors.black,
                size: 20,
              )
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Text(
              "DN-51, Merline Infinite Building, Room no- 605, Sector V, Bidhannagar, Kolkata, West Bengal 70009",
              style: AppFonts.w500dark214,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          PrimaryButton(
            title: "View all Cars at the Store",
            function: () {},
            backgroundColor: AppColors.p2,
            borderColor: Colors.transparent,
            textStyle: AppFonts.w500white14,
          )
        ],
      ),
    );
  }
}
