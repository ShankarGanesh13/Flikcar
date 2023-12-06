import 'package:flikcar/firebase_models/firebase_bid.dart';
import 'package:flikcar/firebase_models/firebase_display_car_details.dart';

class FirebaseAuction {
  final String id;
  final FirebaseDisplayCar carDetails;
  final int startPrice;
  final int startTime;
  final FirebaseBid? bid;
  final int endPrice;
  final int endTime;

  FirebaseAuction({
    required this.id,
    required this.carDetails,
    required this.startPrice,
    required this.startTime,
    this.bid,
    required this.endPrice,
    required this.endTime,
  });

  factory FirebaseAuction.fromJson(Map<String, dynamic> json) {
    // print("endtime---- ${json['endTime']}");
    //  print("starttime----- ${json['startTime']}");
    return FirebaseAuction(
      id: json['id'] ?? '',
      carDetails: FirebaseDisplayCar.fromJson(json['carDetails'] ?? {}),
      startPrice: json['startPrice'] ?? 0,
      startTime: json['startTime'] ?? 0,
      bid: json['latestBid'] != null
          ? FirebaseBid.fromJson(json['latestBid'])
          : null,
      endPrice: json['endPrice'] ?? 0,
      endTime: json['endTime'] ?? 0,
    );
  }
}
