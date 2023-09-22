// import 'dart:async';

// import 'package:flikcar/models/auction_car_model.dart';
// import 'package:flikcar/utils/fonts.dart';
// import 'package:flutter/material.dart';

// class OngoingTimer extends StatefulWidget {
//   final AuctionCar car;
//   const OngoingTimer({super.key, required this.car});

//   @override
//   State<OngoingTimer> createState() => _OngoingTimerState();
// }

// class _OngoingTimerState extends State<OngoingTimer> {
//   Duration? _remainingTime;
//   Timer? _timer;
//   bool auctionLive = true;
//   bool upcomingAuction = false;
//   @override
//   void initState() {
//     _startCountdown();
//     // TODO: implement initState
//     super.initState();
//   }

//   @override
//   void dispose() {
//     _timer!.cancel();
//     super.dispose();
//   }

//   String _formatDuration(Duration duration) {
//     String twoDigits(int n) {
//       if (n >= 10) return "$n";
//       return "0$n";
//     }

//     String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
//     String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
//     return "${twoDigits(duration.inHours)}:$twoDigitMinutes:$twoDigitSeconds";
//   }

//   void _startCountdown() {
//     _timer = Timer.periodic(Duration(seconds: 1), (timer) {
//       DateTime now = DateTime.now();
//       if (!DateTime.parse(widget.car.endAuction).isBefore(DateTime.now())) {
//         setState(() {
//           _remainingTime =
//               DateTime.parse(widget.car.endAuction).difference(now);
//         });
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//         child: _formatDuration(_remainingTime!) == "00:00:00"
//             ? const Text("Auction has ended")
//             : Text(
//                 _remainingTime != null
//                     ? "Auction Ends in :\n${_formatDuration(_remainingTime!)} hrs"
//                     : "Auction Ends in : \nhrs",
//                 style: AppFonts.w500red14,
//               ));
//   }
// }
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
      if (!DateTime.parse(widget.car.endAuction).isBefore(DateTime.now())) {
        setState(() {
          _remainingTime =
              DateTime.parse(widget.car.endAuction).difference(now);
        });
      } else {
        // Auction has ended
        _timer?.cancel(); // Stop the timer
        setState(() {
          auctionEnded = true; // Set the auctionEnded flag
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: auctionEnded
          ? Text(
              "Auction has ended",
              style: AppFonts.w500red14,
            )
          : Text(
              _remainingTime != null
                  ? "Auction Ends in :\n${_formatDuration(_remainingTime!)} hrs"
                  : "Auction Ends in : \nhrs",
              style: AppFonts.w500red14,
            ),
    );
  }
}
