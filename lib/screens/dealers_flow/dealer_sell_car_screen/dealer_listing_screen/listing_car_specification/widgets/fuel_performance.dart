import 'package:flikcar/screens/dealers_flow/dealer_sell_car_screen/dealer_listing_screen/widgets/specification_text_field.dart';
import 'package:flikcar/services/dealer_upload_car.dart';
import 'package:flikcar/utils/fonts.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FuelPerformance extends StatelessWidget {
  FuelPerformance({super.key});

  final TextEditingController powerController = TextEditingController();

  final TextEditingController torqueController = TextEditingController();

  final TextEditingController mileageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Fuel & Performance",
          style: AppFonts.w700black16,
        ),
        const SizedBox(
          height: 20,
        ),
        SpecificationTextField(
          maxLength: 5,
          title: "Max power (in bhp)*",
          validator: true,
          keyboardType: TextInputType.number,
          controller: powerController,
          onChanged: (value) {
            Provider.of<DealerUploadCar>(context, listen: false)
                .getPowerDetails(power: value);
          },
        ),
        SpecificationTextField(
          maxLength: 5,
          title: "Max torque (in nm)*",
          validator: true,
          keyboardType: TextInputType.number,
          controller: torqueController,
          onChanged: (value) {
            Provider.of<DealerUploadCar>(context, listen: false)
                .getTorqueDetails(torque: value);
          },
        ),
        SpecificationTextField(
          maxLength: 5,
          title: "Mileage (ARAI) in kmpl*",
          keyboardType: TextInputType.number,
          validator: true,
          controller: mileageController,
          onChanged: (value) {
            Provider.of<DealerUploadCar>(context, listen: false)
                .getMileage(kmpl: value);
          },
        ),
        // const SpecificationTextField(
        //     maxLength: 5, title: "Max power (bhp @ rpm)"),
        // const SpecificationTextField(
        //     maxLength: 5, title: "Max power (nm @ rpm)")
      ],
    );
  }
}
