import 'package:clip_app/bloc/auth/auth_repository.dart';
import 'package:clip_app/bloc/auth/login/login_bloc.dart';
import 'package:clip_app/bloc/auth/sign_up/sign_bloc.dart';
import 'package:clip_app/screens/registration_screens/login_or_sign_screen.dart';
import 'package:clip_app/screens/registration_screens/login_screen.dart';
import 'package:clip_app/screens/registration_screens/phone_number_validation_screen.dart';
import 'package:clip_app/screens/registration_screens/sign_screen.dart';
import 'package:clip_app/screens/registration_screens/verification.dart';
import 'package:clip_app/screens/tutorial/tutorial_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  final LoginBloc _loginBloc = LoginBloc(authRepo: AuthRepository());
  final SignBloc _signBloc = SignBloc(authRepo: AuthRepository());

  Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case "/":
        return MaterialPageRoute(
            builder: (_) => BlocProvider.value(
                  value: _loginBloc,
                  child: TutorialPage(),
                ));
      case "/loginorsign":
        return MaterialPageRoute(
            builder: (_) => BlocProvider.value(
                  value: _loginBloc,
                  child: LoginOrSignScreen(),
                ));
      case "/login":
        return MaterialPageRoute(
            builder: (_) => BlocProvider.value(
                  value: _loginBloc,
                  child: LoginScreen(),
                ));
      case "/sign":
        return MaterialPageRoute(
            builder: (_) => BlocProvider.value(
                  value: _signBloc,
                  child: SignScreen(),
                ));
      case "/phoneNumber":
        return MaterialPageRoute(
            builder: (_) => BlocProvider.value(
                  value: _loginBloc,
                  child: PhoneNumberValidation(),
                ));
      case "/verification":
        return MaterialPageRoute(
            builder: (_) => BlocProvider.value(
                  value: _loginBloc,
                  child: Verificatoin(),
                ));
      default:
        return MaterialPageRoute(
            builder: (_) => BlocProvider.value(
                  value: _loginBloc,
                  child: LoginOrSignScreen(),
                ));
    }
  }

  void dispose() {
    _loginBloc.close();
  }
}
