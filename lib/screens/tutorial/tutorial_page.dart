import 'package:clip_app/screens/helpers/constants/colors_standarts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TutorialPage extends StatefulWidget {
  const TutorialPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return TutorialPageState();
  }
}

class TutorialPageState extends State {
  late PageController _pageController;
  int currentIndex = 0;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 20, top: 20),
            child: TextButton(
              child: Text(
                'Skip',
                style: TextStyle(
                    color: ColorStandarts.clipPink,
                    fontSize: 18,
                    fontWeight: FontWeight.w400),
              ),
              onPressed: () {
                Navigator.of(context).pushNamed('/loginorsign');
              },
            ),
          )
        ],
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          PageView(
            onPageChanged: (int page) {
              setState(() {
                currentIndex = page;
                if (currentIndex == 3) {
                  Navigator.of(context).pushNamed("/loginorsign");
                }
              });
            },
            controller: _pageController,
            children: <Widget>[
              makePage(
                image: 'assets/cliplogo.png',
                title: 'Yakındaki kuaförleri bul',
              ),
              makePage(
                  //reverse: true,
                  image: 'assets/cliplogo.png',
                  title: 'Kuaförleri incele'),
              makePage(image: 'assets/cliplogo.png', title: 'Hızlı randevu al'),
              makePage(image: 'assets/cliplogo.png', title: 'Hızlı randevu al'),
              //LoginOrSignScreen()
            ],
          ),
          Container(
            margin: EdgeInsets.only(bottom: 60),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: _buildIndicator(),
            ),
          )
        ],
      ),
    );
  }

  Widget makePage({image, title, content, reverse = false}) {
    return Container(
      padding: EdgeInsets.only(left: 50, right: 50, bottom: 60),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          !reverse
              ? Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Image.asset(image),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                  ],
                )
              : SizedBox(),
          Text(
            title,
            style: TextStyle(
                color: Colors.black, fontSize: 30, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 20,
          ),
          // Text(
          //   content,
          //   textAlign: TextAlign.center,
          //   style: TextStyle(
          //       color: Colors.green, fontSize: 20, fontWeight: FontWeight.w400),
          // ),
          reverse
              ? Column(
                  children: <Widget>[
                    SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Image.asset(image),
                    ),
                  ],
                )
              : SizedBox(),
        ],
      ),
    );
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      height: 6,
      width: isActive ? 30 : 6,
      margin: EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
          color: ColorStandarts.clipPink,
          borderRadius: BorderRadius.circular(5)),
    );
  }

  List<Widget> _buildIndicator() {
    List<Widget> indicators = [];
    for (int i = 0; i < 3; i++) {
      if (currentIndex == i) {
        indicators.add(_indicator(true));
      } else {
        indicators.add(_indicator(false));
      }
    }

    return indicators;
  }
}
