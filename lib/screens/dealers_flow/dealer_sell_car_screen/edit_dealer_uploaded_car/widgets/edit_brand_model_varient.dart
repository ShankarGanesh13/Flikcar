import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flikcar/firebase_models/firebase_buyer_car.dart';
import 'package:flikcar/models/brand_model_varient.dart';
import 'package:flikcar/services/dealer_upload_car.dart';
import 'package:flikcar/services/get_brand_model_varient.dart';
import 'package:flikcar/utils/colors.dart';
import 'package:flikcar/utils/fonts.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditBrandVarientModelDropDown extends StatefulWidget {
  final FirebaseBuyerCar car;
  final ValueChanged brandOnChanged;
  final ValueChanged modelOnChanged;
  final ValueChanged varientOnChanged;
  const EditBrandVarientModelDropDown(
      {super.key,
      required this.car,
      required this.brandOnChanged,
      required this.modelOnChanged,
      required this.varientOnChanged});

  @override
  State<EditBrandVarientModelDropDown> createState() =>
      _EditBrandVarientModelDropDownState();
}

class _EditBrandVarientModelDropDownState
    extends State<EditBrandVarientModelDropDown> {
  String? selectedBrand;
  String? selectedModel;
  String? selectedVarient;
  List<Varient> varients = [];
  List<Model> models = [];
  @override
  void initState() {
    selectedBrand = widget.car.properties.brand;
    selectedModel = widget.car.properties.model;
    selectedVarient = widget.car.properties.variant;
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
        "Brand *",
        style: AppFonts.w700black16,
      ),
      const SizedBox(
        height: 8,
      ),
      FutureBuilder<List<BrandModelVarient>>(
          future: GetBrandModelVarient.getBrandModelVarient(),
          builder: (context, snapshot) {
            if (snapshot.data != null) {
              return DropdownButtonFormField2<String>(
                isExpanded: true,
                decoration: const InputDecoration.collapsed(
                  hintText: "Select a brand",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(3.0),
                    ),
                    borderSide: BorderSide(color: Colors.black),
                  ),
                ),
                hint: Text(
                  "Select a brand",
                  style: AppFonts.w500dark212,
                ),
                value: selectedBrand,
                items: snapshot.data!
                    .map((item) => DropdownMenuItem(
                          value: item.name,
                          child: Text(item.name, style: AppFonts.w500black14),
                        ))
                    .toList(),
                validator: (value) {
                  if (value == null) {
                    return "Enter valid data";
                  }
                  return null;
                },
                onChanged: (value) {
                  setState(() {
                    selectedModel = null;
                    selectedVarient = null;
                    selectedBrand = value;
                    widget.brandOnChanged(value);
                    // Provider.of<DealerUploadCar>(context, listen: false)
                    //     .getBrandId(brandName: selectedBrand.toString());
                    models = snapshot.data!
                        .firstWhere((element) => element.name == value)
                        .models;
                  });
                },
                buttonStyleData: const ButtonStyleData(
                  padding: EdgeInsets.only(
                    left: 0,
                    right: 5,
                  ),
                  height: 40,
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
        height: 25,
      ),
      ////////////////////////////////
      ///model
      Text(
        "Model *",
        style: AppFonts.w700black16,
      ),
      const SizedBox(
        height: 8,
      ),
      DropdownButtonFormField2<String>(
        isExpanded: true,
        decoration: const InputDecoration.collapsed(
          hintText: "Select a model",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(3.0),
            ),
            borderSide: BorderSide(color: Colors.black),
          ),
        ),
        hint: Text(
          "Select a model",
          style: AppFonts.w500dark212,
        ),
        value: selectedModel,
        items: models
            .map((item) => DropdownMenuItem(
                  value: item.name,
                  child: Text(item.name, style: AppFonts.w500black14),
                ))
            .toList(),
        validator: (value) {
          if (value == null) {
            return "Enter valid data";
          }
          return null;
        },
        onChanged: (value) {
          setState(() {
            selectedVarient = null;
            selectedModel = value;
            widget.modelOnChanged(value);
            // Provider.of<DealerUploadCar>(context, listen: false)
            //     .getModelId(modelName: selectedModel!.toString());
            varients =
                models.firstWhere((element) => element.name == value).varients;
          });
        },
        buttonStyleData: const ButtonStyleData(
          padding: EdgeInsets.only(
            left: 0,
            right: 5,
          ),
          height: 40,
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
        height: 25,
      ),
      ////////////////////////
      ///varient
      Text(
        "Varient *",
        style: AppFonts.w700black16,
      ),
      const SizedBox(
        height: 10,
      ),
      DropdownButtonFormField2<String>(
        isExpanded: true,
        decoration: const InputDecoration.collapsed(
          hintText: "Select a value",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(3.0),
            ),
            borderSide: BorderSide(color: Colors.black),
          ),
        ),
        hint: Text(
          "Select a varient",
          style: AppFonts.w500dark212,
        ),
        value: selectedVarient,
        items: varients
            .map((item) => DropdownMenuItem(
                  value: item.name,
                  child: Text(item.name, style: AppFonts.w500black14),
                ))
            .toList(),
        validator: (value) {
          if (value == null) {
            return "Enter valid data";
          }
          return null;
        },
        onChanged: (value) {
          setState(() {
            selectedVarient = value;
            widget.varientOnChanged(value);
            // Provider.of<DealerUploadCar>(context, listen: false)
            //     .getVarientId(varientName: selectedVarient.toString());
          });
        },
        buttonStyleData: const ButtonStyleData(
          padding: EdgeInsets.only(
            left: 0,
            right: 5,
          ),
          height: 40,
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
    ]);
  }
}
