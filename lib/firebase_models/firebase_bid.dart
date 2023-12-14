import 'package:flikcar/firebase_models/firebase_bidder.dart';

class FirebaseBid {
  final String id;
  final FirebaseBidder bidder;
  final int price;

  FirebaseBid({
    required this.id,
    required this.bidder,
    required this.price,
  });

  factory FirebaseBid.fromJson(Map<String, dynamic> json) {
    return FirebaseBid(
      id: json['id'] ?? '',
      bidder: FirebaseBidder.fromJson(json['bidder'] ?? {}),
      price: json['price'],
    );
  }
}
