import 'package:clip_app/screens/helpers/constants/colors_standarts.dart';
import 'package:flutter/material.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return AccountScreenState();
  }
}

class AccountScreenState extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Center(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: Column(
                    children: [
                      Text(
                        '100',
                        style: TextStyle(fontSize: 18),
                      ),
                      Text(
                        'comment',
                        style: TextStyle(
                            color: ColorStandarts.weakGrey, fontSize: 18),
                      )
                    ],
                  ),
                ),
                Column(
                  children: [
                    Container(
                      width: 70,
                      height: 70,
                      margin: EdgeInsets.only(right: 5, left: 5),
                      //padding: EdgeInsets.all(10),
                      child: Image.asset(
                        'assets/byildirim.png',
                        fit: BoxFit.cover,
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          border: Border.all(color: Colors.black)),
                    ),
                    Container(
                        margin: EdgeInsets.only(top: 10.0),
                        child: Text('Burak Yıldırım'))
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: Column(
                    children: [
                      Text(
                        '700',
                        style: TextStyle(fontSize: 18),
                      ),
                      Text(
                        'following',
                        style: TextStyle(
                            color: ColorStandarts.weakGrey, fontSize: 18),
                      )
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
