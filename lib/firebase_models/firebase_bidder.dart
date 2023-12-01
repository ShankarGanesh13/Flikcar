class FirebaseBidder {
  final String firstName;
  final String lastName;

  FirebaseBidder({
    required this.firstName,
    required this.lastName,
  });

  factory FirebaseBidder.fromJson(Map<String, dynamic> json) {
    return FirebaseBidder(
      firstName: json['firstName'] ?? '',
      lastName: json['lastName'] ?? '',
    );
  }
}
