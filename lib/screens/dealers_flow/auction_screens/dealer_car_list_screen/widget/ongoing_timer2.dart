import 'dart:async';

import 'package:flikcar/models/auction_car_model.dart';
import 'package:flikcar/utils/fonts.dart';
import 'package:flutter/material.dart';

class OngoingTimer2 extends StatefulWidget {
  final AuctionCar car;

  const OngoingTimer2({super.key, required this.car});

  @override
  State<OngoingTimer2> createState() => _OngoingTimer2State();
}

class _OngoingTimer2State extends State<OngoingTimer2> {
  Duration? _remainingTime;
  Timer? _timer;
  bool auctionLive = true;
  bool upcomingAuction = false;
  bool auctionEnded = false; // Added to track auction end state

  @override
  void initState() {
    _startCountdown();
    super.initState();
  }

  @override
  void dispose() {
    _timer
        ?.cancel(); // Use ?. to safely call cancel on a potentially null timer
    super.dispose();
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) {
      if (n >= 10) return "$n";
      return "0$n";
    }

    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return "${twoDigits(duration.inHours)}:$twoDigitMinutes:$twoDigitSeconds";
  }

  void _startCountdown() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      DateTime now = DateTime.now();

      setState(() {
        _remainingTime = DateTime.parse(widget.car.endAuction).difference(now);
      });

      // Check if the auction has ended
      if (_remainingTime?.inSeconds == 0) {
        _timer?.cancel(); // Stop the timer
        setState(() {
          auctionEnded = true; // Set the auctionEnded flag
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      auctionEnded
          ? "Auction has ended"
          : _remainingTime != null
              ? "Auction Ends in : ${_formatDuration(_remainingTime!)} hrs"
              : "Auction Ends in : hrs",
      style: AppFonts.w500red14,
    );
  }
}
