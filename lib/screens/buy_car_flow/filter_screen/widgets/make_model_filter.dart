import 'package:expansion_tile_group/expansion_tile_group.dart';
import 'package:flikcar/common_widgets/loading_widget.dart';
import 'package:flikcar/models/car_brand_model.dart';
import 'package:flikcar/screens/buy_car_flow/filter_screen/widgets/custom_checkbox.dart';
import 'package:flikcar/services/get_car_details.dart';
import 'package:flikcar/services/search_service.dart';
import 'package:flikcar/utils/colors.dart';
import 'package:flikcar/utils/fonts.dart';
import 'package:flutter/material.dart';

import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:provider/provider.dart';

class MakeModelFilters extends StatefulWidget {
  const MakeModelFilters({super.key});

  @override
  State<MakeModelFilters> createState() => _MakeModelFiltersState();
}

class _MakeModelFiltersState extends State<MakeModelFilters> {
  List<CarBrandModel> carBrandList = [];
  List<CarModel> carModelList = [];
  @override
  Widget build(BuildContext context) {
    List<CarBrandModel> carBrandModel =
        context.watch<SearchService>().brandAndModel;

    return SizedBox(
        width: MediaQuery.of(context).size.width / 1.7,
        child: ExpansionTileGroup(
          spaceBetweenItem: 0,
          children: questions(carBrand: carBrandModel),
        ));
  }

  List<ExpansionTileItem> questions({required List<CarBrandModel> carBrand}) {
    return List.generate(
        carBrand.length,
        (brandIndex) => ExpansionTileItem(
                collapsedBackgroundColor: Colors.white,
                backgroundColor: Colors.transparent,
                title: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        if (carBrand[brandIndex].isSelected == true) {
                          carBrand[brandIndex].isSelected = false;
                          carBrandList.removeWhere(
                              (element) => element.isSelected == false);
                        } else if (carBrand[brandIndex].isSelected == false) {
                          carBrand[brandIndex].isSelected = true;
                          carBrandList.add(carBrand[brandIndex]);
                        }

                        setState(() {});
                        Provider.of<SearchService>(context, listen: false)
                            .addBrandFilter(brands: carBrandList);
                        print(carBrandList);
                      },
                      child: Container(
                        margin: const EdgeInsets.only(right: 8),
                        height: 15,
                        width: 15,
                        decoration: BoxDecoration(
                            border: Border.all(color: const Color(0xff161F31))),
                        child: Center(
                            child: Icon(
                          Icons.check,
                          size: 14,
                          color: carBrand[brandIndex].isSelected == true
                              ? AppColors.s1
                              : Colors.transparent,
                          weight: 2,
                        )),
                      ),
                    ),
                    Text(
                      carBrand[brandIndex].brandName,
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
                ]));
  }

  List<Widget> modelCheckBox(List<CarModel> models) {
    return List.generate(
      models.length,
      (index) => Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: InkWell(
          onTap: () {
            if (models[index].isSelected == true) {
              models[index].isSelected = false;
              carModelList
                  .removeWhere((element) => element.isSelected == false);
            } else if (models[index].isSelected == false) {
              models[index].isSelected = true;
              carModelList.add(models[index]);
            }
            setState(() {});
            Provider.of<SearchService>(context, listen: false)
                .addmodelFilter(models: carModelList);
            print(carModelList);
          },
          child: Row(
            children: [
              Container(
                margin: const EdgeInsets.only(right: 8),
                height: 15,
                width: 15,
                decoration: BoxDecoration(
                    border: Border.all(
                  color: const Color(0xff161F31),
                )),
                child: Center(
                  child: Icon(
                    Icons.check,
                    size: 14,
                    color: models[index].isSelected == true
                        ? AppColors.s1
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
                child: Text(models[index].model,
                    maxLines: 1, style: AppFonts.w500dark214),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
