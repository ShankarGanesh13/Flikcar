import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flikcar/models/seats_model.dart';
import 'package:flikcar/screens/dealers_flow/dealer_sell_car_screen/dealer_listing_screen/widgets/bool_dropdown_textfield.dart';
import 'package:flikcar/screens/dealers_flow/dealer_sell_car_screen/dealer_listing_screen/widgets/specification_text_field.dart';
import 'package:flikcar/services/dealer_upload_car.dart';
import 'package:flikcar/services/get_brand_model_varient.dart';
import 'package:flikcar/utils/colors.dart';
import 'package:flikcar/utils/fonts.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DimensionCapacity extends StatelessWidget {
  DimensionCapacity({super.key});

  TextEditingController groundClearanceController = TextEditingController();

  TextEditingController seatCapacityController = TextEditingController();

  TextEditingController bootController = TextEditingController();

  TextEditingController seatRowController = TextEditingController();

  TextEditingController fuelCapacityController = TextEditingController();

  TextEditingController wheelbaseController = TextEditingController();

  TextEditingController lengthController = TextEditingController();

  TextEditingController frontTyresController = TextEditingController();

  TextEditingController rearTyresController = TextEditingController();

  TextEditingController heightController = TextEditingController();

  TextEditingController widthController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Dimensions & Capacity",
            style: AppFonts.w700black16,
          ),
          const SizedBox(
            height: 20,
          ),
          SpecificationTextField(
            maxLength: 5,
            keyboardType: TextInputType.number,
            controller: groundClearanceController,
            title: "Ground Clearence (in mm)",
            onChanged: (value) {
              Provider.of<DealerUploadCar>(context, listen: false)
                  .getGroundClearance(clearance: int.parse(value));
            },
          ),
          dropDown(),
          SpecificationTextField(
            maxLength: 5,
            title: "Boot space(in litres)",
            keyboardType: TextInputType.number,
            controller: bootController,
            onChanged: (value) {
              Provider.of<DealerUploadCar>(context, listen: false)
                  .getBootSpace(boot: int.parse(value));
            },
          ),
          SpecificationTextField(
            keyboardType: TextInputType.number,
            maxLength: 5,
            controller: fuelCapacityController,
            title: "Fuel tank capacity(in litres)",
            onChanged: (value) {
              Provider.of<DealerUploadCar>(context, listen: false)
                  .getFuelCapacity(capacity: int.parse(value));
            },
          ),
          SpecificationTextField(
            maxLength: 5,
            title: "Wheelbase (in mm)",
            keyboardType: TextInputType.number,
            controller: wheelbaseController,
            onChanged: (value) {
              Provider.of<DealerUploadCar>(context, listen: false)
                  .getWheelbase(wheelbasevalue: int.parse(value));
            },
          ),
          SpecificationTextField(
            maxLength: 5,
            controller: lengthController,
            title: "Length (in mm)",
            keyboardType: TextInputType.number,
            onChanged: (value) {
              Provider.of<DealerUploadCar>(context, listen: false)
                  .getLength(carLength: int.parse(value));
            },
          ),
          SpecificationTextField(
            maxLength: 5,
            title: "Front tyres size",
            controller: frontTyresController,
            keyboardType: TextInputType.number,
            onChanged: (value) {
              Provider.of<DealerUploadCar>(context, listen: false)
                  .getFrontTyres(frontTyresValue: int.parse(value));
            },
          ),
          SpecificationTextField(
            maxLength: 5,
            controller: rearTyresController,
            title: "Rear tyres size",
            keyboardType: TextInputType.number,
            onChanged: (value) {
              Provider.of<DealerUploadCar>(context, listen: false)
                  .getRearTyres(rearTyreValue: int.parse(value));
            },
          ),
          SpecificationTextField(
            maxLength: 5,
            controller: heightController,
            title: "Height (in mm)",
            keyboardType: TextInputType.number,
            onChanged: (value) {
              Provider.of<DealerUploadCar>(context, listen: false)
                  .getHeight(heightValue: int.parse(value));
            },
          ),
          SpecificationTextField(
            maxLength: 5,
            controller: widthController,
            title: "Width (in mm)",
            keyboardType: TextInputType.number,
            onChanged: (value) {
              Provider.of<DealerUploadCar>(context, listen: false)
                  .getWidth(widthValue: int.parse(value));
            },
          ),
          BoolDropdownTextField(
            title: "Wheel cover",
            selectedValue: "",
            onChanged: (value) {
              Provider.of<DealerUploadCar>(context, listen: false)
                  .getWheelCover(wheelcover: value);
            },
          ),
          BoolDropdownTextField(
            title: "Alloy wheels",
            selectedValue: "",
            onChanged: (value) {
              Provider.of<DealerUploadCar>(context, listen: false)
                  .getAlloyWheel(alloywheel: value);
            },
          ),
          BoolDropdownTextField(
            title: "Spare wheel",
            selectedValue: "",
            onChanged: (value) {
              Provider.of<DealerUploadCar>(context, listen: false)
                  .getSpareWheel(sparewheel: value);
            },
          ),
          const SizedBox(
            height: 100,
          ),
        ],
      ),
    );
  }

  dropDown() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Seating Capacity",
          style: AppFonts.w500black12,
        ),
        const SizedBox(
          height: 10,
        ),
        FutureBuilder<List<SeatsModel>>(
            future: GetBrandModelVarient.getSeats(),
            builder: (context, snapshot) {
              if (snapshot.data != null) {
                return DropdownButtonFormField2<int>(
                  isExpanded: true,
                  decoration: InputDecoration.collapsed(
                    hintText: "",
                    border: OutlineInputBorder(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(5.0)),
                        borderSide: BorderSide(color: AppColors.p1)),
                  ),
                  hint: Text(
                    "Select seating capacity",
                    style: AppFonts.w500dark212,
                  ),
                  items: snapshot.data!
                      .map((item) => DropdownMenuItem<int>(
                            value: item.id,
                            child: Text(item.noOfSeats.toString(),
                                style: AppFonts.w500black12),
                          ))
                      .toList(),
                  validator: (value) {
                    if (value == null) {
                      return "Select valid data";
                    }
                    return null;
                  },
                  onChanged: (value) {
                    Provider.of<DealerUploadCar>(context, listen: false)
                        .getSeatCapacity(capacity: value!);
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
                );
              } else {
                return const SizedBox();
              }
            }),
        const SizedBox(
          height: 20,
        )
      ],
    );
  }
}
