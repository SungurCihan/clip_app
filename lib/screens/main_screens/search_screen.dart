import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:iconsax/iconsax.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return SearchScreenState();
  }
}

class SearchScreenState extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffE1E3F2),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        bottomOpacity: 0,
        elevation: 0,
        backgroundColor: Color(0xffFFFFFF),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(35),
              bottomRight: Radius.circular(35)),
        ),
        title: Container(
          decoration: BoxDecoration(
              color: Color(0xffF8F8F8),
              borderRadius: BorderRadius.circular(20)),
          height: (MediaQuery.of(context).size.height * 4.5) / 100,
          child: Padding(
            padding: const EdgeInsets.only(left: 15),
            child: TextFormField(
              decoration: InputDecoration(
                border: InputBorder.none,
                fillColor: Color(0xffF8F8F8),
                suffixIcon: Icon(IconlyLight.search, color: Colors.black),
                hintText: 'Ara',
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Widget _postCartRight(double postSize) {
  return Container(
    height: postSize,
  );
}

//Widget _postCartLeft() {}
