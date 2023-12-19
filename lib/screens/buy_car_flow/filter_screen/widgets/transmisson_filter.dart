import 'package:flikcar/models/body_type_model.dart';
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
  int selectedIndex = -1;
  @override
  Widget build(BuildContext context) {
    List<TransmissionType> transmission =
        context.watch<SearchService>().transmissonType;
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          Text(
            "Transmisson Type",
            style: AppFonts.w700black16,
          ),
          const SizedBox(height: 10),
          SizedBox(
            width: MediaQuery.of(context).size.width / 2,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: transmission.length,
              itemBuilder: (context, index) {
                return SizedBox(
                  height: 45,
                  child: CheckboxListTile(
                    contentPadding:
                        const EdgeInsets.only(left: 0, right: 0, top: 0),
                    activeColor: AppColors.p2,
                    title: Text(
                      transmission[index].transmissionType,
                      style: AppFonts.w500black14,
                    ),
                    value: transmission[index].isSelected,
                    onChanged: (bool? value) {
                      setState(() {
                        transmission[index].isSelected = value!;
                      });
                      Provider.of<SearchService>(context, listen: false)
                          .getSelectedTransmissionTypeFilter(
                              transmissionFilter:
                                  transmission[index].transmissionType);
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
