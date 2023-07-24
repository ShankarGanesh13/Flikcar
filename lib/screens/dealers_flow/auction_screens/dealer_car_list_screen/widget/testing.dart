import 'package:flutter/material.dart';
import 'dart:async';

class CountdownPage extends StatefulWidget {
  @override
  _CountdownPageState createState() => _CountdownPageState();
}

class _CountdownPageState extends State<CountdownPage> {
  DateTime _targetTime = DateTime.parse("2023-07-19T15:27:47.000Z");
  Duration? _remainingTime;
  Timer? _timer;

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
      if (_targetTime.isAfter(now)) {
        setState(() {
          _remainingTime = _targetTime.difference(now);
        });
      } else {
        _timer!.cancel();
        // Do something when the countdown is finished
        print("Countdown finished!");
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
    return Scaffold(
      appBar: AppBar(
        title: Text('Countdown Timer'),
      ),
      body: Center(
        child: _remainingTime != null
            ? Text(
                _formatDuration(_remainingTime!),
                style: TextStyle(fontSize: 48),
              )
            : Text(
                'Countdown not started yet',
                style: TextStyle(fontSize: 24),
              ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: CountdownPage(),
  ));
}
