import 'dart:async';

import 'package:flikcar/models/auction_car_model.dart';
import 'package:flikcar/screens/dealers_flow/auction_screens/dealer_car_list_screen/widget/ongoing_timer.dart';
import 'package:flikcar/utils/fonts.dart';
import 'package:flutter/material.dart';

class UpcomingTimer extends StatefulWidget {
  final AuctionCar car;

  const UpcomingTimer({super.key, required this.car});

  @override
  State<UpcomingTimer> createState() => _UpcomingTimerState();
}

class _UpcomingTimerState extends State<UpcomingTimer> {
  Duration? _remainingTime;
  Timer? _timer;
  bool auctionLive = true;
  bool upcomingAuction = false;
  bool auctionStarted = false; // Added to track auction start state

  @override
  void initState() {
    super.initState();
    _startCountdown();
  }

  @override
  void dispose() {
    _timer?.cancel();
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
        _remainingTime =
            DateTime.parse(widget.car.startAuction).difference(now);
      });

      // Check if the auction has started
      if (_remainingTime?.inSeconds == 0) {
        _timer?.cancel(); // Stop the timer
        setState(() {
          auctionStarted = true; // Set the auctionStarted flag
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return auctionStarted
        ? OngoingTimer(car: widget.car) // Display OngoingTimer widget
        : Text(
            _remainingTime != null
                ? "Auction Starts in :\n${_formatDuration(_remainingTime!)} hrs"
                : "Auction Starts in : \nhrs",
            style: AppFonts.w500green14,
          );
  }
}
