import 'package:flikcar/common_widgets/heading1.dart';
import 'package:flikcar/models/auction_car_model.dart';
import 'package:flikcar/utils/fonts.dart';
import 'package:flutter/material.dart';

class InspectionReport extends StatelessWidget {
  final AuctionCar car;

  const InspectionReport({super.key, required this.car});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const Heading1(title1: "Inspection report", title2: ""),
        const SizedBox(
          height: 8,
        ),
        car.technicianRemarks == ""
            ? Text(
                "Data not available",
                style: AppFonts.w500dark214,
              )
            : SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Text(
                  car.technicianRemarks,
                  style: AppFonts.w500dark214,
                  textAlign: TextAlign.justify,
                ),
              ),
        // const SizedBox(
        //   height: 10,
        // ),
        // inspectionRating(title: "Interior Design", rating: "9"),
        // inspectionRating(title: "Exterior Design", rating: "7"),
        // inspectionRating(title: "Engine & Transmisson", rating: "8"),
        // inspectionRating(title: "Electrical", rating: "9"),
        // inspectionRating(title: "Tyre", rating: "6.5"),
        // inspectionRating(title: "Other Details", rating: "7"),
      ]),
    );
  }

  Widget inspectionRating({required String title, required String rating}) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Row(
        children: [
          Text(
            title,
            style: AppFonts.w700black14,
          ),
          const Spacer(),
          Text(
            rating,
            style: AppFonts.w700black14,
          ),
          const SizedBox(
            width: 5,
          ),
          const Icon(Icons.star),
          const SizedBox(
            width: 90,
          ),
        ],
      ),
    );
  }
}
