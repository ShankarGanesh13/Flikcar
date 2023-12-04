class FirebaseBidder {
  final String firstName;
  final String lastName;
  final String userId;

  FirebaseBidder({
    required this.firstName,
    required this.lastName,
    required this.userId,
  });

  factory FirebaseBidder.fromJson(Map<String, dynamic> json) {
    return FirebaseBidder(
      firstName: json['firstName'] ?? '',
      lastName: json['lastName'] ?? '',
      userId: json['userId'] ?? "",
    );
  }
}
