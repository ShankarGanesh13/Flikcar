import 'package:expansion_tile_group/expansion_tile_group.dart';
import 'package:flikcar/common_widgets/heading1.dart';
import 'package:flikcar/utils/colors.dart';
import 'package:flikcar/utils/fonts.dart';
import 'package:flutter/material.dart';

class DealerCarFeatures extends StatelessWidget {
  const DealerCarFeatures({super.key});
  static final List<String> features = [
    "Safety",
    "Interior",
    "Exterior",
    "Entertainment"
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        children: [
          const Heading1(title1: "Car Features", title2: ""),
          const SizedBox(
            height: 15,
          ),
          ExpansionTileGroup(spaceBetweenItem: 0, children: questions()),
        ],
      ),
    );
  }

  List<ExpansionTileItem> questions() {
    return List.generate(
      4,
      (index) => ExpansionTileItem(
        collapsedBackgroundColor: Colors.white,
        backgroundColor: Colors.transparent,
        title: Text(
          features[index],
          style: AppFonts.w700black16,
        ),
        border: Border(
          top: const BorderSide(width: 1, color: Colors.black),
          bottom: BorderSide(
              width: 1,
              color: features[index] == "Entertainment"
                  ? Colors.black
                  : Colors.transparent),
        ),
        iconColor: AppColors.p2,
        themeData: ThemeData(
            splashColor: Colors.transparent,
            splashFactory: NoSplash.splashFactory),
        collapsedIconColor: AppColors.p2,
        expendedBorderColor: Colors.white,
        tilePadding: const EdgeInsets.only(left: 15, bottom: 0, right: 15),
        childrenPadding:
            const EdgeInsets.only(top: 0, left: 15, right: 15, bottom: 15),
        children: List.generate(
          5,
          (index) => Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Row(
              children: [
                Icon(
                  Icons.check,
                  color: AppColors.p2,
                  size: 20,
                ),
                const SizedBox(
                  width: 5,
                ),
                Text("Feature", style: AppFonts.w500dark214),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
