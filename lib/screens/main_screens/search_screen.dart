import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

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
              padding: const EdgeInsets.only(
                left: 15,
              ),
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
        body: SingleChildScrollView(
          padding: EdgeInsets.only(top: 10),
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height,
                width: double.infinity,
                child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: 6,
                    itemBuilder: (context, index) {
                      return _postCartLeft(
                          (MediaQuery.of(context).size.height * 60) / 100,
                          (MediaQuery.of(context).size.width * 31) / 100,
                          index);
                    }),
              ),
              //Text('Aferin')
            ],
          ),
        ));
  }
}

Widget _postCartLeft(double postSize, double postWidth, int isFirst) {
  return Container(
    width: (postWidth * 100) / 31,
    margin: EdgeInsets.only(right: 7, left: 7),
    height: postSize,
    decoration: BoxDecoration(
      boxShadow: const [BoxShadow(color: Color(0xffE1E3F2), spreadRadius: 1)],
      borderRadius: BorderRadius.only(
          topLeft: isFirst == 0 ? Radius.circular(0) : Radius.circular(0),
          topRight: isFirst == 0 ? Radius.circular(0) : Radius.circular(0)),
      // image: DecorationImage(
      //     image: AssetImage('assets/gorsel1.png'), fit: BoxFit.cover)
    ),
    child: FittedBox(
      fit: BoxFit.fill,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20))),
        child: Column(
          children: [
            Row(
              children: [
                Row(
                  children: [
                    _Cart(postSize / 2 - 2, postWidth * 2 + 2, 20),
                    Column(
                      children: [
                        _Cart(postSize / 4 - 2, postWidth, 20),
                        _Cart(postSize / 4 - 2, postWidth, 0)
                      ],
                    )
                  ],
                ),
              ],
            ),
            Row(
              children: [
                _Cart(postSize / 4 - 2, postWidth, 0),
                _Cart(postSize / 4 - 2, postWidth, 0),
                _Cart(postSize / 4 - 2, postWidth, 0),
              ],
            ),
            Row(
              children: [
                _Cart(postSize / 4 - 2, postWidth, 0),
                _Cart(postSize / 4 - 2, postWidth, 0),
                _Cart(postSize / 4 - 2, postWidth, 0),
              ],
            )
          ],
        ),
      ),
    ),
  );
}

//Widget _postCartLeft() {}

Widget _Cart(double postSize, double postWidth, double radius) {
  return Container(
    margin: EdgeInsets.all(1),
    width: postWidth,
    height: postSize,
    // margin: EdgeInsets.only(right: 5, left: 5),
    // padding: EdgeInsets.all(10),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(radius), topRight: Radius.circular(radius)),
      //border: Border.all(color: Colors.black),
      color: Colors.red,
      image: DecorationImage(
          image: AssetImage('assets/gorsel2.png'), fit: BoxFit.cover),
      //borderRadius: BorderRadius.all(Radius.circular(10)),
      //border: Border.all(color: Color(0xffFF007F))
    ),
  );
}
