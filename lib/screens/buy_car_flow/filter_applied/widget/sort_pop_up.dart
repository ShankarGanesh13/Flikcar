import 'package:flikcar/services/search_service.dart';
import 'package:flikcar/utils/colors.dart';
import 'package:flikcar/utils/fonts.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SortPopUp extends StatefulWidget {
  const SortPopUp({super.key});

  @override
  State<SortPopUp> createState() => _SortPopUpState();
}

class _SortPopUpState extends State<SortPopUp> {
  @override
  Widget build(BuildContext context) {
    int sort = context.watch<SearchService>().sort;
    return SizedBox(
      height: 60,
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              Provider.of<SearchService>(context, listen: false)
                  .getSortId(sortId: 0);
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
                      color: sort == 0 ? AppColors.p2 : Colors.transparent,
                      weight: 2,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                Text("Price low to high", style: AppFonts.w500dark214),
              ],
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          GestureDetector(
            onTap: () {
              Provider.of<SearchService>(context, listen: false)
                  .getSortId(sortId: 1);
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
                      color: sort == 1 ? AppColors.p2 : Colors.transparent,
                      weight: 2,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                Text("Price high to low", style: AppFonts.w500dark214),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
