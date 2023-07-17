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
    List<OwnerTypeModel> owners = context.watch<SearchService>().ownership;
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Number of Owners",
            style: AppFonts.w500dark214,
          ),
          const SizedBox(height: 10),
          Text(
            selectedIndex == -1
                ? "Not selected"
                : owners[selectedIndex].ownerType,
            style: AppFonts.w700black14,
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
                owners.length,
                (index) => SizedBox(
                  width: 200,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                      });
                      Provider.of<SearchService>(context, listen: false)
                          .addOwnersFilter(owner: [owners[index].id]);
                    },
                    child: Row(
                      children: [
                        Container(
                          height: 15,
                          width: 15,
                          decoration: BoxDecoration(
                              border:
                                  Border.all(color: const Color(0xff161F31))),
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
                        Text(
                          owners[index].ownerType,
                          style: AppFonts.w500dark214,
                        )
                      ],
                    ),
                  ),
                ),
              ))
        ],
      ),
    );
    ;
  }
}
