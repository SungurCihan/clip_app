import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return HomeScreenState();
  }
}

class HomeScreenState extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(right: 10),
        height: 70,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 70,
            itemBuilder: (context, index) {
              return _storyCart();
            }),
      ),
    );
  }
}

Widget _storyCart() {
  return Container(
    width: 70,
    height: 70,
    margin: EdgeInsets.only(right: 5, left: 5),
    padding: EdgeInsets.all(10),
    child: Image.asset('assets/cliplogo.png'),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(27)),
        border: Border.all(color: Color(0xffFF007F))),
  );
}
