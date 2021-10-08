import 'package:clip_app/screens/registration_screens/login_or_sign_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          textTheme: GoogleFonts.robotoCondensedTextTheme(textTheme).copyWith(
            bodyText1: GoogleFonts.satisfy(textStyle: textTheme.bodyText1),
            bodyText2: GoogleFonts.roboto(textStyle: textTheme.bodyText2),
          ),
        ),
        home: LoginOrSignScreen());
  }
}
