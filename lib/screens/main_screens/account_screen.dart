import 'package:clip_app/screens/helpers/constants/colors_standarts.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

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
      backgroundColor: Color(0xffFFFFFF),
      body: ListView(
        children: [_topSide(), _midSide(context), _bottomSide(context)],
      ),
    );
  }

  Padding _bottomSide(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 35),
      child: Column(
        children: [
          _largeBar(
            context,
            'E-Mail',
            Icon(IconlyLight.message),
          ),
          _largeBar(
            context,
            'Telefon Numarası',
            Icon(IconlyLight.calling),
          ),
          _largeBar(
            context,
            'Siparişlerim',
            Icon(IconlyLight.bag),
          ),
          _largeBar(
            context,
            'Adreslerim',
            Icon(IconlyLight.location),
          ),
          _largeBar(
            context,
            'Cüzdan',
            Icon(IconlyLight.wallet),
          ),
          _largeBar(
            context,
            'Şifre',
            Icon(IconlyLight.unlock),
          ),
          _largeBar(
            context,
            'Yardım',
            Icon(IconlyLight.info_square),
          ),
          _largeBar(
            context,
            'Çıkış',
            Icon(IconlyLight.logout),
          ),
        ],
      ),
    );
  }

  Container _largeBar(BuildContext context, String text, Icon icon) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          color: ColorStandarts.lightBarGrey),
      width: (MediaQuery.of(context).size.width * 90) / 100,
      height: (MediaQuery.of(context).size.height * 6) / 100,
      child: Padding(
        padding: const EdgeInsets.only(left: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            icon,
            SizedBox(
              width: 10,
            ),
            Text(
              text,
              style: TextStyle(fontSize: 15),
            )
          ],
        ),
      ),
    );
  }

  Padding _midSide(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _mediumBar(
            context,
            'Profili Düzenle',
            Icon(
              IconlyLight.edit,
              color: ColorStandarts.blue,
            ),
          ),
          _mediumBar(
            context,
            'Kaydedilenler',
            Icon(
              IconlyLight.edit,
              color: ColorStandarts.blue,
            ),
          )
        ],
      ),
    );
  }

  Container _mediumBar(BuildContext context, String text, Icon icon) {
    return Container(
      height: (MediaQuery.of(context).size.height * 4) / 100,
      width: (MediaQuery.of(context).size.width * 45) / 100,
      decoration: BoxDecoration(
          color: ColorStandarts.lightBarGrey,
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            text,
            style: TextStyle(
              color: Colors.blue,
            ),
          ),
          SizedBox(
            width: 5,
          ),
          icon
        ],
      ),
    );
  }

  Row _topSide() {
    return Row(
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
                style: TextStyle(color: ColorStandarts.weakGrey, fontSize: 18),
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
                style: TextStyle(color: ColorStandarts.weakGrey, fontSize: 18),
              )
            ],
          ),
        ),
      ],
    );
  }
}
