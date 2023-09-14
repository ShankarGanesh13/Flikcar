import 'package:flikcar/screens/dealers_flow/dealer_sell_car_screen/dealer_listing_screen/widgets/bool_dropdown_textfield.dart';
import 'package:flikcar/screens/dealers_flow/dealer_sell_car_screen/dealer_listing_screen/widgets/specification_text_field.dart';
import 'package:flikcar/services/dealer_upload_car.dart';
import 'package:flikcar/utils/fonts.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EngineTransmisson extends StatelessWidget {
  EngineTransmisson({super.key});

  TextEditingController driveTrainController = TextEditingController();

  TextEditingController gearboxController = TextEditingController();

  TextEditingController disController = TextEditingController();

  TextEditingController noOfCylinderController = TextEditingController();

  TextEditingController valveCylinderController = TextEditingController();

  TextEditingController lsdController = TextEditingController();

  TextEditingController ccController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Engine & Transmisson",
            style: AppFonts.w700black16,
          ),
          const SizedBox(
            height: 20,
          ),
          SpecificationTextField(
            maxLength: 4,
            title: "Engine (in CC)*",
            validator: true,
            controller: ccController,
            keyboardType: TextInputType.number,
            onChanged: (value) {
              Provider.of<DealerUploadCar>(context, listen: false)
                  .getEngineCC(cc: value);
            },
          ),
          Text(
            "Optional Details",
            style: AppFonts.w500black14,
          ),
          const SizedBox(
            height: 10,
          ),
          BoolDropdownTextField(
            title: "Turbocharger",
            selectedValue: "",
            validator: false,
            onChanged: (value) {
              Provider.of<DealerUploadCar>(context, listen: false)
                  .getTurboCharger(turbocharger: value);
            },
          ),
          BoolDropdownTextField(
            title: "Limited slip differential (LSD)",
            selectedValue: "",
            validator: false,
            onChanged: (value) {
              Provider.of<DealerUploadCar>(context, listen: false)
                  .getLsd(lsd: value);
            },
          ),
          SpecificationTextField(
            maxLength: 2,
            title: "Number of cylinders",
            validator: false,
            controller: noOfCylinderController,
            keyboardType: TextInputType.number,
            onChanged: (value) {
              Provider.of<DealerUploadCar>(context, listen: false)
                  .getNoOfCylinder(noCylinder: value);
            },
          ),
          SpecificationTextField(
            maxLength: 30,
            title: "Drivetrain (eg. front wheel drive)",
            controller: driveTrainController,
            validator: false,
            keyboardType: TextInputType.text,
            onChanged: (value) {
              Provider.of<DealerUploadCar>(context, listen: false)
                  .getDriveTrain(drivetrain: value);
            },
          ),
          SpecificationTextField(
            maxLength: 30,
            title: "Number of gear",
            controller: gearboxController,
            validator: false,
            keyboardType: TextInputType.number,
            onChanged: (value) {
              Provider.of<DealerUploadCar>(context, listen: false)
                  .getGearbox(gearbox: value);
            },
          ),
          SpecificationTextField(
            maxLength: 4,
            title: "Displacement (in mm)",
            validator: false,
            controller: disController,
            keyboardType: TextInputType.number,
            onChanged: (value) {
              Provider.of<DealerUploadCar>(context, listen: false)
                  .getCc(cc: value);
            },
          ),
          SpecificationTextField(
            maxLength: 10,
            title: "Valve/cylinder (configuration)",
            controller: valveCylinderController,
            validator: false,
            keyboardType: TextInputType.number,
            onChanged: (value) {
              Provider.of<DealerUploadCar>(context, listen: false)
                  .getValve(valve: value);
            },
          ),
          const SizedBox(
            height: 60,
          )
        ],
      ),
    );
  }
}
