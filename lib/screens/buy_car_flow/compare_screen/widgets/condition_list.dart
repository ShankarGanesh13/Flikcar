import 'package:flikcar/screens/buy_car_flow/compare_screen/widgets/condition_details_card.dart';
import 'package:flikcar/screens/buy_car_flow/compare_screen/widgets/tyre_condition.dart';
import 'package:flutter/material.dart';

import 'overview_details.dart';

class ConditionList extends StatelessWidget {
  const ConditionList({super.key});

  @override
  Widget build(BuildContext context) {
    return const Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: [
            ConditionDetailsCard(
              title: "ENGINE TRANSMISSON",
              value1: "Good Condition",
              value2: "Good Condition",
              indicator1: "good",
              indicator2: "good",
            ),
            ConditionDetailsCard(
              title: "AIR-CONDITIONING",
              value1: "Good Condition",
              value2: "Good Condition",
              indicator1: "good",
              indicator2: "good",
            ),
            ConditionDetailsCard(
              title: "steering, suspension & brakes",
              value1: "Good Condition",
              value2: "Good Condition",
              indicator1: "good",
              indicator2: "good",
            ),
            ConditionDetailsCard(
              title: "electricals & interiors",
              value1: "Good Condition",
              value2: "Imperfection",
              indicator1: "good",
              indicator2: "bad",
            ),
            TyreCondition(title: "Tyres"),
            SizedBox(height: 50)
          ],
        ),
      ),
    );
  }
}
