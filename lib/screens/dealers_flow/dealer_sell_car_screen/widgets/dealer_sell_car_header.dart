import 'package:flikcar/utils/fonts.dart';
import 'package:flutter/material.dart';

class DealerSellCarHeader extends StatelessWidget {
  const DealerSellCarHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 230,
          child: Image.asset(
            "assets/sample_car/sell_car.jpg",
            fit: BoxFit.fill,
          ),
        ),
        Positioned(
          child: Container(
            height: 230,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  const Color(0xff171717).withOpacity(0.4),
                  const Color(0xff171717).withOpacity(0.6)
                ],
              ),
            ),
          ),
        ),
        Positioned(
          top: 30,
          left: 15,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Sell Your Used Cars\nat Best Prices",
                  style: AppFonts.w700black30),
              const SizedBox(
                height: 8,
              ),
              Text(
                "Unlock a world of opportunities with Flikcar. \nList your used cars for free and reach \nthousands of buyers.",
                style: AppFonts.w500white14,
              )
            ],
          ),
        ),
      ],
    );
  }
}
