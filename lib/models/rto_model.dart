class Rto {
  int id;
  String rtoCode;
  String rtoLocation;
  Rto({required this.rtoCode, required this.rtoLocation, required this.id});

  factory Rto.fromJson(Map<String, dynamic> json) {
    return Rto(
      rtoCode: json["code"],
      rtoLocation: json['location'],
      id: json["id"],
    );
  }
}
