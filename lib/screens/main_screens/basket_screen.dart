import 'package:flutter/material.dart';

class BasketScreen extends StatefulWidget {
  const BasketScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return BasketScreenState();
  }
}

class BasketScreenState extends State {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Basket'),
    );
  }
}
