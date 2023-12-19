import 'package:flikcar/models/owner_type_model.dart';
import 'package:flikcar/services/search_service.dart';
import 'package:flikcar/utils/colors.dart';
import 'package:flikcar/utils/fonts.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OwnersFilter extends StatefulWidget {
  const OwnersFilter({super.key});

  @override
  State<OwnersFilter> createState() => _OwnersFilterState();
}

class _OwnersFilterState extends State<OwnersFilter> {
  int selectedIndex = -1;
  @override
  Widget build(BuildContext context) {
    List<OwnerTypeModel> ownershipType =
        context.watch<SearchService>().ownershipType;
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: SizedBox(
        width: MediaQuery.of(context).size.width / 2,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            Text(
              "Ownership Type",
              style: AppFonts.w700black16,
            ),
            const SizedBox(height: 10),
            ListView.builder(
              shrinkWrap: true,
              itemCount: ownershipType.length,
              itemBuilder: (context, index) {
                return SizedBox(
                  height: 45,
                  child: CheckboxListTile(
                    contentPadding:
                        const EdgeInsets.only(left: 0, right: 0, top: 0),
                    activeColor: AppColors.p2,
                    title: Text(
                      ownershipType[index].ownerType,
                      style: AppFonts.w500black14,
                    ),
                    value: ownershipType[index].isSelected,
                    onChanged: (bool? value) {
                      setState(() {
                        ownershipType[index].isSelected = value!;
                      });
                      Provider.of<SearchService>(context, listen: false)
                          .getSelectedOwnerTypeFilter(
                              ownershipFilter: ownershipType[index].ownerType);
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
    ;
  }
}
