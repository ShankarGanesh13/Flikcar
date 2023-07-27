import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flikcar/screens/dealers_flow/dealer_sell_car_screen/dealer_listing_screen/widgets/specification_text_field.dart';
import 'package:flikcar/services/dealer_upload_car.dart';
import 'package:flikcar/utils/colors.dart';
import 'package:flikcar/utils/fonts.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SuspensionBrakes extends StatelessWidget {
  SuspensionBrakes({super.key});
  final TextEditingController frontSuspensionController =
      TextEditingController();
  final TextEditingController rearSuspensionController =
      TextEditingController();
  final TextEditingController steeringController = TextEditingController();

  List<String> items = ["Disc", "Drum"];
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Suspension,steering\n& brakes",
          style: AppFonts.w700black16,
        ),
        const SizedBox(height: 20),
        SpecificationTextField(
          maxLength: 20,
          title: "Suspension front type (Eg. Dual Beam)",
          controller: frontSuspensionController,
          keyboardType: TextInputType.text,
          onChanged: (value) {
            Provider.of<DealerUploadCar>(context, listen: false)
                .getFrontSuspension(frontsuspension: value);
          },
        ),
        SpecificationTextField(
          maxLength: 20,
          title: "Suspension rear (Eg. Dual Beam)",
          controller: rearSuspensionController,
          keyboardType: TextInputType.text,
          onChanged: (value) {
            Provider.of<DealerUploadCar>(context, listen: false)
                .getRearSuspension(rearsuspension: value);
          },
        ),
        dropDown(
            title: "Front brakes type",
            hint: "Select brake type",
            onChanged: (value) {
              Provider.of<DealerUploadCar>(context, listen: false)
                  .getFrontBrakes(frontbrake: value);
            }),
        dropDown(
            title: "Rear brakes type",
            hint: "Select brake type",
            onChanged: (value) {
              Provider.of<DealerUploadCar>(context, listen: false)
                  .getRearBrakes(rearbrake: value);
            }),
        SpecificationTextField(
          maxLength: 30,
          title: "Steering type (Eg. power steering)",
          controller: steeringController,
          keyboardType: TextInputType.text,
          onChanged: (value) {
            Provider.of<DealerUploadCar>(context, listen: false)
                .getSteering(steering: value);
          },
        ),
      ],
    );
  }

  dropDown({
    required String title,
    required String hint,
    required ValueChanged onChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppFonts.w500black12,
        ),
        const SizedBox(
          height: 10,
        ),
        DropdownButtonFormField2<String>(
          isExpanded: true,
          decoration: InputDecoration.collapsed(
            hintText: "",
            border: OutlineInputBorder(
                borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                borderSide: BorderSide(color: AppColors.p1)),
          ),
          hint: Text(
            hint,
            style: AppFonts.w500dark212,
          ),
          items: items
              .map((item) => DropdownMenuItem<String>(
                    value: item,
                    child: Text(item, style: AppFonts.w500black12),
                  ))
              .toList(),
          validator: (value) {
            if (value == null) {
              return hint;
            }
            return null;
          },
          onChanged: (value) {
            onChanged(value);
          },
          buttonStyleData: const ButtonStyleData(
            padding: EdgeInsets.only(
              left: 0,
              right: 5,
            ),
            height: 30,
          ),
          iconStyleData: const IconStyleData(
            icon: Icon(
              Icons.arrow_drop_down,
              color: Colors.black45,
            ),
            iconSize: 24,
          ),
          dropdownStyleData: DropdownStyleData(
            padding: const EdgeInsets.only(left: 5, right: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          menuItemStyleData: const MenuItemStyleData(
            padding: EdgeInsets.all(0),
          ),
        ),
        const SizedBox(
          height: 20,
        )
      ],
    );
  }
}
