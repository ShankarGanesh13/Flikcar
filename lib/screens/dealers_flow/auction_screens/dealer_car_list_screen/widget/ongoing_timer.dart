import 'dart:async';

import 'package:flikcar/models/auction_car_model.dart';
import 'package:flikcar/utils/fonts.dart';
import 'package:flutter/material.dart';

class OngoingTimer extends StatefulWidget {
  final AuctionCar car;
  const OngoingTimer({super.key, required this.car});

  @override
  State<OngoingTimer> createState() => _OngoingTimerState();
}

class _OngoingTimerState extends State<OngoingTimer> {
  Duration? _remainingTime;
  Timer? _timer;
  bool auctionLive = true;
  bool upcomingAuction = false;
  @override
  void initState() {
    _startCountdown();
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    _timer!.cancel();
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
    });
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      _remainingTime != null
          ? "Auction Ends in :\n${_formatDuration(_remainingTime!)} hrs"
          : "Auction Ends in : \nhrs",
      style: AppFonts.w500red14,
    );
  }
}
