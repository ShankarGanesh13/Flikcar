class Rto {
  String id;
  String rtoCode;
  String rtoName;
  Rto({required this.rtoCode, required this.rtoName, required this.id});

  factory Rto.fromJson(Map<String, dynamic> json) {
    return Rto(
      rtoCode: json["rtoCode"],
      rtoName: json['rtoName'],
      id: json["id"],
    );
  }
}
