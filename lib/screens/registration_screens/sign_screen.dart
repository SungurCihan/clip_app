import 'package:clip_app/bloc/auth/firebase_auth.dart';
import 'package:clip_app/bloc/auth/form_submission_status.dart';
import 'package:clip_app/bloc/auth/sign_up/sign_bloc.dart';
import 'package:clip_app/bloc/auth/sign_up/sign_event.dart';
import 'package:clip_app/bloc/auth/sign_up/sign_state.dart';
import 'package:clip_app/screens/helpers/clip_title.dart';
import 'package:clip_app/screens/helpers/pink_button_without_navigation.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
  late Color labelColor;

  final _formKey = GlobalKey<FormState>();

  bool _isVisible = false;
  bool _isVisibleRepeat = false;

  TextEditingController emailConroller = TextEditingController();
  TextEditingController passwordConroller = TextEditingController();
  TextEditingController passwordRepeatController = TextEditingController();
  TextEditingController firstNameConroller = TextEditingController();
  TextEditingController lastNameConroller = TextEditingController();

  @override
  void initState() {
    Firebase.initializeApp();
    emailIconColor = Color(0xff333030);
    passswordIconColor = Color(0xff333030);
    labelColor = Colors.grey;
    super.initState();
  }

  Widget _email() {
    return BlocBuilder<SignBloc, SignState>(
      builder: (context, state) {
        return Container(
          width: (MediaQuery.of(context).size.width * 73) / 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          child: TextFormField(
            onTap: () {
              setState(() {
                labelColor = Color(0xffFF007F);
                emailIconColor = Color(0xffFF007F);
                passswordIconColor = Colors.grey;
              });
            },
            onEditingComplete: () {
              labelColor = Colors.grey;
            },
            controller: emailConroller,
            keyboardType: TextInputType.emailAddress,
            autofocus: false,
            decoration: InputDecoration(
              hintText: 'E-posta',
              labelText: "E-posta",
              labelStyle: TextStyle(color: labelColor),
              contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xffFF007F)),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            validator: (value) =>
                state.isValidEmail ? null : "E-posta adresiniz çok kısa.",
            onChanged: (value) =>
                context.read<SignBloc>().add(RegisterMailChanged(mail: value)),
          ),
        );
      },
    );
  }

  Widget _password() {
    return BlocBuilder<SignBloc, SignState>(
      builder: (context, state) {
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
            validator: (value) =>
                state.isValidPassword ? null : "Şifreniz çok kısa",
            onChanged: (value) => context
                .read<SignBloc>()
                .add(RegisterPasswordChanged(password: value)),
          ),
        );
      },
    );
  }

  Widget _passwordRepeat() {
    return BlocBuilder<SignBloc, SignState>(
      builder: (context, state) {
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
            validator: (value) =>
                state.isValidPassswordRepeat ? null : "Şifreler eşleşmiyor",
            onChanged: (value) => context
                .read<SignBloc>()
                .add(RegisterPasswordRepeatChanged(passwordRepeat: value)),
          ),
        );
      },
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
            onPressed: () {
              FirebaseAuthentication fA = FirebaseAuthentication();
              fA.signInWithGoogle().then(
                  (value) => Navigator.of(context).pushNamed("/phoneNumber"));
            },
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

  Widget _firstNameTextField() {
    return BlocBuilder<SignBloc, SignState>(
      builder: (context, state) {
        return Container(
          width: (MediaQuery.of(context).size.width * 73) / 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          child: TextFormField(
            onTap: () {},
            controller: firstNameConroller,
            keyboardType: TextInputType.emailAddress,
            autofocus: false,
            decoration: InputDecoration(
              hintText: "İsim",
              contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xffFF007F)),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            validator: (value) =>
                state.isValidFirstName ? null : "Girrdiğiniz değer çok kısa",
            onChanged: (value) => context
                .read<SignBloc>()
                .add(RegisterFirstNameChanged(firstName: value)),
          ),
        );
      },
    );
  }

  Widget _lastNameTextField() {
    return BlocBuilder<SignBloc, SignState>(
      builder: (context, state) {
        return Container(
          width: (MediaQuery.of(context).size.width * 73) / 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          child: TextFormField(
            onTap: () {},
            controller: lastNameConroller,
            keyboardType: TextInputType.emailAddress,
            autofocus: false,
            decoration: InputDecoration(
              hintText: "Soyisim",
              contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xffFF007F)),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            validator: (value) =>
                state.isValidLastName ? null : "Girrdiğiniz değer çok kısa",
            onChanged: (value) => context
                .read<SignBloc>()
                .add(RegisterLastNameChanged(lastName: value)),
          ),
        );
      },
    );
  }

  Widget _signFormm() {
    return BlocListener<SignBloc, SignState>(
      listener: (context, state) {
        final formStatus = state.formStatus;
        if (formStatus is RegistrationFailed) {
          _showSnackBar(context, formStatus.excepiton.toString());
        } else if (formStatus is RegistrationSuccess) {
          Navigator.of(context).pushNamed("/phoneNumber");
        }
      },
      child: SingleChildScrollView(
        child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5)),
            ),
            child: Form(
              key: _formKey,
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
                  _firstNameTextField(),
                  SizedBox(
                    height: 20,
                  ),
                  _lastNameTextField(),
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
                  BlocBuilder<SignBloc, SignState>(
                    builder: (context, state) {
                      // final isLogin = context.select(
                      //     (LoginBloc loginBloc) => loginBloc.state.formStatus);
                      return state.formStatus is FormSubmitting
                          ? CircularProgressIndicator(
                              color: Color(0xffFF007F),
                            )
                          : PinkButtonWithoutNavigation("Kayıt Ol", () {
                              if (_formKey.currentState!.validate()) {
                                context
                                    .read<SignBloc>()
                                    .add(RegistrationSubmitted());
                                print(state.formStatus.toString());
                              }
                              // if (isLogin is SubmissionSuccess) {
                              //   Navigator.of(context).pushNamed("/phoneNumber");
                              // }
                            });
                    },
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  _signButtons(),
                ],
              ),
            )),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white, body: _signFormm());
  }
}

void _showSnackBar(BuildContext context, String message) {
  final snackBar = SnackBar(
    content: Text(message),
    backgroundColor: Colors.red,
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
  print(message);
}
