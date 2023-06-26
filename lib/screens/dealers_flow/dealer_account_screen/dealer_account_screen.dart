import 'package:flikcar/common_widgets/custom_appbar.dart';
import 'package:flikcar/utils/fonts.dart';
import 'package:flutter/material.dart';

class DealerAccountScreen extends StatelessWidget {
  const DealerAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar.getAppBar(),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 50),
            Center(
              child: Text(
                "Comming Soon...",
                style: AppFonts.w700black20,
              ),
            )
          ],
        ));
  }
}
