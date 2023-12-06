import 'package:flikcar/firebase_models/firebase_auction.dart';
import 'package:flikcar/firebase_models/firebase_display_car_details.dart';

class FirebaseMyBids {
  String id;
  String bidId;
  String vehicleId;
  int price;

  FirebaseMyBids(
      {required this.bidId,
      required this.id,
      required this.price,
      required this.vehicleId});
  factory FirebaseMyBids.fromJson(Map<String, dynamic> json) {
    return FirebaseMyBids(
        bidId: json["bidId"],
        id: json["auctionId"],
        price: json["price"],
        vehicleId: json["vehicleId"]);
  }
}
