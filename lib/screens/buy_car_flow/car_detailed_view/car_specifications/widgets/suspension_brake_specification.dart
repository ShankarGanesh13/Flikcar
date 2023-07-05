import 'package:flikcar/models/buyer_car_model.dart';
import 'package:flikcar/screens/buy_car_flow/car_detailed_view/car_specifications/widgets/specification_text.dart';
import 'package:flikcar/utils/fonts.dart';
import 'package:flutter/material.dart';

class SuspensionBrakeSpecification extends StatelessWidget {
  final BuyerCar car;
  const SuspensionBrakeSpecification({super.key, required this.car});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Suspension,steering\n& brakes",
          style: AppFonts.w700black16,
        ),
        const SizedBox(
          height: 20,
        ),
        SpecificationText(
            title: "Suspension front", subtitle: "${car.suspensionFront}"),
        SpecificationText(
            title: "Suspension rear", subtitle: "${car.suspensionRear}"),
        SpecificationText(
            title: "Front brake type", subtitle: "${car.frontBrakeType}"),
        SpecificationText(
            title: "Rear brake type", subtitle: "${car.rearBrakeType}"),
        SpecificationText(
            title: "Steering type", subtitle: "${car.steeringType}"),
      ],
    );
  }
}
