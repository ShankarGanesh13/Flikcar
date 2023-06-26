import 'package:flutter/material.dart';

class DealerProvider extends ChangeNotifier {
  bool live = true;
  int bidAmount = 200000;
  changeSection({required bool isLive}) {
    live = isLive;

    notifyListeners();
  }

  increaseBidAmount() {
    bidAmount += 500;
    notifyListeners();
  }

  reduceBidAmount() {
    bidAmount = bidAmount - 500;
    notifyListeners();
  }
}
