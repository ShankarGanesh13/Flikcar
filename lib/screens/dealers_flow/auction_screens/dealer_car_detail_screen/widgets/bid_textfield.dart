import 'package:flikcar/models/auction_car_model.dart';
import 'package:flikcar/screens/buy_car_flow/car_detailed_view/widgets/nav_button.dart';
import 'package:flikcar/services/auction_services.dart';
import 'package:flikcar/utils/colors.dart';
import 'package:flikcar/utils/fonts.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BidTextField extends StatefulWidget {
  final AuctionCar car;

  const BidTextField({
    super.key,
    required this.car,
  });

  @override
  State<BidTextField> createState() => _BidTextFieldState();
}

class _BidTextFieldState extends State<BidTextField> {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return checkTime(context);
  }

  Widget checkLive(context) {
    if (DateTime.parse(widget.car.startAuction).isAfter(DateTime.now())) {
      return SafeArea(
          child: Container(
        width: MediaQuery.of(context).size.width,
        color: AppColors.s1,
        height: 50,
        child: Center(
          child: Text(
            "Auction Starting Soon...",
            style: AppFonts.w500white14,
          ),
        ),
      ));
    }
    if (!DateTime.parse(widget.car.startAuction).isAfter(DateTime.now())) {
      return SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.only(left: 0, right: 0, bottom: 10, top: 5),
          child: Row(children: [
            SizedBox(
              width: MediaQuery.of(context).size.width / 2,
              height: 40,
              child: TextFormField(
                controller: controller,
                keyboardType: TextInputType.number,
                cursorColor: Colors.black,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.only(
                      left: 12, right: 12, top: 0, bottom: 0),
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(2),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.red),
                    borderRadius: BorderRadius.circular(2),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.s1),
                    borderRadius: BorderRadius.circular(2),
                  ),
                  hintText: "Bid Amount",
                  hintStyle: AppFonts.w500dark214,
                  counterText: "",
                  counterStyle: const TextStyle(color: Colors.transparent),
                ),
                style: AppFonts.w500black14,
                maxLength: 9,
                onChanged: (value) {
                  print(value);
                },
              ),
            ),
            const Spacer(),
            BuyNavButton(
              icon: Icons.chevron_right,
              title: "Place Bid",
              function: () {
                Provider.of<AuctionService>(context, listen: false).placeBid(
                    carId: widget.car.id.toString(),
                    controller: controller,
                    car: widget.car,
                    context: context);
              },
            )
          ]),
        ),
      );
    }

    return const SizedBox();
  }

  Widget checkTime(context) {
    if (DateTime.parse(widget.car.endAuction).isBefore(DateTime.now())) {
      return SafeArea(
          child: Center(
        child: Text(
          "Auction Has Ended",
          style: AppFonts.w500white14,
        ),
      ));
    } else {
      return checkLive(context);
    }
  }
}
