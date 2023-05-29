import 'package:flutter/material.dart';

class EvaluationProvider extends ChangeNotifier {
  late String address;
  late DateTime evaluationDate;
  late String evaluationTimeSlot;
  late String phoneNumber;
  late String name;
  late String reasonForSelling;
  late String reasonForCancelling;
  bool whatsappNotification = false;
  int reasonForCancellingIndex = -1;
  int dateTimeIndex = -1;
  int timeSlotIndex = -1;
  int reasonForSellingIndex = -1;

  setEvaluationDateTime({required DateTime date, required int index}) {
    evaluationDate = date;
    dateTimeIndex = index;
    print(evaluationDate);
    notifyListeners();
  }

  setEvaluationTimeSlot({required String timeslot, required int index}) {
    evaluationTimeSlot = timeslot;
    timeSlotIndex = index;
    print(evaluationTimeSlot);
    notifyListeners();
  }

  setReasonForSelling({required String reason, required int index}) {
    reasonForSelling = reason;
    reasonForSellingIndex = index;
    print(reasonForSelling);
    notifyListeners();
  }

  setReasonForCancelling({required String reason, required int index}) {
    reasonForCancelling = reason;
    reasonForCancellingIndex = index;
    notifyListeners();
  }

  turnOnWhatsappNotification() {
    whatsappNotification = whatsappNotification == true ? false : true;
    notifyListeners();
  }

  bookEvaluation(
      {required TextEditingController addressController,
      required TextEditingController nameControler,
      required TextEditingController phoneController}) {}
}
