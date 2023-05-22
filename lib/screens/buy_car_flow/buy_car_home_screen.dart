import 'package:flikcar/common_widgets/custom_appbar.dart';
import 'package:flutter/material.dart';

class BuyCarHomeScreen extends StatelessWidget {
  const BuyCarHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.getAppBar(),
      body: const Column(
        children: [
          SizedBox(height: 200),
          Center(
              child: Text(
            "Comming Soon...",
            style: TextStyle(fontSize: 24),
          ))
        ],
      ),
    );
  }
}
