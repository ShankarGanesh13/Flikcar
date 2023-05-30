import 'package:flikcar/utils/fonts.dart';
import 'package:flutter/material.dart';

class ScheduleCarDetails extends StatelessWidget {
  const ScheduleCarDetails({super.key});
  static List<String> features = ["Petrol", "13000kms", "2014", "Manual"];
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
            width: MediaQuery.of(context).size.width / 2.5,
            height: 94,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                "assets/sample_car/tigor1.png",
                fit: BoxFit.cover,
              ),
            )),
        const Spacer(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Car Name",
              style: AppFonts.w700black16,
            ),
            Wrap(
              spacing: 2,
              children: List.generate(
                4,
                (index) => Container(
                  padding: const EdgeInsets.only(
                      left: 3, right: 3, top: 10, bottom: 10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)),
                  child: Text(
                    features[index],
                    style: AppFonts.w500black12,
                  ),
                ),
              ),
            ),
            Text(
              "₹105897",
              style: AppFonts.w700black20,
            ),
          ],
        )
      ],
    );
  }
}
