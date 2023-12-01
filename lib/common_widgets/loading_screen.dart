import 'package:flikcar/common_widgets/custom_appbar.dart';
import 'package:flikcar/common_widgets/loading_widget.dart';
import 'package:flikcar/screens/dealers_flow/auction_screens/dealer_car_list_screen/dealer_car_list_screen.dart';
import 'package:flikcar/screens/dealers_flow/dealer_flow.dart';
import 'package:flutter/material.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.getAppBarWithContainerSearch(
          function2: () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => const DealerFlow(
                  index: 0,
                ),
              ),
              (route) => false,
            );
          },
          context: context,
          function: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const DealerCarListScreen(),
                ));
          },
          back: true),
      body: const Column(children: [
        SizedBox(
          height: 130,
        ),
        LoadingWidget()
      ]),
    );
  }
}
