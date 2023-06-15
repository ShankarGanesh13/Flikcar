import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class GetCarDetails {
  static getCarDetails() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    final String? token = sp.getString('userToken');

    var url = Uri.parse(
        'http://webservice.flikcar.com:8000/api/buy-car/get-car-by-body');

    var response = await http.get(url, headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    });
    print(response.body);
  }
}
