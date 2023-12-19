import 'package:flikcar/models/fuel_type_model.dart';
import 'package:flikcar/services/get_brand_model_varient.dart';
import 'package:flikcar/services/search_service.dart';
import 'package:flikcar/utils/colors.dart';
import 'package:flikcar/utils/fonts.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FuelTypeFilter extends StatefulWidget {
  const FuelTypeFilter({super.key});

  @override
  State<FuelTypeFilter> createState() => _FuelTypeFilterState();
}

class _FuelTypeFilterState extends State<FuelTypeFilter> {
  List<FuelTypeModel> fuelTypes = [];
  @override
  Widget build(BuildContext context) {
    fuelTypes = context.watch<SearchService>().fuelTypes;

    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: SizedBox(
          width: MediaQuery.of(context).size.width / 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              Text(
                "Fuel Types",
                style: AppFonts.w700black16,
              ),
              const SizedBox(height: 10),
              ListView.builder(
                shrinkWrap: true,
                itemCount: fuelTypes.length,
                itemBuilder: (context, index) {
                  return SizedBox(
                    height: 45,
                    child: CheckboxListTile(
                      contentPadding:
                          const EdgeInsets.only(left: 0, right: 0, top: 0),
                      activeColor: AppColors.p2,
                      title: Text(
                        fuelTypes[index].fuelType,
                        style: AppFonts.w500black14,
                      ),
                      value: fuelTypes[index].isSelected,
                      onChanged: (bool? value) {
                        setState(() {
                          fuelTypes[index].isSelected = value!;
                        });
                        Provider.of<SearchService>(context, listen: false)
                            .getSelectedFuelTypeFilter(
                                fuelFilter: fuelTypes[index].fuelType);
                        // SearchService().getSelectedFuelTypeFilter(
                        //     fuelFilter: fuelTypes[index].fuelType);
                      },
                    ),
                  );
                },
              ),
            ],
          )),
    );
  }
}
