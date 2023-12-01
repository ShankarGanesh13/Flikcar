class FirebaseCarOwner {
  String address;
  String id;
  String name;
  String phone;
  FirebaseCarOwner({
    required this.address,
    required this.id,
    required this.name,
    required this.phone,
  });

  factory FirebaseCarOwner.fromJson(Map<String, dynamic> json) {
    return FirebaseCarOwner(
      address: json['address'] as String,
      id: json['id'] as String,
      name: json['name'] as String,
      phone: json['phone'] as String,
    );
  }
}
