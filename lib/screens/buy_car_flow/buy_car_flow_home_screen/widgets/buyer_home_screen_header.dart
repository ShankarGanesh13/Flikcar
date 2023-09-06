import 'package:flutter/material.dart';

class BuyerHomeScreenHeader extends StatelessWidget {
  const BuyerHomeScreenHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 230,
          child: Image.asset(
            "assets/buy_car_background.png",
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
                  const Color(0xff171717).withOpacity(0.8),
                  const Color(0xff171717).withOpacity(0.8)
                ],
              ),
            ),
          ),
        ),
        const Positioned(
          top: 30,
          left: 15,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Buy car at\nthe best price",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.w700),
              ),
              Text(
                "Find your perfect match on Flikcar. We have \na wide range of fully inspected and certified\nused cars at the best prices.",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
              )
            ],
          ),
        ),
      ],
    );
  }
}
