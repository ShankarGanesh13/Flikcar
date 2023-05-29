import 'package:flikcar/common_widgets/heading1.dart';
import 'package:flikcar/screens/sell_car_flow/selling_process/provider/selling_process_provider.dart';
import 'package:flikcar/utils/colors.dart';
import 'package:flikcar/utils/fonts.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SelectVarient extends StatelessWidget {
  final PageController controller;
  const SelectVarient({super.key, required this.controller});

  static const List<String> fuelVarients = [
    "Petrol",
    "Diesel",
    "Electric",
    "Others"
  ];
  static const List<String> transmissonType = ["Automatic", "Manual"];

  static const List<String> transmissonImage = [
    "assets/automatic_icon.png",
    "assets/manual_icon.png"
  ];
  @override
  Widget build(BuildContext context) {
    int fuelSelectedIndex =
        context.watch<SellingProcessProvider>().fuelTypeIndex;
    int transmissonSelectedIndex =
        context.watch<SellingProcessProvider>().transmissonTypeIndex;
    int selectedVarientIndex =
        context.watch<SellingProcessProvider>().varientIndex;
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Heading1(title1: "Select varient of your car", title2: ""),
          const SizedBox(height: 15),
          Text(
            "Fuel Type",
            style: AppFonts.w500dark214,
          ),
          const SizedBox(height: 10),
          Wrap(
            spacing: 40,
            runSpacing: 15,
            children: List.generate(
              4,
              (index) => InkWell(
                onTap: () {
                  Provider.of<SellingProcessProvider>(context, listen: false)
                      .setFuelType(
                          fuel: fuelVarients[index], selectedIndex: index);

                  print(index);
                },
                child: Container(
                  padding: const EdgeInsets.only(top: 5, bottom: 5),
                  height: 40,
                  width: MediaQuery.of(context).size.width / 2.5,
                  decoration: BoxDecoration(
                    color: fuelSelectedIndex == index
                        ? AppColors.p2
                        : Colors.white,
                    border: Border.all(
                      color: AppColors.grey,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 19,
                        width: 25,
                        child: Image.asset("assets/fuel_icon.png",
                            color: fuelSelectedIndex == index
                                ? Colors.white
                                : Colors.black),
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      Text(
                        fuelVarients[index],
                        style: fuelSelectedIndex != index
                            ? AppFonts.w500black14
                            : AppFonts.w500white14,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 15),
          Text(
            "Transmisson Type",
            style: AppFonts.w500dark214,
          ),
          const SizedBox(height: 10),
          Wrap(
            spacing: 40,
            runSpacing: 15,
            children: List.generate(
              2,
              (index) => InkWell(
                onTap: () {
                  Provider.of<SellingProcessProvider>(context, listen: false)
                      .setTransmissonType(
                          transmisson: transmissonType[index],
                          selectedIndex: index);
                },
                child: Container(
                  padding: const EdgeInsets.only(top: 5, bottom: 5),
                  height: 40,
                  width: MediaQuery.of(context).size.width / 2.5,
                  decoration: BoxDecoration(
                    color: transmissonSelectedIndex == index
                        ? AppColors.p2
                        : Colors.white,
                    border: Border.all(
                      color: AppColors.grey,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 21,
                        width: 21,
                        child: Image.asset(transmissonImage[index],
                            color: transmissonSelectedIndex == index
                                ? Colors.white
                                : Colors.black),
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      Text(
                        transmissonType[index],
                        style: transmissonSelectedIndex != index
                            ? AppFonts.w500black14
                            : AppFonts.w500white14,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            "Select the right varient",
            style: AppFonts.w500dark214,
          ),
          const SizedBox(
            height: 10,
          ),
          Wrap(
            spacing: 40,
            runSpacing: 15,
            children: List.generate(
              2,
              (index) => InkWell(
                onTap: () {
                  Provider.of<SellingProcessProvider>(context, listen: false)
                      .setCarVarient(
                          varient: "BMW 220i M Sport", selectedIndex: index);
                },
                child: Container(
                  padding: const EdgeInsets.only(top: 5, bottom: 5),
                  height: 40,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: selectedVarientIndex == index
                        ? AppColors.p2
                        : Colors.white,
                    border: Border.all(
                      color: AppColors.grey,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "BMW 220i M Sport",
                        style: selectedVarientIndex != index
                            ? AppFonts.w500black14
                            : AppFonts.w500white14,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 40,
          ),
        ],
      ),
    );
  }
}
