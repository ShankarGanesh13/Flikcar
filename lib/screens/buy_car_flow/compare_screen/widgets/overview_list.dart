import 'package:flutter/material.dart';

import 'overview_details.dart';

class OverviewList extends StatelessWidget {
  const OverviewList({super.key});

  @override
  Widget build(BuildContext context) {
    return const Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: [
            OverviewDetails(
                title: "PRICE", value1: "₹345216", value2: "₹445781"),
            OverviewDetails(
                title: "KILOMETERS DRIVEN",
                value1: "45216 km",
                value2: "15781 km"),
            OverviewDetails(
                title: "REGISTRATION RTO", value1: "WB10", value2: "WB12"),
            OverviewDetails(
                title: "REGISTRATION YEAR", value1: "2018", value2: "2019"),
            OverviewDetails(
                title: "FUEL TYPE", value1: "ELECTRIC", value2: "ELECTRIC"),
            OverviewDetails(
                title: "OWNER", value1: "1st Owner", value2: "1st Owner"),
            OverviewDetails(
                title: "TRANSMISSON TYPE",
                value1: "Automatic",
                value2: "Manual"),
            OverviewDetails(
                title: "INSURANCE (VALID UPTO)",
                value1: "24-Aug-2025",
                value2: "24-Aug-2025"),
            SizedBox(height: 50)
          ],
        ),
      ),
    );
  }
}
