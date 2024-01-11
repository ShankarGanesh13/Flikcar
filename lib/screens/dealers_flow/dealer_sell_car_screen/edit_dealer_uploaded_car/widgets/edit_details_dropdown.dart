import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flikcar/firebase_models/firebase_buyer_car.dart';
import 'package:flikcar/models/body_type_model.dart';
import 'package:flikcar/models/color_model.dart';
import 'package:flikcar/models/fuel_type_model.dart';
import 'package:flikcar/models/owner_type_model.dart';
import 'package:flikcar/services/dealer_upload_car.dart';
import 'package:flikcar/services/get_brand_model_varient.dart';
import 'package:flikcar/utils/colors.dart';
import 'package:flikcar/utils/fonts.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditDetailsDropDown extends StatefulWidget {
  final FirebaseBuyerCar car;
  final ValueChanged fuelOnChanged;
  final ValueChanged transmissionOnChanged;
  final ValueChanged colorOnChanged;
  final ValueChanged ownershipOnChanged;
  final ValueChanged bodyTypeOnChanged;

  const EditDetailsDropDown(
      {super.key,
      required this.car,
      required this.bodyTypeOnChanged,
      required this.colorOnChanged,
      required this.fuelOnChanged,
      required this.ownershipOnChanged,
      required this.transmissionOnChanged});

  @override
  State<EditDetailsDropDown> createState() => _EditDetailsDropDownState();
}

class _EditDetailsDropDownState extends State<EditDetailsDropDown> {
  String? selectedFuel;

  String? selectedBody;

  String? selectedColor;

  String? ownership;

  List<String> transmisson = ["Automatic", "Manual"];

  String? selectedTransmisson;

  @override
  void initState() {
    selectedFuel = widget.car.properties.fuelType;
    selectedBody = widget.car.properties.bodyType;
    selectedColor = widget.car.properties.color;
    ownership = widget.car.properties.ownerType;
    selectedTransmisson = widget.car.properties.transmission;
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Fuel type*",
          style: AppFonts.w700black16,
        ),
        const SizedBox(
          height: 10,
        ),
        FutureBuilder<List<FuelTypeModel>>(
            future: GetBrandModelVarient.getFuelType(),
            builder: (context, snapshot) {
              if (snapshot.data != null) {
                return DropdownButtonFormField2(
                  isExpanded: true,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(3),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(5.0)),
                        borderSide: BorderSide(color: AppColors.p1)),
                  ),
                  hint: Text(
                    "Select fuel type",
                    style: AppFonts.w500dark214,
                  ),
                  value: selectedFuel,
                  items: snapshot.data!
                      .map((item) => DropdownMenuItem(
                            value: item.fuelType,
                            child: Text(item.fuelType,
                                style: AppFonts.w500black14),
                          ))
                      .toList(),
                  validator: (value) {
                    if (value == null) {
                      return "Enter valid data";
                    }
                    return null;
                  },
                  onChanged: (value) {
                    selectedFuel = value;
                    widget.fuelOnChanged(value);
                  },
                  buttonStyleData: const ButtonStyleData(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    height: 40,
                  ),
                  iconStyleData: const IconStyleData(
                    icon: Icon(
                      Icons.arrow_drop_down,
                      color: Colors.black45,
                    ),
                    iconSize: 20,
                  ),
                  dropdownStyleData: DropdownStyleData(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  menuItemStyleData:
                      const MenuItemStyleData(padding: EdgeInsets.all(0)),
                );
              } else {
                return SizedBox();
              }
            }),
        const SizedBox(height: 20),
        ////////////////////////////////////////////
        ///BodyType
        Text(
          "Body Type*",
          style: AppFonts.w700black16,
        ),
        const SizedBox(
          height: 10,
        ),
        FutureBuilder<List<BodyTypeModel>>(
            future: GetBrandModelVarient.getBodyType(),
            builder: (context, snapshot) {
              if (snapshot.data != null) {
                return DropdownButtonFormField2(
                  isExpanded: true,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(3),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(5.0)),
                        borderSide: BorderSide(color: AppColors.p1)),
                  ),
                  hint: Text(
                    "Select body type",
                    style: AppFonts.w500dark214,
                  ),
                  value: selectedBody,
                  items: snapshot.data!
                      .map((item) => DropdownMenuItem(
                            value: item.bodyType,
                            child: Text(item.bodyType,
                                style: AppFonts.w500black14),
                          ))
                      .toList(),
                  validator: (value) {
                    if (value == null) {
                      return "Enter valid data";
                    }
                    return null;
                  },
                  onChanged: (value) {
                    selectedBody = value;
                    widget.bodyTypeOnChanged(value);
                  },
                  buttonStyleData: const ButtonStyleData(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    height: 40,
                  ),
                  iconStyleData: const IconStyleData(
                    icon: Icon(
                      Icons.arrow_drop_down,
                      color: Colors.black45,
                    ),
                    iconSize: 20,
                  ),
                  dropdownStyleData: DropdownStyleData(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  menuItemStyleData:
                      const MenuItemStyleData(padding: EdgeInsets.all(0)),
                );
              } else {
                return SizedBox();
              }
            }),
        const SizedBox(height: 20),
/////////////////////////////////////////////////////
        ///Owner
        Text(
          "Ownership*",
          style: AppFonts.w700black16,
        ),
        const SizedBox(
          height: 10,
        ),
        FutureBuilder<List<OwnerTypeModel>>(
            future: GetBrandModelVarient.getownership(),
            builder: (context, snapshot) {
              if (snapshot.data != null) {
                return DropdownButtonFormField2(
                  isExpanded: true,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(3),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(5.0)),
                        borderSide: BorderSide(color: AppColors.p1)),
                  ),
                  hint: Text(
                    "Select ownership",
                    style: AppFonts.w500dark214,
                  ),
                  value: ownership,
                  items: snapshot.data!
                      .map((item) => DropdownMenuItem(
                            value: item.ownerType,
                            child: Text(item.ownerType,
                                style: AppFonts.w500black14),
                          ))
                      .toList(),
                  validator: (value) {
                    if (value == null) {
                      return "Enter valid data";
                    }
                    return null;
                  },
                  onChanged: (value) {
                    ownership = value;
                    widget.ownershipOnChanged(value);
                  },
                  buttonStyleData: const ButtonStyleData(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    height: 40,
                  ),
                  iconStyleData: const IconStyleData(
                    icon: Icon(
                      Icons.arrow_drop_down,
                      color: Colors.black45,
                    ),
                    iconSize: 20,
                  ),
                  dropdownStyleData: DropdownStyleData(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  menuItemStyleData:
                      const MenuItemStyleData(padding: EdgeInsets.all(0)),
                );
              } else {
                return SizedBox();
              }
            }),
        const SizedBox(
          height: 20,
        ),
        ////////////////////////
        ///
        Text(
          "Color*",
          style: AppFonts.w700black16,
        ),
        const SizedBox(
          height: 10,
        ),
        FutureBuilder<List<ColorModel>>(
            future: GetBrandModelVarient.getColors(),
            builder: (context, snapshot) {
              if (snapshot.data != null) {
                return DropdownButtonFormField2(
                  isExpanded: true,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(3),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(5.0)),
                        borderSide: BorderSide(color: AppColors.p1)),
                  ),
                  hint: Text(
                    "Select a color",
                    style: AppFonts.w500dark214,
                  ),
                  value: selectedColor,
                  items: snapshot.data!
                      .map((item) => DropdownMenuItem(
                            value: item.color,
                            child: Row(
                              children: [
                                Container(
                                  height: 15,
                                  width: 25,
                                  decoration: BoxDecoration(
                                      color: Color(int.parse(
                                          "0xff${(item.hexCode.toUpperCase().replaceAll("#", ""))}")),
                                      borderRadius: BorderRadius.circular(3)),
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                Text(item.color, style: AppFonts.w500black14),
                              ],
                            ),
                          ))
                      .toList(),
                  validator: (value) {
                    if (value == null) {
                      return "Enter valid data";
                    }
                    return null;
                  },
                  onChanged: (value) {
                    selectedColor = value;
                    widget.colorOnChanged(value);
                  },
                  buttonStyleData: const ButtonStyleData(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    height: 40,
                  ),
                  iconStyleData: const IconStyleData(
                    icon: Icon(
                      Icons.arrow_drop_down,
                      color: Colors.black45,
                    ),
                    iconSize: 20,
                  ),
                  dropdownStyleData: DropdownStyleData(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  menuItemStyleData:
                      const MenuItemStyleData(padding: EdgeInsets.all(0)),
                );
              } else {
                return SizedBox();
              }
            }),
        const SizedBox(
          height: 20,
        ),
        /////////////////////////////////////
        ///Transmisson
        Text(
          "Transmisson*",
          style: AppFonts.w700black16,
        ),
        const SizedBox(
          height: 10,
        ),
        DropdownButtonFormField2(
          isExpanded: true,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(3),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            focusedBorder: OutlineInputBorder(
                borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                borderSide: BorderSide(color: AppColors.p1)),
          ),
          hint: Text(
            "Select transmisson type",
            style: AppFonts.w500dark214,
          ),
          value: selectedTransmisson,
          items: transmisson
              .map((item) => DropdownMenuItem(
                    value: item,
                    child: Text(item, style: AppFonts.w500black14),
                  ))
              .toList(),
          validator: (value) {
            if (value == null) {
              return "Enter valid data";
            }
            return null;
          },
          onChanged: (value) {
            selectedTransmisson = value;
            widget.transmissionOnChanged(value);
          },
          buttonStyleData: const ButtonStyleData(
            padding: EdgeInsets.only(left: 10, right: 10),
            height: 40,
          ),
          iconStyleData: const IconStyleData(
            icon: Icon(
              Icons.arrow_drop_down,
              color: Colors.black45,
            ),
            iconSize: 20,
          ),
          dropdownStyleData: DropdownStyleData(
            padding: const EdgeInsets.only(left: 10, right: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          menuItemStyleData:
              const MenuItemStyleData(padding: EdgeInsets.all(0)),
        ),
      ],
    );
  }
}
