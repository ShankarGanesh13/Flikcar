import 'dart:async';

import 'package:flikcar/models/auction_car_model.dart';
import 'package:flikcar/utils/fonts.dart';
import 'package:flutter/material.dart';

class OngoingTimer extends StatefulWidget {
  final DateTime startTime;
  final DateTime endTime;

  OngoingTimer({required this.startTime, required this.endTime});

  @override
  _OngoingTimerState createState() => _OngoingTimerState();
}

class _OngoingTimerState extends State<OngoingTimer> {
  late Duration _remainingTime;
  late Timer _timer;
  bool _auctionEnded = false;

  @override
  void initState() {
    super.initState();
    _remainingTime = widget.endTime.difference(DateTime.now());
    _startCountdown();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _startCountdown() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      DateTime now = DateTime.now();

      if (now.isAfter(widget.endTime)) {
        // Auction has ended
        setState(() {
          _auctionEnded = true;
        });
        _timer.cancel();
      } else {
        setState(() {
          _remainingTime = widget.endTime.difference(now);
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          _auctionEnded ? "Auction has ended" : "Auction Ends in:",
          style: AppFonts.w500red14,
        ),
        Text(
          _auctionEnded
              ? ""
              : _remainingTime != null
                  ? "${_formatDuration(_remainingTime)} hrs"
                  : "00:00:00",
          style: AppFonts.w500red14,
        ),
      ],
    );
  }
}
