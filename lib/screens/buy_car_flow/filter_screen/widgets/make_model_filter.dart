import 'package:expansion_tile_group/expansion_tile_group.dart';
import 'package:flikcar/utils/colors.dart';
import 'package:flikcar/utils/fonts.dart';
import 'package:flutter/material.dart';

class MakeModelFilters extends StatefulWidget {
  const MakeModelFilters({super.key});

  @override
  State<MakeModelFilters> createState() => _MakeModelFiltersState();
}

class _MakeModelFiltersState extends State<MakeModelFilters> {
  List<String> brand = [
    "Maruti",
    "Hyundai",
    "Tata",
    "Renault",
    "Toyota",
    "Ford",
    "Skoda",
    "BMW",
    "Audi"
  ];
  int selectedIndex = 0;
  int modelIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: MediaQuery.of(context).size.width / 2,
        child: ExpansionTileGroup(spaceBetweenItem: 0, children: questions()));
  }

  List<ExpansionTileItem> questions() {
    return List.generate(
      8,
      (index) => ExpansionTileItem(
        collapsedBackgroundColor: Colors.white,
        backgroundColor: Colors.transparent,
        title: Row(
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  selectedIndex = index;
                });
              },
              child: Container(
                margin: EdgeInsets.only(right: 8),
                height: 15,
                width: 15,
                decoration:
                    BoxDecoration(border: Border.all(color: Color(0xff161F31))),
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
            ),
            Text(
              brand[index],
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
        tilePadding: const EdgeInsets.only(left: 15, bottom: 0, right: 15),
        childrenPadding:
            const EdgeInsets.only(top: 0, left: 15, right: 15, bottom: 15),
        children: List.generate(
          10,
          (index) => Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      modelIndex = index;
                    });
                  },
                  child: Container(
                    margin: EdgeInsets.only(right: 8),
                    height: 15,
                    width: 15,
                    decoration: BoxDecoration(
                        border: Border.all(color: Color(0xff161F31))),
                    child: Center(
                        child: Icon(
                      Icons.check,
                      size: 14,
                      color: modelIndex == index
                          ? AppColors.s1
                          : Colors.transparent,
                      weight: 2,
                    )),
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                Text("Model", style: AppFonts.w500dark214),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
