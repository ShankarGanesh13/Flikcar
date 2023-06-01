import 'package:flutter/material.dart';

class BuyCarProvider extends ChangeNotifier {
  late String testDriveDate;
  late String testDriveCancellingReason;
  late String testDriveTimeSlot;

  int testDriveCancellingReasonIndex = -1;
  int testDriveDateIndex = -1;
  int testDriveTimeSlotIndex = -1;

  getTestDriveCancellingReason({required String reason, required int index}) {
    testDriveCancellingReason = reason;
    testDriveCancellingReasonIndex = index;
    notifyListeners();
  }

  getTestDriveDate({required String date, required int index}) {
    testDriveDate = date;
    testDriveDateIndex = index;
    notifyListeners();
  }

  getTestDriveTimeSlot({required String timeslot, required int index}) {
    testDriveTimeSlot = timeslot;
    testDriveTimeSlotIndex = index;
    notifyListeners();
  }
}
