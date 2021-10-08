import 'package:clip_app/screens/helpers/bottom_divider.dart';
import 'package:clip_app/screens/helpers/clip_title.dart';
import 'package:clip_app/screens/helpers/pink_button.dart';
import 'package:clip_app/screens/registration_screens/sign_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:social_auth_buttons/res/buttons/google_auth_button.dart';
import 'package:social_auth_buttons/res/shared/auth_button_style.dart';
import 'package:social_auth_buttons/social_auth_buttons.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return LoginScreenState();
  }
}

class LoginScreenState extends State {
  late Color emailIconColor;
  late Color passswordIconColor;

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
        keyboardType: TextInputType.emailAddress,
        autofocus: false,
        decoration: InputDecoration(
          prefixIcon: Icon(
            Iconsax.user,
            color: emailIconColor,
          ),
          hintText: 'Email',
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
        obscureText: true,
        keyboardType: TextInputType.emailAddress,
        autofocus: false,
        decoration: InputDecoration(
          prefixIcon: Icon(
            Iconsax.lock,
            color: passswordIconColor,
          ),
          hintText: 'Password',
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

  Widget _forgotLabel() {
    return TextButton(
        onPressed: () {},
        child: Container(
          width: (MediaQuery.of(context).size.width * 73) / 100,
          //padding: EdgeInsets.symmetric(vertical: 13),
          alignment: Alignment.topRight,
          child: RichText(
              text: TextSpan(
            text: "Şifreni mi unuttun?",
            style: GoogleFonts.roboto(
                textStyle: Theme.of(context).textTheme.bodyText2,
                fontSize: 18,
                color: Color(0xff006FFF),
                fontWeight: FontWeight.bold),
          )),
        ));
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
            mainAxisAlignment: MainAxisAlignment.end,
            // ignore: prefer_const_literals_to_create_immutables
            children: <Widget>[
              SizedBox(height: (MediaQuery.of(context).size.width * 25) / 100),
              ClipTitle(78),
              SizedBox(
                height: 80,
              ),
              _email(),
              SizedBox(
                height: 20,
              ),
              _password(),
              _forgotLabel(),
              SizedBox(
                height: 30,
              ),
              PinkButton("Giriş Yap", () => SignScreen()),
              SizedBox(
                height: 40,
              ),
              _signButtons(),
              BottomDivider()
            ],
          ),
        ),
      ),
    );
  }
}