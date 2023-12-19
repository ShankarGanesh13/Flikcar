import 'package:flikcar/models/body_type_model.dart';
import 'package:flikcar/services/search_service.dart';
import 'package:flikcar/utils/colors.dart';
import 'package:flikcar/utils/fonts.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BodyTypeFilter extends StatefulWidget {
  const BodyTypeFilter({super.key});

  @override
  State<BodyTypeFilter> createState() => _BodyTypeFilterState();
}

class _BodyTypeFilterState extends State<BodyTypeFilter> {
  @override
  Widget build(BuildContext context) {
    List<BodyTypeModel> bodyType = context.watch<SearchService>().bodyType;
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          Text(
            "Body Type",
            style: AppFonts.w700black16,
          ),
          const SizedBox(height: 10),
          SizedBox(
            width: MediaQuery.of(context).size.width / 2,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: bodyType.length,
              itemBuilder: (context, index) {
                return SizedBox(
                  height: 45,
                  child: CheckboxListTile(
                    contentPadding:
                        const EdgeInsets.only(left: 0, right: 0, top: 0),
                    activeColor: AppColors.p2,
                    title: Text(
                      bodyType[index].bodyType,
                      style: AppFonts.w500black14,
                    ),
                    value: bodyType[index].isSelected,
                    onChanged: (bool? value) {
                      setState(() {
                        bodyType[index].isSelected = value!;
                      });
                      Provider.of<SearchService>(context, listen: false)
                          .getSelectedBodyTypeFilter(
                              bodyTypeFilter: bodyType[index].bodyType);
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
