import 'package:flikcar/common_widgets/primary_button.dart';
import 'package:flikcar/screens/buy_car_flow/schedule_test_drive/widgets/add_address.dart';
import 'package:flikcar/utils/colors.dart';
import 'package:flikcar/utils/fonts.dart';
import 'package:flutter/material.dart';

class CarLocation extends StatelessWidget {
  const CarLocation({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Select Location",
          style: AppFonts.w700black16,
        ),
        const SizedBox(height: 15),
        Row(
          children: [
            SizedBox(
                width: MediaQuery.of(context).size.width / 2.3,
                child: PrimaryButton(
                  title: "Retailer's Shop",
                  function: () {},
                  backgroundColor: Colors.white,
                  borderColor: Colors.black,
                  textStyle: AppFonts.w500black14,
                )),
            const Spacer(),
            SizedBox(
                width: MediaQuery.of(context).size.width / 2.3,
                child: PrimaryButton(
                  title: "Home",
                  function: () {},
                  backgroundColor: AppColors.p2,
                  borderColor: Colors.transparent,
                  textStyle: AppFonts.w500white14,
                )),
          ],
        ),
        const SizedBox(height: 15),
        Container(
          decoration: const BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.25),
                offset: Offset(1.0, 2.0),
                blurRadius: 10.0,
              ),
            ],
          ),
          child: PrimaryButton(
              title: "Add Address",
              function: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AddAddress()));
              },
              borderColor: Colors.transparent,
              backgroundColor: Colors.white,
              textStyle: AppFonts.w500black14),
        ),
        const SizedBox(height: 15),
        Row(
          children: [
            Text("100% Refundable test drive at home deposit",
                style: AppFonts.w500dark214),
            const Spacer(),
            Text(
              "₹999",
              style: AppFonts.w700dark216,
            )
          ],
        )
      ],
    );
  }
}
