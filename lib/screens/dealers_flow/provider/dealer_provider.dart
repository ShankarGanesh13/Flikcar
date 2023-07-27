import 'package:flutter/material.dart';

class DealerProvider extends ChangeNotifier {
  bool live = true;
  int bidAmount = 200000;
 
  increaseBidAmount() {
    bidAmount += 500;
    notifyListeners();
  }

  reduceBidAmount() {
    bidAmount = bidAmount - 500;
    notifyListeners();
  }
}
