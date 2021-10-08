import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ClipTitle extends StatelessWidget {
  final double fontSize;
  const ClipTitle(this.fontSize, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        text: 'Clip',
        style: GoogleFonts.satisfy(
          textStyle: Theme.of(context).textTheme.bodyText1,
          fontSize: fontSize,
          color: Color(0xffFF007F),
        ),
      ),
    );
  }
}
