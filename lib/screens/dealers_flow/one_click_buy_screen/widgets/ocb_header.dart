import 'package:flikcar/utils/fonts.dart';
import 'package:flutter/material.dart';

class OcbHeader extends StatelessWidget {
  const OcbHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 230,
          child: Image.asset(
            "assets/sample_car/ocb.jpg",
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
                  const Color(0xff171717).withOpacity(0.5),
                  const Color(0xff171717).withOpacity(0.7)
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
              Text("Instant Car Ownership\nClick, Buy, Drive!",
                  style: AppFonts.w700black30),
              const SizedBox(
                height: 8,
              ),
              Text(
                "Transforming Car Buying into a\nQuick Click Experience",
                style: AppFonts.w500white14,
              )
            ],
          ),
        ),
      ],
    );
  }
}
