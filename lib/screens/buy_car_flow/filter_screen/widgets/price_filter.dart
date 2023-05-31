import 'package:flikcar/utils/colors.dart';
import 'package:flikcar/utils/fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_xlider/flutter_xlider.dart';

class PriceFilter extends StatefulWidget {
  const PriceFilter({super.key});

  @override
  State<PriceFilter> createState() => _PriceFilterState();
}

class _PriceFilterState extends State<PriceFilter> {
  double _lowerValue = 200000;

  double _upperValue = 500000;
  List<String> priceFilter = [
    "Under 3 lakh",
    "From 3 lakh - 5 lakh",
    "From 5 lakh - 10 lakh",
    "From 10 lakh - 15 lakh",
    "From 15 lakh - 20 lakh",
  ];
  int selectedIndex = -1;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Price Range",
          style: AppFonts.w500dark214,
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          "₹${_lowerValue.toInt()} - ₹${_upperValue.toInt()}",
          style: AppFonts.w700black16,
        ),
        const SizedBox(
          height: 50,
        ),
        SizedBox(
          height: 210,
          width: 180,
          child: FlutterSlider(
            axis: Axis.vertical,
            trackBar: FlutterSliderTrackBar(
              inactiveTrackBar: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.black12,
                border: Border.all(width: 3, color: Color(0xff161F31)),
              ),
              activeTrackBar: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: Color(0xff161F31)),
            ),
            tooltip: FlutterSliderTooltip(
                leftPrefix: Text(
                  "₹ ",
                  style: AppFonts.w500white14,
                ),
                rightPrefix: Text(
                  "₹ ",
                  style: AppFonts.w500white14,
                ),
                alwaysShowTooltip: false,
                positionOffset: FlutterSliderTooltipPositionOffset(right: -150),
                textStyle: const TextStyle(fontSize: 17, color: Colors.white),
                boxStyle: const FlutterSliderTooltipBox(
                    decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8),
                    bottomRight: Radius.circular(8),
                  ),
                  color: Color(0xff45C08D),
                ))),
            handler: FlutterSliderHandler(
                decoration: BoxDecoration(),
                child: const CircleAvatar(
                  radius: 7,
                  backgroundColor: Color(0xff45C08D),
                )),
            rightHandler: FlutterSliderHandler(
                decoration: BoxDecoration(),
                child: const CircleAvatar(
                  radius: 7,
                  backgroundColor: Color(0xff45C08D),
                )),
            hatchMark: FlutterSliderHatchMark(
              labels: [
                FlutterSliderHatchMarkLabel(
                    percent: 0,
                    label: Padding(
                      padding: const EdgeInsets.only(right: 110.0),
                      child: Text(
                        'Min Price',
                        style: AppFonts.w500dark214,
                      ),
                    )),
                FlutterSliderHatchMarkLabel(
                    percent: 100,
                    label: Padding(
                      padding: const EdgeInsets.only(right: 110.0),
                      child: Text(
                        'Max Price',
                        style: AppFonts.w500dark214,
                      ),
                    )),
              ],
            ),
            values: [_lowerValue, _upperValue],
            max: 5000000,
            min: 200000,
            rangeSlider: true,
            onDragging: (handlerIndex, lowerValue, upperValue) {
              setState(() {
                _lowerValue = lowerValue;
                _upperValue = upperValue;
              });
            },
          ),
        ),
        const SizedBox(height: 20),
        Text(
          "Suggestions",
          style: AppFonts.w700black16,
        ),
        const SizedBox(height: 15),
        Wrap(
            direction: Axis.vertical,
            runSpacing: 20,
            spacing: 10,
            children: List.generate(
              5,
              (index) => SizedBox(
                width: 200,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndex = index;
                    });
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
                        priceFilter[index],
                        style: AppFonts.w500dark214,
                      )
                    ],
                  ),
                ),
              ),
            ))
      ],
    );
  }
}
