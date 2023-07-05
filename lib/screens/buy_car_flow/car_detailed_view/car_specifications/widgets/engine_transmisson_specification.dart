import 'package:flikcar/models/buyer_car_model.dart';
import 'package:flikcar/screens/buy_car_flow/car_detailed_view/car_specifications/widgets/specification_text.dart';
import 'package:flikcar/utils/fonts.dart';
import 'package:flutter/material.dart';

class EngineTransmissonSpecification extends StatelessWidget {
  final BuyerCar car;
  EngineTransmissonSpecification({super.key, required this.car});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Engine & Transmission",
          style: AppFonts.w700black16,
        ),
        const SizedBox(
          height: 20,
        ),
        SpecificationText(
            title: "Ground Drivetrain", subtitle: "${car.drivetrain}"),
        SpecificationText(title: "Gear box", subtitle: "${car.gearBox}"),
        //  SpecificationText(title: "Number of gears", subtitle: "${car.n}"),
        SpecificationText(
            title: "Displacement", subtitle: "${car.displacement}"),
        SpecificationText(
            title: "Number of cylinders", subtitle: "${car.noOfCylinders}"),
        SpecificationText(
            title: "Transmission", subtitle: "${car.transmission}"),
        SpecificationText(
            title: "Valve/Cylinder (configuration)",
            subtitle: "${car.valveCylinders}"),
        SpecificationText(
            title: "Limited slip differential (LSD)",
            subtitle: "${car.limitedSlipDiffe}"),
        // SpecificationText(title: "Mild hybrid", subtitle: "${car.}"),
        SpecificationText(
            title: "Turbocharger", subtitle: "${car.turbocharger}"),
      ],
    );
  }
}
