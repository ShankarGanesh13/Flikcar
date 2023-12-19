import 'package:flikcar/firebase_models/firebase_auction.dart';
import 'package:flikcar/screens/dealers_flow/auction_screens/dealer_car_list_screen/widget/ongoing_timer2.dart';
import 'package:flikcar/screens/dealers_flow/auction_screens/dealer_car_list_screen/widget/upcoming_timer2.dart';
import 'package:flikcar/screens/dealers_flow/auction_screens/firebase_auction_car_detail_screen/widgets/place_bid_button.dart';
import 'package:flikcar/utils/colors.dart';
import 'package:flikcar/utils/fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class FirebaseBidTextField extends StatefulWidget {
  final FirebaseAuction car;
  const FirebaseBidTextField({
    required this.car,
    super.key,
  });

  @override
  State<FirebaseBidTextField> createState() => _FirebaseBidTextFieldState();
}

class _FirebaseBidTextFieldState extends State<FirebaseBidTextField> {
  TextEditingController controller = TextEditingController();
  @override
  void initState() {
    controller.addListener(() {
      _formatPrice();
    });
    // TODO: implement initState
    super.initState();
  }

  String currentText = "";
  @override
  Widget build(BuildContext context) {
    return checkLiveNew();
  }

  Widget checkLiveNew() {
    DateTime now = DateTime.now();
    DateTime startTime =
        DateTime.fromMillisecondsSinceEpoch(widget.car.startTime);
    DateTime endTime = DateTime.fromMillisecondsSinceEpoch(widget.car.endTime);

    if (endTime.isBefore(now)) {
      // Auction has ended
      debugPrint("auction ended");
      return Row(
        children: [
          Text(
            "Auction has ended",
            style: AppFonts.w500red14,
          ),
        ],
      );
    } else if (startTime.isBefore(now) && endTime.isAfter(now)) {
      // Auction is ongoing
      debugPrint("ongoing");
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          OngoingTimer2(
            endTime: endTime,
            startTime: startTime,
          ),
          SafeArea(
            child: Container(
              width: MediaQuery.of(context).size.width,
              padding:
                  const EdgeInsets.only(left: 0, right: 0, bottom: 10, top: 5),
              child: Row(children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width / 2,
                  height: 40,
                  child: TextFormField(
                    controller: controller,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                    ],
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
                    maxLength: 11,
                    onChanged: (value) {
                      debugPrint(value);
                      setState(() {});
                    },
                  ),
                ),
                controller.text.isNotEmpty
                    ? GestureDetector(
                        onTap: () {
                          controller.clear();
                        },
                        child: const Icon(
                          Icons.close,
                          size: 18,
                        ),
                      )
                    : const SizedBox(),
                const Spacer(),
                PlaceBidButton(
                  controller: controller,
                  currentBid: widget.car.bid != null
                      ? widget.car.bid!.price
                      : widget.car.startPrice,
                  carId: widget.car.id,
                ),
              ]),
            ),
          ),
          Text(
            "Note* Bid Amount should be atleast ₹1000 more than the current bid price",
            style: AppFonts.w500black12,
          ),
        ],
      );
    } else {
      debugPrint("upcoming");
      // Auction is upcoming
      return Padding(
        padding: const EdgeInsets.only(bottom: 15.0),
        child: UpcomingTimer2(
          startTime: startTime,
          endTime: endTime,
        ),
      );
    }
  }

  void _formatPrice() {
    // Get the current text from the controller
    currentText = controller.text;

    if (currentText != "") {
      // Remove any non-numeric characters
      currentText = currentText.replaceAll(RegExp(r'[^0-9]'), '');

      // Parse the text as an integer
      int price = int.tryParse(currentText)!;

      // Format the price using the formatPrice function
      String formattedPrice = formatPrice(price);

      // Set the formatted text back to the controller
      controller.value = controller.value.copyWith(
        text: formattedPrice,
        selection: TextSelection.collapsed(offset: formattedPrice.length),
      );
    }
  }

  String formatPrice(int price) {
    final currencyFormatter =
        NumberFormat.currency(locale: 'en_IN', symbol: '', decimalDigits: 0);
    return currencyFormatter.format(price);
  }
}
