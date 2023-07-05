class SearchReqModel {
  List<int> brand;
  List<int> model;
  List<int> bodytype;
  List<int> seats;
  List<String> transmission;
  List<int> owners;
  List<int> modelyear;
  List<int> budget;
  List<int> drivenkm;
  List<int> fuel;
  SearchReqModel({
    required this.brand,
    required this.model,
    required this.bodytype,
    required this.seats,
    required this.transmission,
    required this.owners,
    required this.drivenkm,
    required this.fuel,
    required this.modelyear,
    required this.budget,
  });
  Map<String, dynamic> toJson() {
    return {
      'brand': brand.map((item) => item).toList(),
      'model': model.map((item) => item).toList(),
      'bodytype': bodytype.map((item) => item).toList(),
      'seats': seats.map((item) => item).toList(),
      'transmission': transmission.map((item) => item).toList(),
      'owners': owners.map((item) => item).toList(),
      'modelyear': modelyear.map((item) => item).toList(),
      'budget': budget.map((item) => item).toList(),
      'drivenkm': drivenkm.map((item) => item).toList(),
      'fuel': fuel.map((item) => item).toList(),
    };
  }
}
