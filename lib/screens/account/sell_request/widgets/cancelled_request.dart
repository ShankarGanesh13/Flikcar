import 'package:flikcar/screens/account/sell_request/widgets/sell_request_car_details.dart';
import 'package:flikcar/utils/fonts.dart';
import 'package:flutter/material.dart';

class CancelledRequest extends StatelessWidget {
  const CancelledRequest({super.key});

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
              Row(
                children: [
                  const CircleAvatar(
                    backgroundColor: Color(0xffD30000),
                    radius: 10,
                    child: Icon(
                      Icons.close,
                      color: Colors.white,
                      size: 18,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    "Request Cancelled",
                    style: AppFonts.w700black16,
                  )
                ],
              ),
              const SizedBox(
                height: 15,
              )
            ]),
          ),
        ],
      ),
    );
  }
}
