import 'package:flikcar/models/features_model.dart';
import 'package:flikcar/services/dealer_upload_car.dart';
import 'package:flikcar/utils/colors.dart';
import 'package:flikcar/utils/fonts.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FeatureCheckbox extends StatefulWidget {
  final String feature;
  final List<FeatureModel> features;
  const FeatureCheckbox(
      {super.key, required this.features, required this.feature});

  @override
  State<FeatureCheckbox> createState() => _FeatureCheckboxState();
}

class _FeatureCheckboxState extends State<FeatureCheckbox> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: widget.features.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              if (widget.features[index].isSelected == false) {
                widget.features[index].isSelected = true;
                Provider.of<DealerUploadCar>(context, listen: false)
                    .addFeatures(
                        feature: widget.feature,
                        id: widget.features[index].name);
              } else if (widget.features[index].isSelected == true) {
                widget.features[index].isSelected = false;
                Provider.of<DealerUploadCar>(context, listen: false)
                    .removeFeatures(
                        feature: widget.feature,
                        id: widget.features[index].name);
              }
              setState(() {});
              print(widget.features[index].isSelected);
            },
            child: Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      height: 14,
                      width: 14,
                      margin: EdgeInsets.only(top: 3),
                      decoration: BoxDecoration(
                          color: widget.features[index].isSelected == true
                              ? AppColors.p2
                              : Colors.white,
                          border: Border.all(
                            color: widget.features[index].isSelected != true
                                ? AppColors.black
                                : AppColors.p2,
                          ),
                          borderRadius: BorderRadius.circular(2)),
                      child: const Center(
                        child: Icon(Icons.check,
                            size: 12, weight: 2, color: Colors.white),
                      )),
                  const SizedBox(
                    width: 8,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 2,
                    child: Text(
                      widget.features[index].name,
                      style: AppFonts.w500black14,
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
