import 'package:flikcar/services/search_service.dart';
import 'package:flikcar/utils/fonts.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FilterDisplayButton extends StatelessWidget {
  const FilterDisplayButton({Key? key});

  @override
  Widget build(BuildContext context) {
    List<String> model = context.watch<SearchService>().selectedModel;
    List<String> brand = context.watch<SearchService>().selectedBrand;
    List<String> fuelType =
        context.watch<SearchService>().selectedFuelTypeFilters;
    List<String> bodyType =
        context.watch<SearchService>().selectedBodyTypeFilters;
    List<String> transmission =
        context.watch<SearchService>().selectedTransmissionTypeFilters;
    List<String> ownerType =
        context.watch<SearchService>().selectedOwnershipTypeFilters;
    int? maxPrice = context.watch<SearchService>().maxPrice;
    int? minPrice = context.watch<SearchService>().minPrice;

    int? maxYear = context.watch<SearchService>().maxYear;
    int? minYear = context.watch<SearchService>().minYear;

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        //  alignment: WrapAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,

        children: [
          const SizedBox(
            width: 15,
          ),
          buildFilterRow(filters: model, context: context, type: "model"),
          const SizedBox(
            width: 5,
          ),
          buildFilterRow(filters: brand, context: context, type: "brand"),
          const SizedBox(
            width: 5,
          ),
          buildFilterRow(filters: fuelType, context: context, type: "fuel"),
          const SizedBox(
            width: 5,
          ),
          buildFilterRow(filters: ownerType, context: context, type: "owner"),
          const SizedBox(
            width: 5,
          ),
          buildFilterRow(filters: bodyType, context: context, type: "body"),
          const SizedBox(
            width: 5,
          ),
          buildFilterRow(
              filters: transmission, context: context, type: "transmission"),
          const SizedBox(
            width: 5,
          ),
          buildFilterRow(
              filters: maxYear != null && minYear != null
                  ? ["$minYear-$maxYear"]
                  : [],
              context: context,
              type: "year"),
          const SizedBox(
            width: 5,
          ),
          buildFilterRow(
              filters: maxPrice != null && minPrice != null
                  ? ["$minPrice-$maxPrice ₹"]
                  : [],
              context: context,
              type: "price"),
          const SizedBox(
            width: 5,
          ),
        ],
      ),
    );
  }

  Widget buildFilterRow(
      {required List<String> filters,
      required BuildContext context,
      required String type}) {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.start,
      alignment: WrapAlignment.start,
      runAlignment: WrapAlignment.start,

      spacing: 5.0, // Adjust spacing between items as needed
      children: filters.map((filter) {
        return Chip(
          deleteIcon: const Icon(
            Icons.close,
            size: 14,
          ),
          deleteIconColor: Colors.black,
          onDeleted: () {
            Provider.of<SearchService>(context, listen: false)
                .removeFilter(type: type, filter: filter);
          },
          label: Text(
            filter,
            style: AppFonts.w500black12,
          ),
        );
      }).toList(),
    );
  }
}
