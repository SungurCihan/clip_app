import 'package:clip_app/screens/registration_screens/sign_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BottomDivider extends StatelessWidget {
  const BottomDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Align(
      alignment: FractionalOffset.bottomCenter,
      child: Container(
        height: (MediaQuery.of(context).size.width * 12) / 100,
        decoration: BoxDecoration(
          border: Border(top: BorderSide(color: Colors.grey)),
        ),
        alignment: Alignment.bottomCenter,
        child: Center(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RichText(
                text: TextSpan(
                    text: "Hesabın yok mu?",
                    style: GoogleFonts.roboto(
                        textStyle: Theme.of(context).textTheme.bodyText2,
                        fontSize: 18))),
            TextButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SignScreen()));
              },
              child: RichText(
                  text: TextSpan(
                text: "Kaydol",
                style: GoogleFonts.roboto(
                  textStyle: Theme.of(context).textTheme.bodyText2,
                  fontSize: 18,
                  color: Color(0xff006FFF),
                ),
              )),
            )
          ],
        )),
      ),
    ));
  }
}
