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
    return Center(
      child: Text('Apointment'),
    );
  }
}
