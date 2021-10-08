import 'package:flutter/material.dart';

class TextArea extends StatelessWidget {
  final String hintText;

  TextEditingController textEditingController = TextEditingController();

  TextArea(this.hintText, this.textEditingController, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            borderSide: BorderSide(color: Color(0xffFF007F)),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
