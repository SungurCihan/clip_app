import 'package:clip_app/data_api/auth_api.dart';
import 'package:clip_app/models/user_for_login.dart';
import 'package:clip_app/models/user_for_register.dart';
import 'package:clip_app/models/user_response_model.dart';
import 'package:clip_app/models/user_response_model_for_pre.dart';

class AuthRepository {
  Future<UserResponseModel> login(UserForLogin userForLogin) async {
    try {
      print('attempting login');
      var response = await AuthApi.login(userForLogin);
      return response;
    } catch (e) {
      print(e);
      return UserResponseModel("", "");
    }

    //await Future.delayed(Duration(seconds: 3));
    //print('logged in');
    //throw Exception('failed log in');
  }

  Future<void> register(UserForRegister userForRegister) async {
    print('attempting register');
    await AuthApi.register(userForRegister);
    //await Future.delayed(Duration(seconds: 3));
    //print('logged in');
    //throw Exception('failed log in');
  }

  Future<UserResponseModelForPre> registerforPreFlight(
      UserForRegister userForRegister) async {
    try {
      var response = await AuthApi.registerforPreFlight(userForRegister);
      return response;
    } catch (e) {
      print(e);
      return UserResponseModelForPre(false, e.toString());
    }
  }
}
