import 'package:flikcar/common_widgets/loading_widget.dart';
import 'package:flikcar/models/features_model.dart';
import 'package:flikcar/screens/dealers_flow/dealer_sell_car_screen/dealer_listing_screen/widgets/bool_dropdown_textfield.dart';
import 'package:flikcar/screens/dealers_flow/dealer_sell_car_screen/dealer_listing_screen/widgets/feature_checkbox.dart';
import 'package:flikcar/services/dealer_upload_car.dart';
import 'package:flikcar/utils/fonts.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CarSafety extends StatelessWidget {
  const CarSafety({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Safety",
            style: AppFonts.w700black16,
          ),
          const SizedBox(
            height: 20,
          ),
          FeatureCheckbox(
            features: context.watch<DealerUploadCar>().safetyFeatures,
            feature: "safety",
          )
        ],
      ),
    );
  }
}
