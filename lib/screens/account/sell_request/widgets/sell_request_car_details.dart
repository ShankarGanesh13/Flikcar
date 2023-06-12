import 'package:flikcar/utils/fonts.dart';
import 'package:flutter/material.dart';

class SellRequestCarDetails extends StatelessWidget {
  const SellRequestCarDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
        "Request id #11925310780",
        style: AppFonts.w500dark214,
      ),
      const SizedBox(
        height: 10,
      ),
      Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
              width: 22,
              height: 14,
              child: Image.asset("assets/car_details_icon/car.png")),
          const SizedBox(width: 10),
          const Spacer(),
          SizedBox(
            width: MediaQuery.of(context).size.width / 1.32,
            child: Text(
              "2012 Maruti Suzuki Alto 800 LXI O [2016-2019], 40k-50k km, Petrol Manual Transmission, 2nd owner",
              style: AppFonts.w500black14,
            ),
          )
        ],
      ),
    ]);
  }
}
