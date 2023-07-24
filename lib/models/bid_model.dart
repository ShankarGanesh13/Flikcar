class BidModel {
  String id;
  String price;
  String dealerName;
  String createdAt;
  BidModel(
      {required this.createdAt,
      required this.dealerName,
      required this.id,
      required this.price});
  factory BidModel.fromJson(Map<String, dynamic> bid) {
    return BidModel(
        createdAt: bid["createdAt"].toString(),
        dealerName: bid["dealer"]["name"],
        id: bid["id"].toString(),
        price: bid["price"].toString());
  }
}
