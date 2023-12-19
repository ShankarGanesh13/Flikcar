import 'package:flikcar/services/search_service.dart';
import 'package:flikcar/utils/colors.dart';
import 'package:flikcar/utils/fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_xlider/flutter_xlider.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class YearFilter extends StatefulWidget {
  const YearFilter({super.key});

  @override
  State<YearFilter> createState() => _YearFilterState();
}

class _YearFilterState extends State<YearFilter> {
  var format = NumberFormat('0000');
  //  print(format.format(100000000));//10,00,00,000.00
  double _lowerValue = 2000;

  double _upperValue = 2024;

  int selectedIndex = -1;
  String selectedSuggestion = "";
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Year Range",
            style: AppFonts.w500dark214,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            "${format.format(_lowerValue.toInt())} - ${format.format(_upperValue.toInt())}",
            style: AppFonts.w700black14,
          ),
          const SizedBox(
            height: 50,
          ),
          SizedBox(
            height: 250,
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
                    color: const Color(0xff161F31)),
              ),
              tooltip: FlutterSliderTooltip(
                  leftPrefix: Text(
                    " ",
                    style: AppFonts.w500white14,
                  ),
                  rightPrefix: Text(
                    " ",
                    style: AppFonts.w500white14,
                  ),
                  alwaysShowTooltip: false,
                  positionOffset:
                      FlutterSliderTooltipPositionOffset(right: -150),
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
                  decoration: const BoxDecoration(),
                  child: const CircleAvatar(
                    radius: 7,
                    backgroundColor: Color(0xff45C08D),
                  )),
              rightHandler: FlutterSliderHandler(
                  decoration: const BoxDecoration(),
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
                          'Min Year',
                          style: AppFonts.w500dark214,
                        ),
                      )),
                  FlutterSliderHatchMarkLabel(
                      percent: 100,
                      label: Padding(
                        padding: const EdgeInsets.only(right: 110.0),
                        child: Text(
                          'Max Year',
                          style: AppFonts.w500dark214,
                        ),
                      )),
                ],
              ),
              values: [_lowerValue, _upperValue],
              max: 2024,
              min: 2000,
              rangeSlider: true,
              onDragging: (handlerIndex, lowerValue, upperValue) {
                setState(() {
                  _lowerValue = lowerValue;
                  _upperValue = upperValue;
                });

                Provider.of<SearchService>(context, listen: false)
                    .getMaxMinYear(
                        max: upperValue.round(), min: lowerValue.round());
              },
            ),
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}
