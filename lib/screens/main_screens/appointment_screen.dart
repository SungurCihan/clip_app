import 'package:clip_app/screens/helpers/constants/colors_standarts.dart';
import 'package:flutter/material.dart';

class AppointmentScreen extends StatefulWidget {
  const AppointmentScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return AppointmentScreenState();
  }
}

class AppointmentScreenState extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorStandarts.lightBlueBackground,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: (MediaQuery.of(context).size.height) / 2,
                decoration: BoxDecoration(
                  color: ColorStandarts.vanillaWhite,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30)),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: (MediaQuery.of(context).size.height * 40) / 100,
                      width: (MediaQuery.of(context).size.width * 90) / 100,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(
                                'assets/map.png',
                              ),
                              fit: BoxFit.cover)),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                            onPressed: () {},
                            child: Container(
                              height:
                                  (MediaQuery.of(context).size.height * 4.5) /
                                      100,
                              width: (MediaQuery.of(context).size.width * 45) /
                                  100,
                              decoration: BoxDecoration(
                                  color: ColorStandarts.lightBarGrey,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              child: Center(
                                child: Text(
                                  'List Hairdressers',
                                  style:
                                      TextStyle(color: ColorStandarts.textBlue),
                                ),
                              ),
                            )),
                        TextButton(
                            onPressed: () {},
                            child: Container(
                              height:
                                  (MediaQuery.of(context).size.height * 4.5) /
                                      100,
                              width: (MediaQuery.of(context).size.width * 45) /
                                  100,
                              decoration: BoxDecoration(
                                  color: ColorStandarts.lightBarGrey,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              child: Center(
                                  child: Text(
                                'Get Directions',
                                style:
                                    TextStyle(color: ColorStandarts.textBlue),
                              )),
                            ))
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
