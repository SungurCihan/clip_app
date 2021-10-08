import 'package:clip_app/models/user_for_login.dart';
import 'package:clip_app/models/user_for_register.dart';
import 'package:http/http.dart' as http;

class AuthApi {
  static Future register(UserForRegister userForRegister) {
    return http
        .post(Uri.parse("https://localhost:44332/api/Auth/register"), body: {
      "email": userForRegister.email,
      "password": userForRegister.password,
      "firstName": userForRegister.firstName,
      "lastName": userForRegister.lastName,
      "phoneNumber": userForRegister.phoneNumber
    });
  }

  static Future registerforPreFlight(UserForRegister userForRegister) {
    return http.post(
        Uri.parse("https://localhost:44332/api/Auth/registerpreflight"),
        body: {
          "email": userForRegister.email,
          "password": userForRegister.password,
          "firstName": userForRegister.firstName,
          "lastName": userForRegister.lastName,
        });
  }

  static Future registerPreFlightForPhone(UserForRegister userForRegister) {
    return http.post(
        Uri.parse("https://localhost:44332/api/Auth/registerpreflightforphone"),
        body: {
          "email": userForRegister.email,
          "password": userForRegister.password,
          "firstName": userForRegister.firstName,
          "lastName": userForRegister.lastName,
          "phoneNumber": userForRegister.phoneNumber
        });
  }

  static Future login(UserForLogin userForLogin) {
    return http
        .post(Uri.parse("https://localhost:44332/api/Auth/login"), body: {
      "email": userForLogin.email,
      "password": userForLogin.password,
    });
  }
}
