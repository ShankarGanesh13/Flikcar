import 'dart:async';

import 'package:flikcar/common_widgets/snackbar.dart';
import 'package:flikcar/models/auction_car_model.dart';
import 'package:flikcar/utils/fonts.dart';
import 'package:flutter/material.dart';

class TimerText2 extends StatefulWidget {
  final String text;
  final AuctionCar car;
  const TimerText2({super.key, required this.car, required this.text});

  @override
  State<TimerText2> createState() => _TimerTextState2();
}

class _TimerTextState2 extends State<TimerText2> {
  Duration? _remainingTime;
  Timer? _timer;
  bool auctionLive = true;
  bool upcomingAuction = false;

  @override
  void initState() {
    super.initState();
    _startCountdown();
  }

  @override
  void dispose() {
    _timer!.cancel();
    super.dispose();
  }

  void _startCountdown() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      DateTime now = DateTime.now();
      if (DateTime.parse(widget.car.endAuction).isAfter(now) &&
          DateTime.parse(widget.car.startAuction).isBefore(now)) {
        setState(() {
          _remainingTime =
              DateTime.parse(widget.car.endAuction).difference(now);
        });
      }
      if (DateTime.parse(widget.car.startAuction).isAfter(now)) {
        upcomingAuction = true;
        setState(() {
          _remainingTime =
              DateTime.parse(widget.car.startAuction).difference(now);
        });
      }
    });
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

  @override
  Widget build(BuildContext context) {
    return upcomingAuction == false
        ? Text(
            _remainingTime != null
                ? "Auction ends in : ${_formatDuration(_remainingTime!)} hrs"
                : "${widget.text} hrs",
            style: AppFonts.w500red14,
          )
        : Text(
            _remainingTime != null
                ? "Auction Starts in : ${_formatDuration(_remainingTime!)} hrs"
                : "${widget.text} hrs",
            style: AppFonts.w500green14,
          );
  }
}
