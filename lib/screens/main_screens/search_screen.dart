import 'package:flutter/material.dart';

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
    return Center(
      child: Text('Search'),
    );
  }
}
