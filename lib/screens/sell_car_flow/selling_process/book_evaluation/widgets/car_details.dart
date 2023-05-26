import 'package:flikcar/screens/sell_car_flow/selling_process/provider/selling_process_provider.dart';
import 'package:flikcar/utils/fonts.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CarDetails extends StatelessWidget {
  const CarDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            const Color(0xff100049).withOpacity(0.10),
            const Color(0xffB70050).withOpacity(0.10),
          ],
        ),
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(
          children: [
            Text(
              "${context.watch<SellingProcessProvider>().list[2]} ${context.watch<SellingProcessProvider>().list[0]} ${context.watch<SellingProcessProvider>().list[3]}",
              style: AppFonts.w700black16,
            ),
            const Spacer(),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Text(
                "EDIT",
                style: AppFonts.w700p216,
              ),
            )
          ],
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          "${context.watch<SellingProcessProvider>().list[6]}, ${context.watch<SellingProcessProvider>().list[4]}, ${context.watch<SellingProcessProvider>().list[5]}, ${context.watch<SellingProcessProvider>().list[7]}, ${context.watch<SellingProcessProvider>().list[8]}, ${context.watch<SellingProcessProvider>().list[9]}",
          style: AppFonts.w500dark214,
        ),
      ]),
    );
  }
}
