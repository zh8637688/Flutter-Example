import 'package:flutter/material.dart';

class HomeFragment extends StatefulWidget {

  HomeFragment({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _FragmentState();
  }
}

class _FragmentState extends State<HomeFragment> {
  @override
  Widget build(BuildContext context) {
    return Text('Home');
  }
}