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
  int selectedIndex = -1;
  @override
  Widget build(BuildContext context) {
    List<BodyTypeModel> bodyType = context.watch<SearchService>().bodyType;
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Body Type",
            style: AppFonts.w500dark214,
          ),
          const SizedBox(height: 10),
          Text(
            selectedIndex == -1
                ? "No body type selected"
                : bodyType[selectedIndex].bodyType,
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
                4,
                (index) => SizedBox(
                  width: 200,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                      });
                      Provider.of<SearchService>(context, listen: false)
                          .addBodytypeFilter(bodyType: [bodyType[index].id]);
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
                        Text(
                          bodyType[index].bodyType,
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
  }
}
