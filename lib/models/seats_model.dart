class SeatsModel {
  int id;
  int noOfSeats;
  SeatsModel({required this.id, required this.noOfSeats});
  factory SeatsModel.fromJson(Map<String, dynamic> seat) {
    return SeatsModel(
      id: seat["id"],
      noOfSeats: seat["no_of_seats"],
    );
  }
}
