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
        body: NestedScrollView(
          floatHeaderSlivers: true,
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            _SearchBar(),
          ],
          body: _photos(context),
        ));
  }

  Container _photos(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10),
      height: MediaQuery.of(context).size.height,
      width: double.infinity,
      child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: 9,
          itemBuilder: (context, index) {
            if (index % 2 == 0) {
              return _postCartLeft(
                  (MediaQuery.of(context).size.height * 60) / 100,
                  (MediaQuery.of(context).size.width * 31) / 100,
                  index);
            } else {
              return _postCartRight(
                  (MediaQuery.of(context).size.height * 60) / 100,
                  (MediaQuery.of(context).size.width * 31) / 100,
                  index);
            }
          }),
    );
  }
}

class _SearchBar extends StatelessWidget {
  const _SearchBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      floating: true,
      snap: true,
      automaticallyImplyLeading: false,
      //bottomOpacity: 0,
      elevation: 0,
      backgroundColor: Color(0xffFFFFFF),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(35), bottomRight: Radius.circular(35)),
      ),
      title: Container(
        decoration: BoxDecoration(
            color: Color(0xffF8F8F8), borderRadius: BorderRadius.circular(20)),
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
    );
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
                    _cart(postSize / 2 - 2, postWidth * 2 + 2, 0,
                        isFirst == 0 ? 20 : 0),
                    Column(
                      children: [
                        _cart(postSize / 4 - 2, postWidth,
                            isFirst == 0 ? 20 : 0, 0),
                        _cart(postSize / 4 - 2, postWidth, 0, 0)
                      ],
                    )
                  ],
                ),
              ],
            ),
            Row(
              children: [
                _cart(postSize / 4 - 2, postWidth, 0, 0),
                _cart(postSize / 4 - 2, postWidth, 0, 0),
                _cart(postSize / 4 - 2, postWidth, 0, 0),
              ],
            ),
            Row(
              children: [
                _cart(postSize / 4 - 2, postWidth, 0, 0),
                _cart(postSize / 4 - 2, postWidth, 0, 0),
                _cart(postSize / 4 - 2, postWidth, 0, 0),
              ],
            )
          ],
        ),
      ),
    ),
  );
}

Widget _postCartRight(double postSize, double postWidth, int isFirst) {
  return Container(
    width: (postWidth * 100) / 31,
    margin: EdgeInsets.only(right: 7, left: 7),
    height: postSize,
    decoration: BoxDecoration(
      boxShadow: const [BoxShadow(color: Color(0xffE1E3F2), spreadRadius: 1)],
      borderRadius: BorderRadius.only(
          topLeft: isFirst == 0 ? Radius.circular(0) : Radius.circular(0),
          topRight: isFirst == 0 ? Radius.circular(0) : Radius.circular(0)),
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
                    Column(
                      children: [
                        _cart(postSize / 4 - 2, postWidth,
                            isFirst == 0 ? 20 : 0, 0),
                        _cart(postSize / 4 - 2, postWidth, 0, 0)
                      ],
                    ),
                    _cart(postSize / 2 - 2, postWidth * 2 + 2, 0,
                        isFirst == 0 ? 20 : 0),
                  ],
                ),
              ],
            ),
            Row(
              children: [
                _cart(postSize / 4 - 2, postWidth, 0, 0),
                _cart(postSize / 4 - 2, postWidth, 0, 0),
                _cart(postSize / 4 - 2, postWidth, 0, 0),
              ],
            ),
            Row(
              children: [
                _cart(postSize / 4 - 2, postWidth, 0, 0),
                _cart(postSize / 4 - 2, postWidth, 0, 0),
                _cart(postSize / 4 - 2, postWidth, 0, 0),
              ],
            )
          ],
        ),
      ),
    ),
  );
}

Widget _cart(
    double postSize, double postWidth, double radiusRight, double radiusLeft) {
  return Container(
    margin: EdgeInsets.all(1),
    width: postWidth,
    height: postSize,
    // margin: EdgeInsets.only(right: 5, left: 5),
    // padding: EdgeInsets.all(10),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(radiusLeft),
          topRight: Radius.circular(radiusRight)),
      //border: Border.all(color: Colors.black),
      color: Colors.red,
      image: DecorationImage(
          image: AssetImage('assets/gorsel2.png'), fit: BoxFit.cover),
      //borderRadius: BorderRadius.all(Radius.circular(10)),
      //border: Border.all(color: Color(0xffFF007F))
    ),
  );
}
