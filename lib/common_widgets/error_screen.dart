import 'package:flikcar/common_widgets/custom_appbar.dart';
import 'package:flikcar/common_widgets/loading_widget.dart';
import 'package:flikcar/screens/dealers_flow/dealer_flow.dart';
import 'package:flikcar/utils/fonts.dart';
import 'package:flutter/material.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({super.key});

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
            // Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //       builder: (context) => const DealerCarListScreen(),
            //     ));
          },
          back: true),
      body: Column(children: [
        const SizedBox(
          height: 60,
        ),
        Center(
            child: Text(
          "Something went wrong, try again later",
          style: AppFonts.w500black14,
        ))
      ]),
    );
  }
}
