import 'package:firebase_auth/firebase_auth.dart';
import 'package:flikcar/common_widgets/snackbar.dart';
import 'package:flikcar/services/firebase_auction_service/firebase_auction_service.dart';
import 'package:flikcar/utils/colors.dart';
import 'package:flikcar/utils/fonts.dart';
import 'package:flutter/material.dart';

class PlaceBidButton extends StatefulWidget {
  final TextEditingController controller;
  final int currentBid;
  final String carId;

  const PlaceBidButton({
    super.key,
    required this.carId,
    required this.controller,
    required this.currentBid,
  });

  @override
  _PlaceBidButtonState createState() => _PlaceBidButtonState();
}

class _PlaceBidButtonState extends State<PlaceBidButton> {
  FirebaseAuth auth = FirebaseAuth.instance;
  final RegExp regex = RegExp(r'[a-zA-Z,]');
  String status = "";
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.p2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        padding: const EdgeInsets.only(left: 10, right: 10),
      ),
      onPressed:
          isLoading ? null : () async => await _placeBid(carId: widget.carId),
      child: Row(
        children: [
          Text(
            "Place Bid",
            style: AppFonts.w500white14,
          ),
          const SizedBox(width: 4),
          if (isLoading)
            const SizedBox(
              width: 18,
              height: 18,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              ),
            )
          else
            const Icon(
              Icons.chevron_right,
              color: Colors.white,
              size: 18,
            ),
        ],
      ),
    );
  }

  Future<void> _placeBid({required String carId}) async {
    setState(() {
      isLoading = true;
    });

    if (widget.controller.text.isNotEmpty) {
      status = await FirebaseAuctionService().placeBid(
        auctionId: carId,
        currentBid: widget.currentBid,
        bidAmount: int.parse(widget.controller.text.replaceAll(regex, '')),
        userId: auth.currentUser!.uid,
        controller: widget.controller,
        phone: auth.currentUser!.phoneNumber!,
        context: context,
        firstName: "",
        lastName: "",
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        MySnackbar.showSnackBar(context, "Bid amount cannot be empty"),
      );
    }

    setState(() {
      isLoading = false;
    });

    print(status);
  }
}
