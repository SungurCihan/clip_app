import 'package:clip_app/screens/helpers/constants/colors_standarts.dart';
import 'package:clip_app/screens/helpers/pink_button.dart';
import 'package:clip_app/screens/helpers/clip_title.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginOrSignScreen extends StatefulWidget {
  const LoginOrSignScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return LoginOrSignInScreenState();
  }
}

class LoginOrSignInScreenState extends State {
  Widget _signUpButton() {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed("/login");
      },
      hoverColor: Colors.transparent,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: Container(
        width: (MediaQuery.of(context).size.width * 19) / 100,
        padding: EdgeInsets.symmetric(vertical: 13),
        alignment: Alignment.center,
        child: Text(
          'Giriş Yap',
          style: TextStyle(fontSize: 20, color: ColorStandarts.clipPink),
        ),
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
            children: <Widget>[
              ClipTitle(90),
              SizedBox(
                height: 80,
              ),
              PinkButton("Kayıt Ol", "/sign", () {}),
              SizedBox(
                height: 20,
              ),
              _signUpButton(),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
