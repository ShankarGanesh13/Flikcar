import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flikcar/models/brand_model_varient.dart';
import 'package:flikcar/services/get_brand_model_varient.dart';
import 'package:flikcar/utils/colors.dart';
import 'package:flikcar/utils/fonts.dart';
import 'package:flutter/material.dart';

class BrandModelVarientDropDown extends StatefulWidget {
  BrandModelVarientDropDown({super.key});

  @override
  State<BrandModelVarientDropDown> createState() =>
      _BrandModelVarientDropDownState();
}

class _BrandModelVarientDropDownState extends State<BrandModelVarientDropDown> {
  @override
  void initState() {
    // GetBrandModelVarient().getAllBrands();
    //  GetBrandModelVarient().getAllModel();
    super.initState();
  }

  Model? model;
  List<BrandModelVarient> brands = [];
  List<Model> models = [];
  List<Varient> varients = [];
  BrandModelVarient? selectedBrand;
  Model? selectedModel;
  Varient? selectedVariant;
  int? selectedModelId;
  int? selectedBrandId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [
      SizedBox(
        height: 100,
      ),
      FutureBuilder<List<BrandModelVarient>>(
          future: GetBrandModelVarient().getBrandModelVarient(),
          builder: (context, snapshot) {
            if (snapshot.data != null) {
              brands = snapshot.data!;
              return DropdownButtonFormField2<int>(
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
                  "select a brand",
                  style: AppFonts.w500dark214,
                ),
                items: brands
                    .map((item) => DropdownMenuItem<int>(
                          value: item.id,
                          child: Text(item.name, style: AppFonts.w500black14),
                        ))
                    .toList(),
                validator: (value) {
                  if (value == null) {
                    return "error";
                  }
                  return null;
                },
                onChanged: (value) {
                  setState(() {
                    models = [];
                    selectedBrandId = null;

                    selectedModelId = null;
                    selectedBrandId = value;
                    models = snapshot.data!
                        .firstWhere((element) => element.id == selectedBrandId)
                        .models;
                    print(models);
                  });
                  print(selectedBrandId);
                },
                value: selectedBrandId,
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
      DropdownButtonFormField2<int>(
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
          "select a brand",
          style: AppFonts.w500dark214,
        ),
        value: selectedModelId,
        items: models
            .map((item) => DropdownMenuItem<int>(
                  value: item.modelId,
                  child: Text(item.name, style: AppFonts.w500black14),
                ))
            .toList(),
        validator: (value) {
          if (value == null) {
            return "error";
          }
          return null;
        },
        onChanged: (value) {
          selectedModelId = value;
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
    ]));
  }

// //   getModelList(int id) {
// //  Li  Model model= brands.firstWhere((element) => element.id == id).model;
// //   }
}
