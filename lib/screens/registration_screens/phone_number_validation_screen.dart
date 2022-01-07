import 'package:clip_app/bloc/auth/login/login_bloc.dart';
import 'package:clip_app/bloc/auth/login/login_state.dart';
import 'package:clip_app/screens/helpers/clip_title.dart';
import 'package:clip_app/screens/helpers/constants/colors_standarts.dart';
import 'package:clip_app/screens/helpers/pink_button.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PhoneNumberValidation extends StatefulWidget {
  const PhoneNumberValidation({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return PhoneNumberValidationState();
  }
}

class PhoneNumberValidationState extends State {
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
            emailIconColor = ColorStandarts.clipPink;
            passswordIconColor = Colors.grey;
          });
        },
        keyboardType: TextInputType.phone,
        autofocus: false,
        decoration: InputDecoration(
          prefixIcon: CountryCodePicker(
            onChanged: print,
            // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
            initialSelection: 'TR',
            favorite: const ['+90', 'TR'],
            // optional. Shows only country name and flag
            showCountryOnly: false,
            // optional. Shows only country name and flag when popup is closed.
            showOnlyCountryWhenClosed: false,
            // optional. aligns the flag and the Text left
            alignLeft: false,
          ),
          hintText: '(5XX) ___ ____',
          contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: ColorStandarts.clipPink),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {},
      child: Scaffold(
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
              mainAxisAlignment: MainAxisAlignment.start,
              // ignore: prefer_const_literals_to_create_immutables
              children: <Widget>[
                SizedBox(
                    height: (MediaQuery.of(context).size.width * 35) / 100),
                ClipTitle(78),
                SizedBox(
                  height: 80,
                ),
                _email(),
                SizedBox(
                  height: 30,
                ),
                PinkButton("Kod Gönder", "/verification", () {
                  //Navigator.of(context).pushNamed("verification");
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
