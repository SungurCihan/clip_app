import 'dart:io';
import 'package:clip_app/screens/main_screens/bottom_page_route.dart';
import 'package:clip_app/screens/router/app_router.dart';
import 'package:clip_app/screens/tutorial/tutorial_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  HttpOverrides.global = MyHttpOverrides();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AppRouter _appRouter = AppRouter();

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
      onGenerateRoute: _appRouter.onGenerateRoute,
      home: TutorialPage(),
      debugShowCheckedModeBanner: false,
    );
  }

  @override
  void dispose() {
    _appRouter.dispose();
    super.dispose();
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
