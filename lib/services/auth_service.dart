import 'dart:convert';

import 'package:http/http.dart' as http;

class AuthService {
  static sendOtp({required String phoneNumber}) async {
    var url =
        Uri.parse('http://webservice.flikcar.com:8000/api/customer/get-otp');
    var contact = 9842129106;

    var requestBody = {
      'contact': "$phoneNumber",
    };

    var response = await http.post(url, body: requestBody);

    if (response.statusCode == 200) {
      print('Response body: ${response.body}');
    } else {
      print('Request failed with status: ${response.statusCode}');
    }
  }
}
