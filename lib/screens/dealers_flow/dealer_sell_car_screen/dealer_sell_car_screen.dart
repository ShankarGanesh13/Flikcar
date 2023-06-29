import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flikcar/common_widgets/custom_appbar.dart';
import 'package:flikcar/common_widgets/primary_button.dart';
import 'package:flikcar/screens/dealers_flow/dealer_sell_car_screen/dealer_listing_screen/dealer_listing_screen.dart';
import 'package:flikcar/screens/dealers_flow/dealer_sell_car_screen/widgets/dealer_listed_cars.dart';
import 'package:flikcar/utils/colors.dart';
import 'package:flikcar/utils/fonts.dart';
import 'package:flutter/material.dart';

class DealerSellCarScreen extends StatefulWidget {
  const DealerSellCarScreen({super.key});

  @override
  State<DealerSellCarScreen> createState() => _DealerSellCarScreenState();
}

class _DealerSellCarScreenState extends State<DealerSellCarScreen> {
  final List<String> items = [
    'All Cars',
    'Available in stock',
    'Out of stock/sold',
    'Saved cars',
  ];
  String? selectedValue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.getAppBar(),
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
            height: 51,
            color: const Color.fromARGB(255, 227, 255, 228),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                children: [
                  Text(
                    "Your Listings",
                    style: AppFonts.w700black16,
                  ),
                  const Spacer(),
                  const Icon(
                    Icons.share,
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: const EdgeInsets.only(
                        left: 12, right: 12, top: 6, bottom: 6),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    counterText: "",
                    counterStyle: const TextStyle(color: Colors.transparent),
                    hintText: "Search your listings",
                    prefixIcon: const Icon(Icons.search),
                  ),
                  maxLength: 30,
                ),
                const SizedBox(
                  height: 20,
                ),
                PrimaryButton(
                    title: "List a Car",
                    function: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DealerListingScreen()));
                    },
                    borderColor: Colors.transparent,
                    backgroundColor: AppColors.s1,
                    textStyle: AppFonts.w500white14),
                const SizedBox(
                  height: 30,
                ),
                DropdownButtonHideUnderline(
                  child: DropdownButton2<String>(
                    isExpanded: true,
                    hint: Text('All cars', style: AppFonts.w700black14),
                    items: items
                        .map((String item) => DropdownMenuItem<String>(
                              value: item,
                              child: Text(item, style: AppFonts.w700black14),
                            ))
                        .toList(),
                    value: selectedValue,
                    onChanged: (String? value) {
                      setState(() {
                        selectedValue = value;
                      });
                    },
                    buttonStyleData: const ButtonStyleData(
                      padding: EdgeInsets.symmetric(horizontal: 0),
                      height: 40,
                      width: 160,
                    ),
                    menuItemStyleData: const MenuItemStyleData(
                      height: 40,
                    ),
                  ),
                ),
                const DealerListedCars(),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
