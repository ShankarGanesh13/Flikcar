import 'package:flikcar/utils/fonts.dart';
import 'package:flutter/material.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        const SizedBox(
          height: 200,
        ),
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
