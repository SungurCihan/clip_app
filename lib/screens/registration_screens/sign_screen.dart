import 'package:clip_app/data_api/auth_api.dart';
import 'package:clip_app/models/user_for_register.dart';
import 'package:clip_app/screens/helpers/clip_title.dart';
import 'package:clip_app/screens/helpers/pink_button.dart';
import 'package:clip_app/screens/helpers/text_field.dart';
import 'package:clip_app/screens/registration_screens/phone_number_validation_screen.dart';
import 'package:flutter/material.dart';
import 'package:social_auth_buttons/res/buttons/google_auth_button.dart';
import 'package:social_auth_buttons/res/shared/auth_button_style.dart';
import 'package:social_auth_buttons/social_auth_buttons.dart';

class SignScreen extends StatefulWidget {
  const SignScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return SignScreenState();
  }
}

class SignScreenState extends State {
  late Color emailIconColor;
  late Color passswordIconColor;

  bool _isVisible = false;
  bool _isVisibleRepeat = false;

  TextEditingController emailConroller = TextEditingController();
  TextEditingController passwordConroller = TextEditingController();
  TextEditingController passwordRepeatController = TextEditingController();
  TextEditingController firstNameConroller = TextEditingController();
  TextEditingController lastNameConroller = TextEditingController();

  @override
  void initState() {
    emailIconColor = Color(0xff333030);
    passswordIconColor = Color(0xff333030);
    super.initState();
  }

  Widget _email() {
    return Container(
      width: (MediaQuery.of(context).size.width * 73) / 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextFormField(
        onTap: () {
          setState(() {
            emailIconColor = Color(0xffFF007F);
            passswordIconColor = Colors.grey;
          });
        },
        controller: emailConroller,
        keyboardType: TextInputType.emailAddress,
        autofocus: false,
        decoration: InputDecoration(
          hintText: 'E-posta',
          contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xffFF007F)),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }

  Widget _password() {
    return Container(
      width: (MediaQuery.of(context).size.width * 73) / 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextFormField(
        onTap: () {
          setState(() {
            passswordIconColor = Color(0xffFF007F);
            emailIconColor = Colors.grey;
          });
        },
        controller: passwordConroller,
        obscureText: !_isVisible,
        keyboardType: TextInputType.emailAddress,
        autofocus: false,
        decoration: InputDecoration(
          suffixIcon: IconButton(
            onPressed: () {
              setState(() {
                _isVisible = !_isVisible;
              });
            },
            icon: _isVisible
                ? Icon(
                    Icons.visibility,
                    color: Colors.black,
                  )
                : Icon(
                    Icons.visibility_off,
                    color: Colors.grey,
                  ),
          ),
          hintText: "Şifre",
          contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xffFF007F)),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }

  Widget _passwordRepeat() {
    return Container(
      width: (MediaQuery.of(context).size.width * 73) / 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextFormField(
        onTap: () {
          setState(() {
            passswordIconColor = Color(0xffFF007F);
            emailIconColor = Colors.grey;
          });
        },
        controller: passwordRepeatController,
        obscureText: !_isVisibleRepeat,
        keyboardType: TextInputType.emailAddress,
        autofocus: false,
        decoration: InputDecoration(
          suffixIcon: IconButton(
            onPressed: () {
              setState(() {
                _isVisibleRepeat = !_isVisibleRepeat;
              });
            },
            icon: _isVisibleRepeat
                ? Icon(
                    Icons.visibility,
                    color: Colors.black,
                  )
                : Icon(
                    Icons.visibility_off,
                    color: Colors.grey,
                  ),
          ),
          hintText: "Şifre Tekrar",
          contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xffFF007F)),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }

  Widget _signButtons() {
    return Container(
      width: (MediaQuery.of(context).size.width * 63) / 100,
      padding: EdgeInsets.symmetric(vertical: 13),
      //alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          AppleAuthButton(
            onPressed: () {},
            buttonColor: Colors.white,
            splashColor: Colors.grey,
            elevation: 2.0,
            borderRadius: 10.0,
            padding: EdgeInsets.all(8.0),
            text: 'Sign in with Google',
            textStyle: TextStyle(),
            darkMode: false,
            borderColor: Colors.grey,
            borderWidth: 1.0,
            style: AuthButtonStyle.icon,
            width: 65.0,
            height: 65.0,
            iconSize: 45.0,
            separator: 15.0,
          ),
          GoogleAuthButton(
            onPressed: () {},
            buttonColor: Colors.white,
            splashColor: Colors.grey,
            elevation: 2.0,
            borderRadius: 10.0,
            padding: EdgeInsets.all(8.0),
            text: 'Sign in with Google',
            textStyle: TextStyle(),
            darkMode: false,
            borderColor: Colors.grey,
            borderWidth: 1.0,
            style: AuthButtonStyle.icon,
            width: 65.0,
            height: 65.0,
            iconSize: 45.0,
            separator: 15.0,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            // ignore: prefer_const_literals_to_create_immutables
            children: <Widget>[
              //SizedBox(height: (MediaQuery.of(context).size.width * 25) / 100),
              ClipTitle(68),
              SizedBox(
                height: 50,
              ),
              TextArea("Ad", firstNameConroller),
              SizedBox(
                height: 20,
              ),
              TextArea("Soyad", lastNameConroller),
              SizedBox(
                height: 20,
              ),
              _email(),
              SizedBox(
                height: 20,
              ),
              _password(),
              SizedBox(
                height: 20,
              ),
              _passwordRepeat(),
              SizedBox(
                height: 30,
              ),
              PinkButton(
                "Kayıt Ol",
                () => PhoneNumberValidation(),
                registerPreFlight(emailConroller.text, passwordConroller.text, firstNameConroller.text, lastNameConroller.text)
              ),
              SizedBox(
                height: 40,
              ),
              _signButtons(),
            ],
          ),
        ),
      ),
    );
  }
}

void Function() registerPreFlight(String email, String password, String, firstName, String lastName) {
  UserForRegister userToRegister = new UserForRegister(email, password, firstName, lastName, phoneNumber);

  AuthApi.registerforPreFlight(userForRegister)
}
