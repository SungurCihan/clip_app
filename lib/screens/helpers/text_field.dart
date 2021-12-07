import 'package:clip_app/bloc/auth/sign_up/sign_bloc.dart';
import 'package:clip_app/bloc/auth/sign_up/sign_event.dart';
import 'package:clip_app/bloc/auth/sign_up/sign_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'constants/colors_standarts.dart';

class TextArea extends StatelessWidget {
  final String hintText;

  TextEditingController textEditingController = TextEditingController();

  TextArea(this.hintText, this.textEditingController, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignBloc, SignState>(
      builder: (context, state) {
        return Container(
          width: (MediaQuery.of(context).size.width * 73) / 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          child: TextFormField(
            onTap: () {},
            controller: textEditingController,
            keyboardType: TextInputType.emailAddress,
            autofocus: false,
            decoration: InputDecoration(
              hintText: hintText,
              contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: ColorStandarts.clipPink),
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
}
