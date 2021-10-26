import 'dart:convert';

import 'package:clip_app/models/user_for_login.dart';
import 'package:clip_app/models/user_for_register.dart';
import 'package:clip_app/models/user_response_model.dart';
import 'package:clip_app/models/user_response_model_for_pre.dart';
import 'package:http/http.dart' as http;

class AuthApi {
  static Future register(UserForRegister userForRegister) {
    return http
        .post(Uri.parse("https://10.0.2.2:44332/api/Auth/register"), body: {
      "email": userForRegister.email,
      "password": userForRegister.password,
      "firstName": userForRegister.firstName,
      "lastName": userForRegister.lastName,
      "phoneNumber": userForRegister.phoneNumber
    });
  }

  static Future<UserResponseModelForPre> registerforPreFlight(
      UserForRegister userForRegister) async {
    try {
      var url = Uri.parse("https://10.0.2.2:44332/api/Auth/registerpreflight");
      var response = await http.post(url,
          body: jsonEncode({
            "email": userForRegister.email,
            "password": userForRegister.password,
            "firstName": userForRegister.firstName,
            "lastName": userForRegister.lastName,
            "phoneNumber": userForRegister.phoneNumber
          }),
          headers: {
            "Accept": "application/json",
            "content-type": "application/json"
          });

      final data = jsonDecode(response.body);
      print("Response status: ${response.statusCode}");
      print("Response body: ${response.body}");
      return UserResponseModelForPre(data["success"], data["message"]);
    } catch (e) {
      print(e);
      return UserResponseModelForPre(false, e.toString());
    }
  }

  static Future<UserResponseModelForPre> registerPreFlightForPhone(
      UserForRegister userForRegister) async {
    try {
      var url = Uri.parse(
          "https://10.0.2.2:44332/api/Auth/registerpreflightforphone");
      var response = await http.post(url,
          body: jsonEncode({
            "email": userForRegister.email,
            "password": userForRegister.password,
            "firstName": userForRegister.firstName,
            "lastName": userForRegister.lastName,
            "phoneNumber": userForRegister.phoneNumber
          }),
          headers: {
            "Accept": "application/json",
            "content-type": "application/json"
          });

      final data = jsonDecode(response.body);
      return UserResponseModelForPre(data["success"], data["message"]);
    } catch (e) {
      return UserResponseModelForPre(false, e.toString());
    }
  }

  static Future<UserResponseModel> login(UserForLogin userForLogin) async {
    var url = Uri.parse("https://10.0.2.2:44332/api/Auth/login");
    var response = await http.post(url,
        body: jsonEncode({
          "email": userForLogin.email,
          "password": userForLogin.password,
        }),
        headers: {
          "Accept": "application/json",
          "content-type": "application/json"
        });
    print("Response status: ${response.statusCode}");
    print("Response body: ${response.body}");
    final data = jsonDecode(response.body);
    print(data["token"]);
    print(data["expiration"]);
    return UserResponseModel(data["token"], data["expiration"]);
  }
}
