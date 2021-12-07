import 'package:clip_app/screens/helpers/clip_title.dart';
import 'package:clip_app/screens/helpers/constants/colors_standarts.dart';
import 'package:clip_app/screens/main_screens/account_screen.dart';
import 'package:clip_app/screens/main_screens/appointment_screen.dart';
import 'package:clip_app/screens/main_screens/basket_screen.dart';
import 'package:clip_app/screens/main_screens/home_screen.dart';
import 'package:clip_app/screens/main_screens/search_screen.dart';
import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class BottomPageRoute extends StatefulWidget {
  const BottomPageRoute({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return BottomPageRouteState();
  }
}

class BottomPageRouteState extends State {
  late PageController _pageController;
  int _selectedIndex = 0;

  List<Widget> pages = [
    HomeScreen(),
    SearchScreen(),
    AppointmentScreen(),
    BasketScreen(),
    AccountScreen()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      _pageController.jumpToPage(index);
    });
  }

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: PageView(
        onPageChanged: (index) => setState(() {
          _selectedIndex = index;
        }),
        controller: _pageController,
        children: [...pages],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10), topRight: Radius.circular(10))),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
          child: FlashyTabBar(
            selectedIndex: _selectedIndex,
            showElevation: true,
            onItemSelected: (index) => _onItemTapped(index),
            items: [
              FlashyTabBarItem(
                activeColor: ColorStandarts.clipPink,
                icon: Icon(Iconsax.home),
                title: Text('Ana Sayfa'),
              ),
              FlashyTabBarItem(
                activeColor: ColorStandarts.clipPink,
                icon: Icon(Iconsax.search_normal),
                title: Text('Arama'),
              ),
              FlashyTabBarItem(
                activeColor: ColorStandarts.clipPink,
                icon: Icon(Iconsax.calendar_1),
                title: Text('Clip'),
              ),
              FlashyTabBarItem(
                activeColor: ColorStandarts.clipPink,
                icon: Icon(Iconsax.bag_2),
                title: Text('Sepetim'),
              ),
              FlashyTabBarItem(
                activeColor: ColorStandarts.clipPink,
                icon: Icon(Iconsax.user),
                title: Text('Hesabım'),
              ),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        bottomOpacity: 0,
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Iconsax.setting_2,
                  color: Colors.black,
                )),
            ClipTitle(30),
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Iconsax.sms,
                  color: Colors.black,
                )),
          ],
        ),
      ),
    );
  }
}
