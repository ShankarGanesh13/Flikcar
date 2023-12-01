import 'dart:async';

import 'package:flikcar/screens/dealers_flow/auction_screens/dealer_car_list_screen/widget/ongoing_timer.dart';
import 'package:flikcar/screens/dealers_flow/auction_screens/dealer_car_list_screen/widget/ongoing_timer2.dart';
import 'package:flikcar/utils/fonts.dart';
import 'package:flutter/material.dart';

class UpcomingTimer2 extends StatefulWidget {
  final DateTime startTime;
  final DateTime endTime;

  const UpcomingTimer2(
      {Key? key, required this.startTime, required this.endTime})
      : super(key: key);

  @override
  State<UpcomingTimer2> createState() => _UpcomingTimerState();
}

class _UpcomingTimerState extends State<UpcomingTimer2> {
  late Duration _remainingTime;
  late Timer _timer;
  bool _auctionStarted = false;

  @override
  void initState() {
    super.initState();
    _remainingTime = Duration.zero;
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

      if (now.isAfter(widget.startTime)) {
        // Auction has started
        setState(() {
          _auctionStarted = true;
        });
        _timer.cancel();
      } else {
        setState(() {
          _remainingTime = widget.startTime.difference(now);
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
    return _auctionStarted
        ? OngoingTimer2(startTime: widget.startTime, endTime: widget.endTime)
        : Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Auction Starts in: ",
                style: AppFonts.w500green14,
              ),
              Text(
                _auctionStarted
                    ? ""
                    : _remainingTime != null
                        ? "${_formatDuration(_remainingTime)} hrs"
                        : "00:00:00 hrs",
                style: AppFonts.w500green14,
              ),
            ],
          );
  }
}
