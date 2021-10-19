import 'package:clip_app/data_api/auth_api.dart';
import 'package:clip_app/models/user_for_login.dart';
import 'package:clip_app/models/user_for_register.dart';
import 'package:clip_app/models/user_response_model.dart';

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
}
