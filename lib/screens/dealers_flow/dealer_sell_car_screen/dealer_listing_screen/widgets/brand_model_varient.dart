import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flikcar/models/brand_model_varient.dart';
import 'package:flikcar/services/dealer_upload_car.dart';
import 'package:flikcar/services/get_brand_model_varient.dart';
import 'package:flikcar/utils/colors.dart';
import 'package:flikcar/utils/fonts.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BrandVarientModelDropDown extends StatefulWidget {
  const BrandVarientModelDropDown({super.key});

  @override
  State<BrandVarientModelDropDown> createState() =>
      _BrandVarientModelDropDownState();
}

class _BrandVarientModelDropDownState extends State<BrandVarientModelDropDown> {
  String? selectedBrand;
  String? selectedModel;
  String? selectedVarient;
  List<Varient> varients = [];
  List<Model> models = [];
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
        "Brand*",
        style: AppFonts.w700black16,
      ),
      const SizedBox(
        height: 10,
      ),
      FutureBuilder<List<BrandModelVarient>>(
          future: GetBrandModelVarient.getBrandModelVarient(),
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
                  "Select a brand",
                  style: AppFonts.w500dark214,
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
                    Provider.of<DealerUploadCar>(context, listen: false)
                        .getBrandId(brandName: selectedBrand.toString());
                    models = snapshot.data!
                        .firstWhere((element) => element.name == value)
                        .models;
                  });
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
      ////////////////////////////////
      ///model
      Text(
        "Model*",
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
          "Select a model",
          style: AppFonts.w500dark214,
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
            Provider.of<DealerUploadCar>(context, listen: false)
                .getModelId(modelName: selectedModel!.toString());
            varients =
                models.firstWhere((element) => element.name == value).varients;
          });
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
        menuItemStyleData: const MenuItemStyleData(padding: EdgeInsets.all(0)),
      ),
      const SizedBox(
        height: 20,
      ),
      ////////////////////////
      ///varient
      Text(
        "Varient*",
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
          "Select a Varient",
          style: AppFonts.w500dark214,
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
            Provider.of<DealerUploadCar>(context, listen: false)
                .getVarientId(varientName: selectedVarient.toString());
          });
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
        menuItemStyleData: const MenuItemStyleData(padding: EdgeInsets.all(0)),
      )
    ]);
  }
}
