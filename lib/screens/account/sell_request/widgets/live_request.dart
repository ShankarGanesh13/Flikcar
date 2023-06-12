import 'package:flikcar/common_widgets/primary_button.dart';
import 'package:flikcar/screens/account/sell_request/widgets/sell_request_car_details.dart';
import 'package:flikcar/utils/fonts.dart';
import 'package:flutter/material.dart';

class LiveRequest extends StatelessWidget {
  const LiveRequest({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                    color: Color.fromRGBO(0, 0, 0, 0.25),
                    offset: Offset(5, 5),
                    blurRadius: 20,
                    spreadRadius: 5,
                  ),
                ]),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const SellRequestCarDetails(),
              const SizedBox(
                height: 15,
              ),
              PrimaryButton(
                  title: "View Details",
                  function: () {},
                  borderColor: const Color(0xff45C08D),
                  backgroundColor: Colors.white,
                  textStyle: AppFonts.w500p215)
            ]),
          ),
        ],
      ),
    );
  }
}
