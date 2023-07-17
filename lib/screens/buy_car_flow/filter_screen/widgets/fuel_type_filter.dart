import 'package:flikcar/models/fuel_type_model.dart';
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
  int selectedIndex = -1;
  @override
  Widget build(BuildContext context) {
    List<FuelTypeModel> fuelType = context.watch<SearchService>().fuel;

    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: SizedBox(
        width: MediaQuery.of(context).size.width / 2,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Fuel Type",
              style: AppFonts.w500dark214,
            ),
            const SizedBox(height: 10),
            Text(
              selectedIndex == -1
                  ? "No fuel type selected"
                  : fuelType[selectedIndex].fuelType,
              style: AppFonts.w700black16,
            ),
            const SizedBox(height: 30),
            Text(
              "Suggestions",
              style: AppFonts.w700black16,
            ),
            const SizedBox(height: 20),
            Wrap(
                direction: Axis.vertical,
                runSpacing: 20,
                spacing: 20,
                children: List.generate(
                  5,
                  (index) => SizedBox(
                    width: 200,
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedIndex = index;
                        });
                        Provider.of<SearchService>(context, listen: false)
                            .addFuelFilter(fuel: [fuelType[selectedIndex].id]);
                      },
                      child: Row(
                        children: [
                          Container(
                            height: 15,
                            width: 15,
                            decoration: BoxDecoration(
                                border: Border.all(color: Color(0xff161F31))),
                            child: Center(
                                child: Icon(
                              Icons.check,
                              size: 14,
                              color: selectedIndex == index
                                  ? AppColors.s1
                                  : Colors.transparent,
                              weight: 2,
                            )),
                          ),
                          const SizedBox(width: 10),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 2.4,
                            child: Text(
                              fuelType[index].fuelType,
                              maxLines: 1,
                              style: AppFonts.w500dark214,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
