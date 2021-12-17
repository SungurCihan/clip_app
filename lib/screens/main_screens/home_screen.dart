import 'package:clip_app/screens/helpers/constants/colors_standarts.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:iconly/iconly.dart';
import 'dart:ui' as ui;

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
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          _story(),
        ],
        body: _posts(context),
      ),
    );
  }

  Container _posts(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(27), topRight: Radius.circular(27)),
      ),
      margin: EdgeInsets.only(top: 10),
      height: MediaQuery.of(context).size.height,
      width: double.infinity,
      child: ListView.builder(
          //scrollDirection: Axis.vertical,
          itemCount: 5,
          itemBuilder: (context, index) {
            return Align(
              child: _postCart((MediaQuery.of(context).size.height * 70) / 100),
              alignment: Alignment.topCenter,
              heightFactor: 0.9,
            );
          }),
    );
  }

  SliverAppBar _story() {
    return SliverAppBar(
      backgroundColor: Colors.white,
      actions: [
        Flexible(
          // padding: EdgeInsets.only(right: 10),
          // height: 70,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 70,
              itemBuilder: (context, index) {
                return _storyCart();
              }),
        ),
      ],
    );
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
          border: Border.all(color: ColorStandarts.clipPink)),
    );
  }

  Widget _postCart(double postSize) {
    return Container(
      //margin: EdgeInsets.only(bottom: 10),
      //transform: Matrix4.translationValues(0.0, -50, 0.0),

      //width: 70,
      height: postSize,
      decoration: BoxDecoration(
          boxShadow: const [BoxShadow(color: Colors.white, spreadRadius: 1)],
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
          image: DecorationImage(
              image: AssetImage('assets/gorsel1.png'), fit: BoxFit.cover)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: EdgeInsets.only(top: 10, left: 10),
            child: Row(
              children: [
                Container(
                  width: 50,
                  height: 50,
                  margin: EdgeInsets.only(right: 5, left: 5),
                  padding: EdgeInsets.all(10),
                  //child: Image.asset('assets/logo.png'),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/logo.png'),
                        fit: BoxFit.cover),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    //border: Border.all(color: Color(0xffFF007F))
                  ),
                ),
                Text(
                  'Beauty Saloon',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Container(
            height: (MediaQuery.of(context).size.height * 7) / 100,
            margin: EdgeInsets.only(bottom: 80, right: 15, left: 15),
            padding: EdgeInsets.only(left: 5, right: 5),
            // decoration: BoxDecoration(
            //   borderRadius: BorderRadius.circular(45),
            // ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(45),
              child: BackdropFilter(
                filter: ui.ImageFilter.blur(sigmaX: 50, sigmaY: 50),
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Row(
                            children: [
                              IconButton(
                                iconSize: 30,
                                color: Colors.white,
                                icon: Icon(IconlyLight.heart),
                                onPressed: () {},
                              ),
                              Text(
                                '7.6k',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              )
                            ],
                          ),
                          IconButton(
                            iconSize: 30,
                            color: Colors.white,
                            icon: Icon(IconlyBold.chat),
                            onPressed: () {},
                          ),
                          IconButton(
                            iconSize: 30,
                            color: Colors.white,
                            icon: Icon(IconlyBold.send),
                            onPressed: () {},
                          ),
                        ],
                      ),
                      IconButton(
                        iconSize: 30,
                        color: Colors.white,
                        icon: Icon(IconlyLight.bookmark),
                        onPressed: () {},
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
