import 'package:flikcar/services/search_service.dart';
import 'package:flikcar/utils/colors.dart';
import 'package:flikcar/utils/fonts.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TransmissionFilter extends StatefulWidget {
  const TransmissionFilter({super.key});

  @override
  State<TransmissionFilter> createState() => _TransmissionFilterState();
}

class _TransmissionFilterState extends State<TransmissionFilter> {
  List<String> transmisson = ["Automatic", "Manual"];
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Transmisson Type",
            style: AppFonts.w500dark214,
          ),
          const SizedBox(height: 10),
          Text(
            transmisson[selectedIndex],
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
                2,
                (index) => SizedBox(
                  width: 200,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                      });
                      Provider.of<SearchService>(context, listen: false)
                          .addTransmissonFilter(
                              transmission: transmisson[index]);
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
                          transmisson[index],
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
