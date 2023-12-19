import 'package:expansion_tile_group/expansion_tile_group.dart';
import 'package:flikcar/common_widgets/loading_widget.dart';
import 'package:flikcar/models/brand_model_varient.dart';
import 'package:flikcar/screens/buy_car_flow/filter_screen/widgets/custom_checkbox.dart';
import 'package:flikcar/services/get_car_details.dart';
import 'package:flikcar/services/search_service.dart';
import 'package:flikcar/utils/colors.dart';
import 'package:flikcar/utils/fonts.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MakeModelFilters extends StatefulWidget {
  const MakeModelFilters({super.key});

  @override
  State<MakeModelFilters> createState() => _MakeModelFiltersState();
}

class _MakeModelFiltersState extends State<MakeModelFilters> {
  List<BrandModelVarient> carBrandList = [];
  List<Model> carModelList = [];
  @override
  Widget build(BuildContext context) {
    carBrandList = context.watch<SearchService>().brandModel;
    return SizedBox(
        width: MediaQuery.of(context).size.width / 1.7,
        child: ExpansionTileGroup(
          spaceBetweenItem: 0,
          children: questions(carBrand: carBrandList),
        ));
  }

  List<ExpansionTileItem> questions(
      {required List<BrandModelVarient> carBrand}) {
    return List.generate(
        carBrand.length,
        (brandIndex) => ExpansionTileItem(
              collapsedBackgroundColor: Colors.white,
              backgroundColor: Colors.transparent,
              title: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      if (carBrandList[brandIndex].isSelected == false) {
                        carBrandList[brandIndex].isSelected = true;
                      } else {
                        carBrandList[brandIndex].isSelected = false;
                      }
                      setState(() {});
                      Provider.of<SearchService>(context, listen: false)
                          .getSelectedBrand(brand: carBrand[brandIndex].name);
                    },
                    child: Container(
                      margin: const EdgeInsets.only(right: 8),
                      height: 15,
                      width: 15,
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: carBrand[brandIndex].isSelected == true
                                ? AppColors.p2
                                : const Color(0xff161F31)),
                        color: carBrand[brandIndex].isSelected == true
                            ? AppColors.p2
                            : Colors.white,
                      ),
                      child: Center(
                          child: Icon(
                        Icons.check,
                        size: 14,
                        color: carBrand[brandIndex].isSelected == true
                            ? Colors.white
                            : Colors.transparent,
                        weight: 2,
                      )),
                    ),
                  ),
                  Text(
                    carBrand[brandIndex].name,
                    style: AppFonts.w700black16,
                  ),
                ],
              ),
              iconColor: AppColors.p2,
              themeData: ThemeData(
                  splashColor: Colors.transparent,
                  splashFactory: NoSplash.splashFactory),
              collapsedIconColor: AppColors.p2,
              expendedBorderColor: Colors.white,
              tilePadding:
                  const EdgeInsets.only(left: 15, bottom: 0, right: 15),
              childrenPadding: const EdgeInsets.only(
                  top: 0, left: 15, right: 15, bottom: 15),
              children: [
                SizedBox(
                  child: Column(
                      children: modelCheckBox(carBrand[brandIndex].models)),
                ),
              ],
            ));
  }

  List<Widget> modelCheckBox(List<Model> models) {
    return List.generate(
      models.length,
      (index) => Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: InkWell(
          onTap: () {
            if (models[index].isSelected == true) {
              models[index].isSelected = false;
            } else if (models[index].isSelected == false) {
              models[index].isSelected = true;
            }
            setState(() {});
            Provider.of<SearchService>(context, listen: false)
                .getSelectedModel(model: models[index].name);
            // print(carModelList);
          },
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.only(right: 8),
                height: 15,
                width: 15,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: models[index].isSelected == true
                        ? AppColors.p2
                        : const Color(0xff161F31),
                  ),
                  color: models[index].isSelected ? AppColors.p2 : Colors.white,
                ),
                child: Center(
                  child: Icon(
                    Icons.check,
                    size: 14,
                    color: models[index].isSelected == true
                        ? Colors.white
                        : Colors.transparent,
                    weight: 2,
                  ),
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 2.4,
                child: Text(models[index].name,
                    maxLines: 1, style: AppFonts.w500dark214),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
